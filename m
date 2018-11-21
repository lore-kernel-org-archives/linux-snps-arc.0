From: otavio.salvador@ossystems.com.br (Otavio Salvador)
Date: Wed, 21 Nov 2018 13:45:21 -0200
Subject: [OE-core] [PATCH v4] u-boot: Add mkenvimage tool
In-Reply-To: <f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
References: <20181120202107.41029-1-abrodkin@synopsys.com>
 <f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAP9ODKodGomFQXWXnKXo321JjrmqW281H8Li+h5tM1vCMXB3cg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 20, 2018@6:22 PM Marek Vasut <marex@denx.de> wrote:
> On 11/20/2018 09:21 PM, Alexey Brodkin wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> >
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board.
> >
> > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> >
> > Given there're quite some U-Boot tools that we may want to add later
> > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> > still for compatibility we provide "u-boot-mkimage" with help
> > of PROVIDES as well as proposed "u-boot-mkenvimage".
> >
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> > Cc: Otavio Salvador <otavio at ossystems.com.br>
> > Cc: Martin Jansa <martin.jansa at gmail.com>
> > Cc: Ross Burton <ross.burton at intel.com>
> > Cc: Marek Vasut <marex at denx.de>
> > ---
> >
> > I may "git grep u-boot-mkimage" in more places:
> >  1. meta/classes/image_types.bbclass:311:CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
> >  2. meta/classes/kernel-fitimage.bbclass:7:        depends = "%s u-boot-mkimage-native dtc-native" % depends
> >  3. meta/classes/kernel-uimage.bbclass:6:        depends = "%s u-boot-mkimage-native" % depends
> >  4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
> >
> > But that's not clear for me if it's required to swap "u-boot-mkimage"
> > to "u-boot-tools" see:
> >  1. "u-boot-mkimage" is still a valid recipe as we export ot via PROVIDES
> >     (or I'm mixing package name with recipe name which very well might be
> >      the case)
> >  2. I don't fully understand a mening of "DISTRO_PN_ALIAS".
> >     If that's a name of a package from some big Linux distro or how target
> >     utility is named in that distro. For example in Debian Sid there's
> >     a package named "u-boot-tools" which includes "mkimage", "mkenvimage",
> >     "fw_printenv", "fw_setenv" and many more while in "distro_alias.inc"
> >     we still have:
> >     ---------------->8----------------
> >     DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
> >     ---------------->8----------------
>
> Just make u-boot-tools RPROVIDE the u-boot-mkimage, and make it generate
> a u-boot-mkimage package , no ?

In fact, it should:

PROVIDE += "u-boot-mkimage"

So dependencies are going to keep working; as Richard said, it should
use the new name for the sake of correctness though.

The package split will define how it will need to be handled for the
runtime counterpart.

If we adopt:

PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"

Then we need to add:

RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
RREPLACES_${PN}-mkimage = "u-boot-mkimage"
RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"

So it provides the upgrade path to the original package.

(this is my vote, btw)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
