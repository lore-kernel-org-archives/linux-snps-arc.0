From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 6 Jun 2019 22:53:40 +0000
Subject: [RFC-private] ARC: jump label: implement jump label patching
References: <20190422180144.27452-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2524D99@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/22/19 11:02 AM, Eugeniy Paltsev wrote:
> Implement jump label patching for ARC. Jump labels provide
> an interface to generate dynamic branches using
> self-modifying code.
>
> This allows us to implement conditional branches where
> changing branch direction is expensive but branch selection
> is basically 'free'

I played with this some - stared at generated code - LGTM overall, minor points below
For real patch do CC PeterZ and some of the other folsk who have recently touch
linux/jump_label.h

>
> TODO:
>  * Think about interaction with arc_cache_init().
>    In current implementation we call flush_icache_range() to
>    make instruction we wrote visible to CPU (CPUs).
>    So we couldn't switch jump labels in code before
>    arc_cache_init() is called for master CPU (as we don't
>    configure several cache callbacks yet)

The "switching" of branch (and needed icache flush) can only happen after system
has booted. So this shd not be an issue.

>  * Move instruction generation test to more appropriate place.

Maybe - im not sure either.

>  * Care about jump_table alignment in linker script (is it
>    required or not?)

>From looking at the generated linker script, it is already aligned.

|
|     . = *ALIGN(8);* __start___jump_table = .; KEEP(*(__jump_table))
__stop___jump_table = .;
|

>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/Kconfig                  |   1 +
>  arch/arc/include/asm/jump_label.h |  48 ++++++++++++++++++
>  arch/arc/kernel/Makefile          |   1 +
>  arch/arc/kernel/jump_label.c      | 102 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 152 insertions(+)
>  create mode 100644 arch/arc/include/asm/jump_label.h
>  create mode 100644 arch/arc/kernel/jump_label.c
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index c781e45d1d99..4b3d33e6aae3 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -47,6 +47,7 @@ config ARC
>  	select OF_EARLY_FLATTREE
>  	select PCI_SYSCALL if PCI
>  	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
> +	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
>  
>  config ARCH_HAS_CACHE_LINE_SIZE
>  	def_bool y
> diff --git a/arch/arc/include/asm/jump_label.h b/arch/arc/include/asm/jump_label.h
> new file mode 100644
> index 000000000000..877b8fcc512c
> --- /dev/null
> +++ b/arch/arc/include/asm/jump_label.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARC_JUMP_LABEL_H
> +#define _ASM_ARC_JUMP_LABEL_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +
> +#define JUMP_LABEL_NOP_SIZE 4
> +
> +static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
> +{
> +	asm_volatile_goto("1:\n\t"
> +		 "nop \n\t"
> +		 ".pushsection __jump_table,  \"aw\"\n\t"
> +		 ".word 1b, %l[l_yes], %c0\n\t"
> +		 ".popsection\n\t"
> +		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool arch_static_branch_jump(struct static_key *key, bool branch)
> +{
> +	asm_volatile_goto("1:\n\t"
> +		 "b %l[l_yes]\n\t"
> +		 ".pushsection __jump_table,  \"aw\"\n\t"
> +		 ".word 1b, %l[l_yes], %c0\n\t"
> +		 ".popsection\n\t"
> +		 : :  "i" (&((char *)key)[branch]) :  : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +typedef u32 jump_label_t;
> +
> +struct jump_entry {
> +	jump_label_t code;
> +	jump_label_t target;
> +	jump_label_t key;
> +};
> +
> +#endif  /* __ASSEMBLY__ */
> +#endif
> diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
> index 2dc5f4296d44..307f74156d99 100644
> --- a/arch/arc/kernel/Makefile
> +++ b/arch/arc/kernel/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_ARC_EMUL_UNALIGNED) 	+= unaligned.o
>  obj-$(CONFIG_KGDB)			+= kgdb.o
>  obj-$(CONFIG_ARC_METAWARE_HLINK)	+= arc_hostlink.o
>  obj-$(CONFIG_PERF_EVENTS)		+= perf_event.o
> +obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
>  
>  obj-$(CONFIG_ARC_FPU_SAVE_RESTORE)	+= fpu.o
>  CFLAGS_fpu.o   += -mdpfp
> diff --git a/arch/arc/kernel/jump_label.c b/arch/arc/kernel/jump_label.c
> new file mode 100644
> index 000000000000..7edb713badaf
> --- /dev/null
> +++ b/arch/arc/kernel/jump_label.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/jump_label.h>
> +
> +#include "asm/cache.h"
> +#include "asm/cacheflush.h"
> +
> +static inline u32 arc_gen_nop(void)
> +{
> +	/* 1x 32bit NOP in middle endian */
> +	return 0x7000264a;
> +}
> +
> +/*
> + * ARCv2 Branch unconditionally instruction:
> + * 00000ssssssssss1SSSSSSSSSSNRtttt
> + * s S[n:0] lower bits signed immediate (number is bitfield size)
> + * S S[m:n+1] upper bits signed immediate (number is bitfield size)
> + * t S[24:21] upper bits signed immediate (branch unconditionally far)
> + * N N <.d> delay slot mode
> + * R R Reserved
> + */
> +static inline u32 arc_gen_branch(jump_label_t pc, jump_label_t target)
> +{
> +	u32 instruction_l, instruction_r;

Does defining these as u16 generate slightly better code ?

> +	u32 s, S, t;

ditto

> +
> +	/* check for s25 offset */
> +	if ((s32)u_offset < -16777216 || (s32)u_offset > 16777214) {
> +		pr_err("err: try to generate branch instruction with offset (%d) not fit in s25\n",
> +		       (s32)u_offset);
> +
> +		return 0;
> +	}
> +
> +	if (u_offset & 0x1) {
> +		pr_err("err: try to generate branch instruction with offset (%d) unaligned to half-word\n",
> +		       (s32)u_offset);
> +
> +		return 0;
> +	}
> +
> +	s = (u_offset >> 1)  & GENMASK(9, 0);
> +	S = (u_offset >> 10) & GENMASK(9, 0);
> +	t = (u_offset >> 24) & GENMASK(3, 0);
> +
> +	/* 00000ssssssssss1 */
> +	instruction_l = (s << 1) | 0x1;
> +	/* SSSSSSSSSSNRtttt */
> +	instruction_r = (S << 6) | t;
> +
> +	return (instruction_r << 16) | (instruction_l & GENMASK(15, 0));

maybe compiler is already optimizing away stuff based on prior masking above.

> +}
> +
> +void arch_jump_label_transform(struct jump_entry *entry,
> +			       enum jump_label_type type)
> +{
> +	jump_label_t *instr_addr = (jump_label_t *)entry->code;
> +	u32 instr;
> +
> +	if (type == JUMP_LABEL_JMP)
> +		instr = arc_gen_branch(entry->code, entry->target);
> +	else
> +		instr = arc_gen_nop();

You need to check for !instr error and bail if so.
I'm surprised there's no error propagation back to core code.

> +
> +	WRITE_ONCE(*instr_addr, instr);
> +	flush_icache_range(entry->code, entry->code + JUMP_LABEL_NOP_SIZE);
> +}
> +
> +void arch_jump_label_transform_static(struct jump_entry *entry,
> +				      enum jump_label_type type)
> +{
> +	/*
> +	 * We use only one NOP type (1x, 4 byte) in arch_static_branch, so
> +	 * there's no need to patch an identical NOP over the top of it here.
> +	 * The generic code calls 'arch_jump_label_transform' if the NOP needs
> +	 * to be replaced by a branch, so 'arch_jump_label_transform_static' is
> +	 * newer called with type other than JUMP_LABEL_NOP.
> +	 */
> +	BUG_ON(type != JUMP_LABEL_NOP);
> +}
> +
> +#ifdef CONFIG_STATIC_KEYS_SELFTEST
> +static __init int instr_gen_test(void)
> +{
> +	pr_info("ARC: instruction generation self-test\n");
> +
> +	/* branch with negative offset */
> +	if (arc_gen_branch(0x90007548, 0x90007514) != 0xffcf07cd)
> +		pr_err("FAIL: arc_gen_branch(0x90007548, 0x90007514) != 0xffcf07cd\n");
> +
> +	/* branch with positive offset */
> +	if (arc_gen_branch(0x90007514, 0x9000752c) != 0x00000019)
> +		pr_err("FAIL: arc_gen_branch(0x90007514, 0x9000752c) != 0x00000019\n");
> +
> +	return 0;
> +}
> +early_initcall(instr_gen_test);
> +#endif /* STATIC_KEYS_SELFTEST */
