From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 22 Nov 2018 13:18:57 +0000
Subject: [PATCH v6] u-boot: Add mkenvimage tool
In-Reply-To: <20181122082807.39508-1-abrodkin@synopsys.com>
References: <20181122082807.39508-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <dee5be3f45002c06f318bf633364aa842548cef8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi, Richard, Otavio,

On Thu, 2018-11-22@11:28 +0300, Alexey Brodkin wrote:
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
> ---
> 
> Changes v5 -> v6:
>  * Really enable separate  pakaging of mkimage and mkenvimage
> 
> Changes v4 -> v5:
>  * Added backward compatibility with "u-boot-mkimage" recipe
>  * Improved handling of nativesdk
>  * Update all references from "u-boot-mkimage" to "u-boot-tools"
> 
> Changes v3 -> v4:
>  * Updated maintainer info to make Yocto autobuilder happy again
> 
> Changes v2 -> v3:
>  * Recipe renamed to "u-boot-tools" to better match its contents
>    (especially in the future as we add more tools there)
>  * Existing "u-boot-mkimage" and newly introduced "u-boot-mkenvimage"
>    made avaialble via PROVIDES
> 
> Changes v1 -> v2:
>  * Got rid of a separate recipe and instead added mkenvimage
>    to u-boot mkimage recipe

So apparently something is still broken :(
------------------------->8-------------------------------
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'u-boot-tools-native-mkimage-native' (but virtual:native:.../openembedded-core/meta/recipes-bsp/u-boot/u-boot-
tools_2018.07.bb RDEPENDS on or otherwise requires it)

NOTE: Runtime target 'u-boot-tools-native-mkimage-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['u-boot-tools-native-mkimage-native']

ERROR: Required build target 'core-image-base' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-base', 'virtual/kernel', 'u-boot-tools-native', 'u-boot-tools-native-mkimage-native']
------------------------->8-------------------------------

Indeed "u-boot-tools-native-mkimage-native" looks quite odd.

Any hints on how that could be addressed?

-Alexey
