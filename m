From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Thu, 24 Nov 2016 17:58:18 +0200
Subject: [PATCH v5 2/2] DW DMAC: add multi-block property to device tree
In-Reply-To: <1480002728.20074.15.camel@linux.intel.com>
References: <1479999878-19120-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479999878-19120-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1480002728.20074.15.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1480003098.20074.18.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2016-11-24@17:52 +0200, Andy Shevchenko wrote:
> On Thu, 2016-11-24@18:04 +0300, Eugeniy Paltsev wrote:
> > Several versions of DW DMAC have multi block transfers hardware
> > support. Hardware support of multi block transfers is disabled
> > by default if we use DT to configure DMAC and software emulation
> > of multi block transfers used instead.
> > Add multi-block property, so it is possible to enable hardware
> > multi block transfers (if present) via DT.
> > 
> > Switch from per device is_nollp variable to multi_block array
> > to be able enable/disable multi block transfers separately per
> > channel.
> 
> Thanks for an update. Basically I'm fine with this one.
> 
> So, we still have question about autoconfiguration in SPEAr SoCs, and
> your ARC SoC but it's a different story. I would expect once you will
> clarify it.
> 
> Another one is minor listed below, otherwise
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko at linux.intel.com>

> > @@ -152,6 +154,11 @@ dw_dma_parse_dt(struct platform_device *pdev)
> > ?			pdata->data_width[tmp] = BIT(arr[tmp] &
> > 0x07);
> > ?	}
> > ?
> > +	if (!of_property_read_u32_array(np, "multi-block", chan,
> > nr_channels)) {
> > +		for (tmp = 0; tmp < nr_channels; tmp++)
> > +			pdata->multi_block[tmp] = chan[tmp];
> 
> ...mb (as short of multi-block) would suit better.

Oh, sorry, guys, but one more important thing. If there is no such
property, keep a default to "supported". Otherwise you will break old
(working) DTBs.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
