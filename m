From: jhogan@kernel.org (James Hogan)
Date: Tue, 10 Apr 2018 23:48:06 +0100
Subject: [PATCH] bug.h: Work around GCC PR82365 in BUG()
In-Reply-To: <20171219114112.939391-1-arnd@arndb.de>
References: <20171219114112.939391-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180410224805.GA21429@saruman>
To: linux-snps-arc@lists.infradead.org

Hi Arnd,

On Tue, Dec 19, 2017@12:39:33PM +0100, Arnd Bergmann wrote:
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index 5d595cfdb2c4..66cfdad68f7e 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -205,6 +205,15 @@
>  #endif
>  
>  /*
> + * calling noreturn functions, __builtin_unreachable() and __builtin_trap()
> + * confuse the stack allocation in gcc, leading to overly large stack
> + * frames, see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82365
> + *
> + * Adding an empty inline assembly before it works around the problem
> + */
> +#define barrier_before_unreachable() asm volatile("")
> +
> +/*
>   * Mark a position in code as unreachable.  This can be used to
>   * suppress control flow warnings after asm blocks that transfer
>   * control elsewhere.
> @@ -214,7 +223,11 @@
>   * unreleased.  Really, we need to have autoconf for the kernel.
>   */
>  #define unreachable() \
> -	do { annotate_unreachable(); __builtin_unreachable(); } while (0)
> +	do {					\
> +		annotate_unreachable();		\
> +		barrier_before_unreachable();	\
> +		__builtin_unreachable();	\
> +	} while (0)

Unfortunately this breaks microMIPS builds (e.g. MIPS
micro32r2_defconfig and micro32r2el_defconfig) on gcc 7.2, due to the
lack of .insn in the asm volatile. Because of the
__builtin_unreachable() there is no code following it. Without the empty
asm the compiler will apparently put the .insn there automatically, but
with the empty asm it doesn't. Therefore the assembler won't treat an
immediately preceeding label as pointing at 16-bit microMIPS
instructions which need the ISA bit set, i.e. bit 0 of the address.
This causes assembler errors since the branch target is treated as a
different ISA mode:

arch/mips/mm/dma-default.s:3265: Error: branch to a symbol in another ISA mode
arch/mips/mm/dma-default.s:5027: Error: branch to a symbol in another ISA mode

Due to a compiler bug on gcc 4.9.2 -> somewhere before 7.2, Paul
submitted these patches a while back:
https://patchwork.linux-mips.org/patch/13360/
https://patchwork.linux-mips.org/patch/13361/

Your patch (suitably fixed for microMIPS) would I imagine fix that issue
too (it certainly fixes the resulting link error on microMIPS builds
with an old toolchain).

Before I forward port those patches to add .insn for MIPS, is that sort
of approach (an arch specific asm/compiler-gcc.h to allow MIPS to
override barrier_before_unreachable()) an acceptable fix?

Thanks
James
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180410/57281184/attachment.sig>
