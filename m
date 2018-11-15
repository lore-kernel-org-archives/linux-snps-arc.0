From: marex@denx.de (Marek Vasut)
Date: Thu, 15 Nov 2018 14:43:02 +0100
Subject: [PATCH v2] u-boot: Add mkenvimage tool
In-Reply-To: <20181115124339.19543-1-abrodkin@synopsys.com>
References: <20181115124339.19543-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
To: linux-snps-arc@lists.infradead.org

On 11/15/2018 01:43 PM, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> Note it is already gets built with "make tools" command
> together with "mkimage" so we just need to install "mkenvimage".
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> Cc: Otavio Salvador <otavio at ossystems.com.br>
> Cc: Martin Jansa <martin.jansa at gmail.com>
> Cc: Ross Burton <ross.burton at intel.com>
> Cc: Marek Vasut <marex at denx.de>
> ---
> 
> Chnages v1 -> v2:
> 
>  * Got rid of a separate recipe and instead added mkenvimage
>    to u-boot mkimage recipy
> 
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> index 08bff1d161..8a8a1ed449 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> @@ -1,6 +1,6 @@
>  require u-boot-common_${PV}.inc
>  
> -SUMMARY = "U-Boot bootloader image creation tool"
> +SUMMARY = "U-Boot bootloader environment & image creation tools"
>  DEPENDS += "openssl"
>  
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> @@ -20,8 +20,14 @@ do_compile () {
>  
>  do_install () {
>  	install -d ${D}${bindir}
> +
> +	# mkimage
>  	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>  	ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +
> +	# mkenvimage
> +	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> +	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
>  }
>  
>  RDEPENDS_${PN} += "dtc"

I have to admit, the recipe name becomes a misnomer then. But renaming
this recipe would be hard, since it's used all over the place. Any ideas?

-- 
Best regards,
Marek Vasut
