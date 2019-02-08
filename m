From: raj.khem@gmail.com (Khem Raj)
Date: Fri, 8 Feb 2019 09:28:09 -0800
Subject: [PATCH] linux-yocto: Add dependency on libgcc for ARC
In-Reply-To: <20190208153221.4335-1-abrodkin@synopsys.com>
References: <20190208153221.4335-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1sqY_1h8j2KR322gF8swrvFapx1mJvicHn-U3bm0+m4-7g@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 8, 2019 at 7:32 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> As of now in case of ARC there's no in-kernel implementation of basic libgcc
> functions used for millicode, multiplication, division etc instead we simply
> link with libgcc.a which provides everything used by the compiler.
>

this is something you would be fixing in kernel eventually?
we can carry this as a workaround until then but it really needs to be
fixed in kernel.

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
