From: bruce.ashfield@gmail.com (Bruce Ashfield)
Date: Fri, 8 Feb 2019 10:42:51 -0500
Subject: [OE-core] [PATCH] linux-yocto: Add dependency on libgcc for ARC
In-Reply-To: <20190208153221.4335-1-abrodkin@synopsys.com>
References: <20190208153221.4335-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CADkTA4PoA5=XHbzS=dLcJOB92+Yc-=RDfNhTgNMPmOUEaL7sUg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 8, 2019 at 10:32 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> As of now in case of ARC there's no in-kernel implementation of basic libgcc
> functions used for millicode, multiplication, division etc instead we simply
> link with libgcc.a which provides everything used by the compiler.

I'll grab this for my queue.

Cheers,

Bruce

>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 1ebfb606da..f191946f2a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
>  KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>  KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
> +DEPENDS_append_arc = " libgcc"
> +KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
> +KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
> +
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
>  KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core at lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
