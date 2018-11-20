From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 20 Nov 2018 20:34:16 +0000
Subject: [PATCH v4] u-boot: Add mkenvimage tool
In-Reply-To: <f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
References: <20181120202107.41029-1-abrodkin@synopsys.com>
 <f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE6468198028@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marek,

> -----Original Message-----
> From: Marek Vasut [mailto:marex at denx.de]
> Sent: Tuesday, November 20, 2018 11:23 PM
> To: Alexey Brodkin <alexey.brodkin at synopsys.com>; openembedded-core at lists.openembedded.org
> Cc: Ross Burton <ross.burton at intel.com>; Khem Raj <raj.khem at gmail.com>; linux-snps-arc at lists.infradead.org; Richard Purdie
> <richard.purdie at linuxfoundation.org>; Otavio Salvador <otavio at ossystems.com.br>; Martin Jansa <martin.jansa at gmail.com>
> Subject: Re: [PATCH v4] u-boot: Add mkenvimage tool
> 
> On 11/20/2018 09:21 PM, Alexey Brodkin wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> >
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board.
> >
> > [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-
> 2Dintel-2Dedison-2Dbsp_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-
> 5F2014.04.bb&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=nj37jjvGHLwnN1
> dG2F_IclB3hs-QGaHNS6Z30MOVzGg&s=ReoeMoga0WNrEzYviKd1GBckgNDpZ1E6fs9XguZmy7k&e=
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
> >  4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage
> Debian=uboot-mkimage"
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

Sorry I'm still a bit confused with all those complexities of OE so pls pardon my silly questions.
What are we going to solve with RPROVIDE and how it differs from PROVIDES I already
added in the recipe?

-Alexey
