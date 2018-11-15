From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 15 Nov 2018 05:15:03 +0000
Subject: [PATCH] u-boot: Add mkenvimage tool
In-Reply-To: <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
 <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
 <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marek,

On Thu, 2018-11-15@06:03 +0100, Marek Vasut wrote:
> On 11/15/2018 05:57 AM, Khem Raj wrote:
> > On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > > This utility is used for creation of images containing
> > > usable in run-time U-Boot environment.
> > > 
> > > As of today this utility is added per-board like here [1]
> > > for Intel Edison board, here [2] for Altera's SoCFPGA and
> > > I may guess there're others so instead of adding another one for
> > > ARC why don't we package it for each and everyone.
> > > 
> > > [1] 
> > > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbsp_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=cK5urAA7P2ER1AvKZdD3CEL5r23DwdtJ4Iohy_QCUSQ&s=VyVOHq5I3FsOXvOf7SQgVlwtTfKX0bN5ZmPPehjD-zw&e=
> > > [2] 
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_kraj_meta-2Daltera_blob_master_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dmkenvimage-5Fv2016.11.bb&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=cK5urAA7P2ER1AvKZdD3CEL5r23DwdtJ4Iohy_QCUSQ&s=TDPtpmofctGuP4dejRGli0SBUReQQPoiFQsWPHs4vV8&e=
> > 
> > If this is applicable/works for all u-boot based machines then I think it makes
> > sense to have it on OE-core.
> 
> It is.
> 
> > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > > Cc: Alexander Kanavin <alexander.kanavin at linux.intel.com>
> > > Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> > > Cc: Otavio Salvador <otavio at ossystems.com.br>
> > > Cc: Ross Burton <ross.burton at intel.com>
> > > Cc: Marek Vasut <marex at denx.de>
> 
> Reviewed-by: Marek Vasut <marex at denx.de>
> 
> That said, could the recipe for mkimage and mkenvimage be somehow
> deduplicated ? There seems to be a lot of common stuff.

I'd say why don't we just have one recipe for all U-Boot tools
instead of adding tools one-by-one?

-Alexey
