From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 17 Jul 2019 15:09:34 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57076361ad37f4fe7a5584643ae47adf30a99d35.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
I'm finally back, so see my comments below.

On Tue, 2019-06-18@16:16 +0000, Vineet Gupta wrote:
> On 6/14/19 9:41 AM, Eugeniy Paltsev wrote:
> > Implement jump label patching for ARC. Jump labels provide
> > an interface to generate dynamic branches using
> > self-modifying code.
> > 
> > This allows us to implement conditional branches where
> > changing branch direction is expensive but branch selection
> > is basically 'free'
> > 
> > This implementation uses 32-bit NOP and BRANCH instructions
> > which forced to be aligned by 4 to guarantee that they don't
> > cross L1 cache line and can be update atomically.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> LGTM overall - nits below.
> 
> > ---
> >  arch/arc/Kconfig                  |   8 ++
> >  arch/arc/include/asm/jump_label.h |  68 ++++++++++++
> >  arch/arc/kernel/Makefile          |   1 +
> >  arch/arc/kernel/jump_label.c      | 168 ++++++++++++++++++++++++++++++
> >  4 files changed, 245 insertions(+)
> >  create mode 100644 arch/arc/include/asm/jump_label.h
> >  create mode 100644 arch/arc/kernel/jump_label.c
> > 
> > diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> > index c781e45d1d99..b1313e016c54 100644
> > --- a/arch/arc/Kconfig
> > +++ b/arch/arc/Kconfig
> > @@ -47,6 +47,7 @@ config ARC
> >  	select OF_EARLY_FLATTREE
> >  	select PCI_SYSCALL if PCI
> >  	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
> > +	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
> >  
> >  config ARCH_HAS_CACHE_LINE_SIZE
> >  	def_bool y
> > @@ -529,6 +530,13 @@ config ARC_DW2_UNWIND
> >  config ARC_DBG_TLB_PARANOIA
> >  	bool "Paranoia Checks in Low Level TLB Handlers"
> >  
> > +config ARC_DBG_STATIC_KEYS
> > +	bool "Paranoid checks in Static Keys code"
> > +	depends on JUMP_LABEL
> > +	select STATIC_KEYS_SELFTEST
> > +	help
> > +	  Enable paranoid checks and self-test of both ARC-specific and generic
> > +	  part of static-keys-related code.
> 
> Why can't we just enable this if STATIC_KEYS_SELFTEST

As we extent STATIC_KEYS_SELFTEST option such dependency looks more reasonable for me
(we enable our checks -> lets enable corresponding generic ones)
I don't insist, though.

> >  endif
> >  
> >  config ARC_BUILTIN_DTB_NAME
> > diff --git a/arch/arc/include/asm/jump_label.h b/arch/arc/include/asm/jump_label.h
> > new file mode 100644
> > index 000000000000..8971d0608f2c
> > --- /dev/null
> > +++ b/arch/arc/include/asm/jump_label.h
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_ARC_JUMP_LABEL_H
> > +#define _ASM_ARC_JUMP_LABEL_H
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <linux/types.h>
> > +
> > +#define JUMP_LABEL_NOP_SIZE 4
> > +
> > +/*
> > + * To make atomic update of patched instruction available we need to guarantee
> > + * that this instruction doesn't cross L1 cache line boundary.
> > + *
> > + * As of today we simply align instruction which can be patched by 4 byte using
> > + * ".balign 4" directive. In that case patched instruction is aligned with one
> > + * 16-bit NOP_S if this is required.
> > + * However 'align by 4' directive is much stricter than it actually required.
> > + * It's enough that our 32-bit instruction don't cross l1 cache line boundary
> > + * which can be achieved by using ".bundle_align_mode" directive. That will save
> > + * us from adding useless NOP_S padding in most of the cases.
> > + *
> > + * TODO: switch to ".bundle_align_mode" directive using whin it will be
> > + * supported by ARC toolchain.
> > + */
> > +
> 
> So block comments on top of a function imply summary of function etc.
> What you are doing here is calling out the need for .balign quirk. So better to
> phrase it is as "Note about .balign" and then describe the thing

Ok, will fix in v2.

> > +static __always_inline bool arch_static_branch(struct static_key *key,
> > +					       bool branch)
> > +{
> > +	asm_volatile_goto(".balign 4			\n"
> > +		 "1:					\n"
> > +		 "nop					\n"
> > +		 ".pushsection __jump_table, \"aw\"	\n"
> > +		 ".word 1b, %l[l_yes], %c0		\n"
> > +		 ".popsection				\n"
> > +		 : : "i" (&((char *)key)[branch]) : : l_yes);
> > +
> > +	return false;
> > +l_yes:
> > +	return true;
> > +}
> > +
> > +static __always_inline bool arch_static_branch_jump(struct static_key *key,
> > +						    bool branch)
> > +{
> > +	asm_volatile_goto(".balign 4			\n"
> > +		 "1:					\n"
> > +		 "b %l[l_yes]				\n"
> > +		 ".pushsection __jump_table, \"aw\"	\n"
> > +		 ".word 1b, %l[l_yes], %c0		\n"
> > +		 ".popsection				\n"
> > +		 : : "i" (&((char *)key)[branch]) : : l_yes);
> > +
> > +	return false;
> > +l_yes:
> > +	return true;
> > +}
> > +
> > +typedef u32 jump_label_t;
> > +
> > +struct jump_entry {
> > +	jump_label_t code;
> > +	jump_label_t target;
> > +	jump_label_t key;
> > +};
> > +
> > +#endif  /* __ASSEMBLY__ */
> > +#endif
> > diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
> > index 2dc5f4296d44..307f74156d99 100644
> > --- a/arch/arc/kernel/Makefile
> > +++ b/arch/arc/kernel/Makefile
> > @@ -22,6 +22,7 @@ obj-$(CONFIG_ARC_EMUL_UNALIGNED) 	+= unaligned.o
> >  obj-$(CONFIG_KGDB)			+= kgdb.o
> >  obj-$(CONFIG_ARC_METAWARE_HLINK)	+= arc_hostlink.o
> >  obj-$(CONFIG_PERF_EVENTS)		+= perf_event.o
> > +obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
> >  
> >  obj-$(CONFIG_ARC_FPU_SAVE_RESTORE)	+= fpu.o
> >  CFLAGS_fpu.o   += -mdpfp
> > diff --git a/arch/arc/kernel/jump_label.c b/arch/arc/kernel/jump_label.c
> > new file mode 100644
> > index 000000000000..93e3bc84288f
> > --- /dev/null
> > +++ b/arch/arc/kernel/jump_label.c
> > @@ -0,0 +1,168 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/jump_label.h>
> > +
> > +#include "asm/cacheflush.h"
> > +
> > +#define JUMPLABEL_ERR	"ARC: jump_label: ERROR: "
> > +
> > +/* Halt system on fatal error to make debug easier */
> > +#define arc_jl_fatal(format...)						\
> > +({									\
> > +	pr_err(JUMPLABEL_ERR format);					\
> > +	BUG();								\
> 
> Does it make sense to bring down the whole system vs. failing and returning.
> I see there is no error propagation to core code, but still.

I totally agree with Peter, and I prefer to stop the system on this errors. Here is few arguments:
All this checks can't be toggle in system operating normally and only may be caused by bad code generation (or some code/data corruption):
1) We got our instruction to patch unaligned by 4 bytes (despite the fact that we used '.balign 4' to align it)
2) We got branch offset unaligned (which means that we calculate it wrong at build time or corrupt it in run time)
3) We got branch offset which not fits into s25. As this is offset inside one function (inside one 'if' statement actually) we newer get such huge
offset in real life if code generation is ok.

If we only warn to log and return we will face with compromised kernel flow later.
I.E. it could be 'if' statement in kernel text which is switched to wrong state: the condition is true but we take the false branch.
And It will be the issue which is much more difficult to debug.

Does it sound reasonably?

If you really don't want to have BUG here, I can make it conditionally enabled
in depend on CONFIG_ARC_STATIC_KEYS_DEBUG as I want to have it enabled at least on ARC development platforms.

[snip]
-- 
 Eugeniy Paltsev
