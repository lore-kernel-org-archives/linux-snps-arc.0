From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Tue, 23 Aug 2016 20:01:44 +0300
Subject: [PATCH] DW: Read "is_memcpy" and "is_nollp" property from
 device tree.
In-Reply-To: <1471965258.1562.15.camel@synopsys.com>
References: <1471347080-1411-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1471617566.4887.184.camel@linux.intel.com>
 <1471965258.1562.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471971704.4887.247.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2016-08-23@15:14 +0000, Eugeniy Paltsev wrote:

> DW DMAC on ARC SDP became broken after df5c7386 ("dmaengine: dw:
> > > some Intel devices has no memcpy support") and 30cb2639
> > > ("dmaengine: dw: don't override platform data with autocfg")
> > > commits.
> > I'm not sure that word 'broken' is a correct one here. Is the
> > platform
> > code using this driver in the upstream already? If so, where is it
> > located?
> > 
> I'm not sure is it, but, at least, it changed driver behavior for ARC
> SDP boards.

The rule of common sense here: if it was never upstreamed it has never
been broken.

I hardly remember any user of DW DMAC by ARC architecture in upstream.

> > > But 30cb2639 commit disabled overriding pdata with autocfg, so if
> > > we use platform driver version without pdata some parameters will
> > > not be set. This leads to inoperability of DW DMAC.
> > My suggestion is still the same, i.e. split platform data to actual
> > hardware properties and platform quirks. We might be able to use
> > quirks
> > even in case of auto configuration.
> Do you have any idea about better way to do it?
> Do you suggest to split pdata structure in two different structures

There might be at least couple of ways how to implement this.
1. Convert booleans to bits in one variable (let's say unsigned int
quirks).
2. Split all quirks to separate quirks to something like struct
dw_dma_platform_quirks.

By obvious reasons I think first solution might be better.

> > > +	if (of_property_read_bool(np, "is_memcpy"))
> > > +		pdata->is_memcpy = true;
> > > +
> > > +	if (of_property_read_bool(np, "is_nollp"))
> > > +		pdata->is_nollp = true;
> > I'm pretty sure this one (besides that fact that it misses
> > documentation update and '-' instead of '_' as ordered by DT
> > policy) is unacceptable in DT since it represents *OS related*
> > quirks. (Btw,is_private is also should not be there in the first
> > place)

> Could you possibly tell me, why you call this quirks *OS related* ?
> For example:
> If I know, what DMAC in any chip on any board doesn't support memory-
> to-memory transfers, I can disable "is_memcpy" in this board .dts
> file.
> Am I wrong??

Some of the properties are set or unset due to support in the driver and
/ or issues of the hardware _related_ to the driver in question.

Though if anyone has different opinion I would appreciate to listen to.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
