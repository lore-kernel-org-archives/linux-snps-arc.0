From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 23 Aug 2016 15:14:19 +0000
Subject: [PATCH] DW: Read "is_memcpy" and "is_nollp" property from
 device tree.
In-Reply-To: <1471617566.4887.184.camel@linux.intel.com>
References: <1471347080-1411-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1471617566.4887.184.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471965258.1562.15.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2016-08-19@17:39 +0300, Andy Shevchenko wrote:
> On Tue, 2016-08-16@14:31 +0300, Eugeniy Paltsev wrote:
> > 
> > DW DMAC on ARC SDP became broken after df5c7386 ("dmaengine: dw:
> > some
> > Intel
> > devices has no memcpy support") and 30cb2639 ("dmaengine: dw: don't
> > override
> > platform data with autocfg") commits.
> I'm not sure that word 'broken' is a correct one here. Is the
> platform
> code using this driver in the upstream already? If so, where is it
> located?
> 
I'm not sure is it, but, at least, it changed driver behavior for ARC
SDP boards.
> > 
> > 
> > * After df5c7386 commit "DMA_MEMCPY" capability option doesn't get
> > set
> > correctly in platform driver version.
> > * After 30cb2639 commit "nollp" parameters don't get set correctly
> > in
> > platform driver version.
> > 
> > 
> > This happens because in old driver version there are three sources
> > of
> > parameters: pdata, device tree and autoconfig hardware registers.
> > Some
> > parameters were read from pdata and others from autoconfig hardware
> > registers. If pdata was absent some pdata structure fields were
> > filled
> > with parameters from device tree.
> 
> > 
> > But 30cb2639 commit disabled overriding pdata with autocfg, so if
> > we
> > use platform driver version without pdata some parameters will not
> > be
> > set.
> > This leads to inoperability of DW DMAC.
> My suggestion is still the same, i.e. split platform data to actual
> hardware properties and platform quirks. We might be able to use
> quirks
> even in case of auto configuration.
Do you have any idea about better way to do it?
Do you suggest to split pdata structure in two different structures?
> 
> > 
> > 
> > This patch adds reading missed parameters from device tree.
> > 
> > Note there's a prerequisite http://www.spinics.net/lists/dmaengine/
> > msg
> > 10682.html
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > ?drivers/dma/dw/platform.c | 6 ++++++
> > ?1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> > index 5bda0eb..2712602 100644
> > --- a/drivers/dma/dw/platform.c
> > +++ b/drivers/dma/dw/platform.c
> > @@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
> > ?	if (of_property_read_bool(np, "is_private"))
> > ?		pdata->is_private = true;
> > ?
> > +	if (of_property_read_bool(np, "is_memcpy"))
> > +		pdata->is_memcpy = true;
> > +
> > +	if (of_property_read_bool(np, "is_nollp"))
> > +		pdata->is_nollp = true;
> I'm pretty sure this one (besides that fact that it misses
> documentation
> update and '-' instead of '_' as ordered by DT policy) is
> unacceptable
> in DT since it represents *OS related* quirks. (Btw, is_private is
> also
> should not be there in the first place)
Could you possibly tell me, why you call this quirks *OS related* ?
For example:
If I know, what DMAC in any chip on any board doesn't support memory-
to-memory transfers, I can disable "is_memcpy" in this board .dts file.
Am I wrong??
> 
> Rob Herring (Cc'ed) might shed a light how to proceed in this case.
> 
> > 
> > +
> > ?	if (!of_property_read_u32(np, "chan_allocation_order",
> > &tmp))
> > ?		pdata->chan_allocation_order = (unsigned char)tmp;
> > ?
-- 
?Paltsev Eugeniy
