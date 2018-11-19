From: marex@denx.de (Marek Vasut)
Date: Mon, 19 Nov 2018 13:51:41 +0100
Subject: [PATCH v3] u-boot: Add mkenvimage tool
In-Reply-To: <20181119100443.2882-1-abrodkin@synopsys.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
To: linux-snps-arc@lists.infradead.org

On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> Cc: Otavio Salvador <otavio at ossystems.com.br>
> Cc: Martin Jansa <martin.jansa at gmail.com>
> Cc: Ross Burton <ross.burton at intel.com>
> Cc: Marek Vasut <marex at denx.de>

Do we want to generate one package per tool or not ?

> ---
> 
> Changes v2 -> v3:
>  * Recipe renamed to "u-boot-tools" to better match its contents
>    (especially in the future as we add more tools there)
>  * Existing "u-boot-mkimage" and newly introduced "u-boot-mkenvimage"
>    made avaialble via PROVIDES
> 
> Changes v1 -> v2:
>  * Got rid of a separate recipe and instead added mkenvimage
>    to u-boot mkimage recipy
> 
>  .../{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb}       | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} (83%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> similarity index 83%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> index 08bff1d161..140afa8dfe 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> @@ -1,7 +1,8 @@
>  require u-boot-common_${PV}.inc
>  
> -SUMMARY = "U-Boot bootloader image creation tool"
> +SUMMARY = "U-Boot bootloader tools"
>  DEPENDS += "openssl"
> +PROVIDES = "u-boot-mkimage u-boot-mkenvimage"
>  
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> @@ -20,8 +21,14 @@ do_compile () {
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
> 


-- 
Best regards,
Marek Vasut
