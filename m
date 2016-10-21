From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Fri, 21 Oct 2016 22:00:49 +0300
Subject: [PATCH] dmaengine: DW DMAC: split pdata to hardware properties
 and platform quirks
In-Reply-To: <1476969404.2882.26.camel@synopsys.com>
References: <1473945253-16649-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1476960501.3693.19.camel@linux.intel.com>
 <1476969404.2882.26.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477076449.6423.14.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2016-10-20@13:16 +0000, Eugeniy Paltsev wrote:
> On Thu, 2016-10-20@13:48 +0300, Andy Shevchenko wrote:
> > On Thu, 2016-09-15@16:14 +0300, Eugeniy Paltsev wrote:
> > > 
> > > This patch is to address a proposal by Andy in this thread:
> > > http://www.spinics.net/lists/dmaengine/msg10754.html
> > > Split platform data to actual hardware properties, and platform
> > > quirks.
> > > Now we able to use quirks and hardware properties separately from
> > > different sources (pdata, device tree or autoconfig registers)


> > -	if (!chip->pdata) {
> > > +	if ((!chip->pdata) ||
> > > +	???(chip->pdata && test_bit(QUIRKS_ONLY_USED, &chip-
> > > > pdata-
> > 
> > I don't think you need atomic test / set of those bits.
> 
> I don't need?atomic bit operations here, I just used standard bit API
> to make code more clear.

I gave more thoughts to that and I think we would leave boolean
variables in platform data. It would be cleaner for users how they
defined quirks. Besides that any additional quirk or modification of the
existing one will produce simple and readable change.

> 
> > > +		?*/
> > > +		if (!chip->pdata) {
> > > +			set_bit(QUIRKS_IS_PRIVATE, &pdata-
> > > > quirks);
> > > 
> > > +			set_bit(QUIRKS_IS_MEMCPY, &pdata-
> > > >quirks);
> > > +			set_bit(QUIRKS_IS_NOLLP, &pdata->quirks);
>>> +		} else {
> > > +			pdata->quirks = chip->pdata->quirks;
> > > +		}

Ditto.

> > > @@ -1569,7 +1576,7 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> > > ?				(dwc_params >> DWC_PARAMS_MBLK_EN
> > > &
> > > 0x1) == 0;
> > > ?		} else {
> > > ?			dwc->block_size = pdata->block_size;
> > > -			dwc->nollp = pdata->is_nollp;
> > > +			dwc->nollp = test_bit(QUIRKS_IS_NOLLP,
> > > &pdata->quirks);
> > 
> > Perhaps you need another patch which actually moves nollp to dwc-
> > > flags.
> 
> As I can see, we already have?DW_DMA_IS_SOFT_LLP flag in "dwc->flags"
> with same functionality, which is set if "dwc->nollp" is true.
> Probably
> we can use this flag and get rid of "dwc->nollp".
> But I'm a bit confused why we clear DW_DMA_IS_SOFT_LLP bit in
> "dwc_scan_descriptors" and "dwc_terminate_all" functions.
> Any ideas about that?

Sounds like a plan. I think you are right, the property quite unlikely
can be changed run-time (though I have one patch regarding Braswell and
CherryView platforms that have a chicken bit to enable / disable the
feature). So, please, get rid of an additional boolean field.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
