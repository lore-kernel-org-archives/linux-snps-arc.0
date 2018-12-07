From: mpe@ellerman.id.au (Michael Ellerman)
Date: Fri, 07 Dec 2018 22:15:14 +1100
Subject: [PATCH v2 2/2] kgdb/treewide: constify struct kgdb_arch
 arch_kgdb_ops
In-Reply-To: <5e130b11680be09537913aae9649c84ede763ec8.1544083483.git.christophe.leroy@c-s.fr>
References: <030d63848e4b0ef4d76ca24597ab8302a393d692.1544083483.git.christophe.leroy@c-s.fr>
 <5e130b11680be09537913aae9649c84ede763ec8.1544083483.git.christophe.leroy@c-s.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87va45k2pp.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Christophe Leroy <christophe.leroy at c-s.fr> writes:

> checkpatch.pl reports the following:
>
>   WARNING: struct kgdb_arch should normally be const
>   #28: FILE: arch/mips/kernel/kgdb.c:397:
>   +struct kgdb_arch arch_kgdb_ops = {
>
> This report makes sense, as all other ops struct, this
> one should also be const. This patch does the change.
...

> diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> index 59c578f865aa..bdb588b1d8fb 100644
> --- a/arch/powerpc/kernel/kgdb.c
> +++ b/arch/powerpc/kernel/kgdb.c
> @@ -477,7 +477,7 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>  /*
>   * Global data
>   */
> -struct kgdb_arch arch_kgdb_ops;
> +const struct kgdb_arch arch_kgdb_ops;
>  
>  static int kgdb_not_implemented(struct pt_regs *regs)
>  {

Acked-by: Michael Ellerman <mpe at ellerman.id.au> (powerpc)

cheers
