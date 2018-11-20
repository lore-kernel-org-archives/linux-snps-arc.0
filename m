From: richard.purdie@linuxfoundation.org (richard.purdie@linuxfoundation.org)
Date: Tue, 20 Nov 2018 22:02:38 +0000
Subject: [PATCH v4] u-boot: Add mkenvimage tool
In-Reply-To: <20181120202107.41029-1-abrodkin@synopsys.com>
References: <20181120202107.41029-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4091d6f2fe2999ad75ee7da8afd2a87e1299cff3.camel@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

On Tue, 2018-11-20@23:21 +0300, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-
> tools"
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
> I may "git grep u-boot-mkimage" in more places:
>  1. meta/classes/image_types.bbclass:311:CONVERSION_DEPENDS_u-boot =
> "u-boot-mkimage-native"
>  2. meta/classes/kernel-fitimage.bbclass:7:        depends = "%s u-
> boot-mkimage-native dtc-native" % depends
>  3. meta/classes/kernel-uimage.bbclass:6:        depends = "%s u-
> boot-mkimage-native" % depends
>  4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-
> u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
> 
> But that's not clear for me if it's required to swap "u-boot-mkimage"
> to "u-boot-tools" see:
>  1. "u-boot-mkimage" is still a valid recipe as we export ot via
> PROVIDES
>     (or I'm mixing package name with recipe name which very well
> might be
>      the case)
>  2. I don't fully understand a mening of "DISTRO_PN_ALIAS".
>     If that's a name of a package from some big Linux distro or how
> target
>     utility is named in that distro. For example in Debian Sid
> there's
>     a package named "u-boot-tools" which includes "mkimage",
> "mkenvimage",
>     "fw_printenv", "fw_setenv" and many more while in
> "distro_alias.inc"
>     we still have:
>     ---------------->8----------------
>     DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage
> Debian=uboot-mkimage"
>     ---------------->8----------------

Sorry, the tests in meta-oe have exposed another issue:

https://8n1.org/14048/3f99

which means the PROVIDES isn't quite right. The reason is there is
magic in the recipe which extends it to the native and nativesdk cases
but its not quite working.

I think the easiest way to address this may be

PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
PROVIDES_class-native = "u-boot-mkimage-native u-boot-mkenvimage-
native"

since in the nativesdk case, MLPREFIX expands to nativesdk-. The second
class-native line may not be needed. You could check with:

bitbake u-boot-tools -e | grep ^PROVIDES=

and see if it computes the value without manually overriding it.

Cheers,

Richard
