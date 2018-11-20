From: richard.purdie@linuxfoundation.org (richard.purdie@linuxfoundation.org)
Date: Tue, 20 Nov 2018 22:05:05 +0000
Subject: [PATCH v4] u-boot: Add mkenvimage tool
In-Reply-To: <20181120202107.41029-1-abrodkin@synopsys.com>
References: <20181120202107.41029-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4a45b8b1d3663ee46d652d8d945e9953373ea440.camel@linuxfoundation.org>
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

I meant to say, for cleanliness, all the references you mentioned
should also be converted in this patch. Most will work with PROVIDES
mapping but we should improve them.

Cheers,

Richard
