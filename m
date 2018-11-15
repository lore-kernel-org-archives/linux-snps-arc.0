From: raj.khem@gmail.com (Khem Raj)
Date: Wed, 14 Nov 2018 20:57:37 -0800
Subject: [PATCH] u-boot: Add mkenvimage tool
In-Reply-To: <20181115040043.9326-1-abrodkin@synopsys.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
>
> As of today this utility is added per-board like here [1]
> for Intel Edison board, here [2] for Altera's SoCFPGA and
> I may guess there're others so instead of adding another one for
> ARC why don't we package it for each and everyone.
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> [2] https://github.com/kraj/meta-altera/blob/master/recipes-bsp/u-boot/u-boot-mkenvimage_v2016.11.bb

If this is applicable/works for all u-boot based machines then I think it makes
sense to have it on OE-core.

>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Alexander Kanavin <alexander.kanavin at linux.intel.com>
> Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> Cc: Otavio Salvador <otavio at ossystems.com.br>
> Cc: Ross Burton <ross.burton at intel.com>
> Cc: Marek Vasut <marex at denx.de>
> ---
>  .../u-boot/u-boot-mkenvimage_2018.07.bb            | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
> new file mode 100644
> index 0000000000..4770f3db08
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkenvimage_2018.07.bb
> @@ -0,0 +1,27 @@
> +require u-boot-common_${PV}.inc
> +
> +SUMMARY = "U-Boot bootloader environment image creation tool"
> +DEPENDS += "openssl"
> +
> +EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +
> +do_compile () {
> +       oe_runmake sandbox_defconfig
> +
> +       # Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
> +       # generating it requires bin2header tool, which for target build
> +       # is built with target tools and thus cannot be executed on host.
> +       sed -i "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" .config
> +
> +       oe_runmake cross_tools NO_SDL=1
> +}
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> +       ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.16.2
>
