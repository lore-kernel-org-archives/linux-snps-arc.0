From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 15 Nov 2018 05:05:52 +0000
Subject: [PATCH] u-boot: Add mkenvimage tool
In-Reply-To: <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
 <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c060af96f5e55e4808e4cccde2bc8c7a3633ff8f.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Khem,

On Wed, 2018-11-14@20:57 -0800, Khem Raj wrote:
> On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> > This utility is used for creation of images containing
> > usable in run-time U-Boot environment.
> > 
> > As of today this utility is added per-board like here [1]
> > for Intel Edison board, here [2] for Altera's SoCFPGA and
> > I may guess there're others so instead of adding another one for
> > ARC why don't we package it for each and everyone.
> > 
> > [1] 
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_meta-2Dintel-2Dedison_tree_meta-2Dintel-2Dedison-2Dbsp_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dtools-5F2014.04.bb&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=U0I6P-1P3vft6mR4soZ9Y6ptJqYWloOoS0ogvO2Rzv4&s=WEknmJT4TnByCWMMzh4D-2sDrYv5_kx2V1Qk8SYtJY8&e=
> > [2] 
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_kraj_meta-2Daltera_blob_master_recipes-2Dbsp_u-2Dboot_u-2Dboot-2Dmkenvimage-5Fv2016.11.bb&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=U0I6P-1P3vft6mR4soZ9Y6ptJqYWloOoS0ogvO2Rzv4&s=OiXy88hL3o5z9JN0O88EUo3ttvvgFQnC2LnDc_xhGyY&e=
> 
> If this is applicable/works for all u-boot based machines then I think it makes
> sense to have it on OE-core.

Well "mkenvimage" is one of standard U-Boot tools so it has nothing
specific for any architecture or board whatsoever.

It is not used that often as "mkimage" probably because people
mostly depends on default U-Boot env settings which are compiled-in
U-Boot binary with help of CONFIG_EXTRA_ENV_SETTINGS="..."
but IMHO it is rather useful as we may prepare fine-tuned environment
setups for a particular use-case from pure text-based input.

-Alexey
