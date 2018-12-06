From: bp@alien8.de (Borislav Petkov)
Date: Thu, 6 Dec 2018 22:12:52 +0100
Subject: [PATCH v2 2/2] kgdb/treewide: constify struct kgdb_arch
 arch_kgdb_ops
In-Reply-To: <5e130b11680be09537913aae9649c84ede763ec8.1544083483.git.christophe.leroy@c-s.fr>
References: <030d63848e4b0ef4d76ca24597ab8302a393d692.1544083483.git.christophe.leroy@c-s.fr>
 <5e130b11680be09537913aae9649c84ede763ec8.1544083483.git.christophe.leroy@c-s.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181206211252.GJ3986@zn.tnic>
To: linux-snps-arc@lists.infradead.org

On Thu, Dec 06, 2018@08:07:40PM +0000, Christophe Leroy wrote:
> checkpatch.pl reports the following:
> 
>   WARNING: struct kgdb_arch should normally be const
>   #28: FILE: arch/mips/kernel/kgdb.c:397:
>   +struct kgdb_arch arch_kgdb_ops = {
> 
> This report makes sense, as all other ops struct, this
> one should also be const. This patch does the change.
> 
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Russell King <linux at armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: Yoshinori Sato <ysato at users.sourceforge.jp>
> Cc: Richard Kuo <rkuo at codeaurora.org>
> Cc: Michal Simek <monstr at monstr.eu>
> Cc: Ralf Baechle <ralf at linux-mips.org>
> Cc: Paul Burton <paul.burton at mips.com>
> Cc: James Hogan <jhogan at kernel.org>
> Cc: Ley Foon Tan <lftan at altera.com>
> Cc: Benjamin Herrenschmidt <benh at kernel.crashing.org>
> Cc: Paul Mackerras <paulus at samba.org>
> Cc: Michael Ellerman <mpe at ellerman.id.au>
> Cc: Rich Felker <dalias at libc.org>
> Cc: "David S. Miller" <davem at davemloft.net>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Ingo Molnar <mingo at redhat.com>
> Cc: Borislav Petkov <bp at alien8.de>
> Cc: x86 at kernel.org
> Acked-by: Daniel Thompson <daniel.thompson at linaro.org>
> Acked-by: Paul Burton <paul.burton at mips.com>
> Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
> ---
>  v2: Added CCs to all maintainers/supporters identified by get_maintainer.pl and Acks from Daniel and Paul.
> 
>  arch/arc/kernel/kgdb.c        | 2 +-
>  arch/arm/kernel/kgdb.c        | 2 +-
>  arch/arm64/kernel/kgdb.c      | 2 +-
>  arch/h8300/kernel/kgdb.c      | 2 +-
>  arch/hexagon/kernel/kgdb.c    | 2 +-
>  arch/microblaze/kernel/kgdb.c | 2 +-
>  arch/mips/kernel/kgdb.c       | 2 +-
>  arch/nios2/kernel/kgdb.c      | 2 +-
>  arch/powerpc/kernel/kgdb.c    | 2 +-
>  arch/sh/kernel/kgdb.c         | 2 +-
>  arch/sparc/kernel/kgdb_32.c   | 2 +-
>  arch/sparc/kernel/kgdb_64.c   | 2 +-
>  arch/x86/kernel/kgdb.c        | 2 +-
>  include/linux/kgdb.h          | 2 +-
>  14 files changed, 14 insertions(+), 14 deletions(-)

...

> diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
> index 8e36f249646e..e7effc02f13c 100644
> --- a/arch/x86/kernel/kgdb.c
> +++ b/arch/x86/kernel/kgdb.c
> @@ -804,7 +804,7 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>  				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
>  }
>  
> -struct kgdb_arch arch_kgdb_ops = {
> +const struct kgdb_arch arch_kgdb_ops = {
>  	/* Breakpoint instruction: */
>  	.gdb_bpt_instr		= { 0xcc },
>  	.flags			= KGDB_HW_BREAKPOINT,

For the x86 bits:

Acked-by: Borislav Petkov <bp at suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
