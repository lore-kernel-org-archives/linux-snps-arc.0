From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 15 Nov 2018 10:32:10 +0000
Subject: [OE-core] [PATCH] u-boot: Add mkenvimage tool
In-Reply-To: <20181115092758.GA1430@jama>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
 <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
 <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
 <804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
 <20181115092758.GA1430@jama>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <104a73697f5072fc3abcf7d9cce47e95ca2e8c12.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Martin,

On Thu, 2018-11-15@10:27 +0100, Martin Jansa wrote:
> On Thu, Nov 15, 2018@05:15:03AM +0000, Alexey Brodkin wrote:
> > Hi Marek,

[snip]

> > > Reviewed-by: Marek Vasut <marex at denx.de>
> > > 
> > > That said, could the recipe for mkimage and mkenvimage be somehow
> > > deduplicated ? There seems to be a lot of common stuff.
> > 
> > I'd say why don't we just have one recipe for all U-Boot tools
> > instead of adding tools one-by-one?
> 
> Or add:
>     install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
>     ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> 
> to existing u-boot-mkimage recipe, that's what I'm doing in
> u-boot-mkimage bbappend.

Sure and indeed that was my initial intention but then I noticed
there're separate recipes for mkimage and fw-utils and decided
to act similarly.

If OE people is fine with addition of another (pretty similar ideologically)
utility in u-boot-mkimage_xx.bb then I'm happy to implement it that way.

-Alexey
