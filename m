From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Thu, 09 Feb 2017 22:52:38 +0200
Subject: [PATCH 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1486648722.2657.18.camel@synopsys.com>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485365106.2133.331.camel@linux.intel.com>
 <1486648722.2657.18.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486673558.2133.441.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2017-02-09@13:58 +0000, Eugeniy Paltsev wrote:
??
> > > +static void axi_desc_put(struct axi_dma_desc *desc)
> > > +{
> > > +	struct axi_dma_chan *chan = desc->chan;
> > > +	struct dw_axi_dma *dw = chan->chip->dw;
> > > +	struct axi_dma_desc *child, *_next;
> > > +	unsigned int descs_put = 0;
> > > +
> > > ?
> > > +	if (unlikely(!desc))
> > > +		return;
> > 
> > Would it be the case?
> 
> Yes, I checked the code - this NULL check is unnecessary, so I'll
> remove it.
> 
> Also about your previous question about likely/unlikely:
> I checked disassembly - gcc generates different code when I use likely
> and unlikely. So, I guess they are useful.?

They are, but in rare cases.

I assume you have read the following article and other material on LWN.

https://lwn.net/Articles/420019/
?
> > > +	/* ASSERT: channel is idle */
> > > +	if (axi_chan_is_hw_enable(chan))
> > > +		dev_err(dchan2dev(dchan), "%s is non-idle!\n",
> > > +			axi_chan_name(chan));
> > 
> > Yeah, as I said, dw_dmac is not a good example. And this one can be
> > managed by runtime PM I suppose.
> 
> See comment below.
> 
> > > > > +static inline bool axi_dma_is_sw_enable(struct axi_dma_chip
> 
> *chip)
> > > > > +{
> > > > > +???struct dw_axi_dma *dw = chip->dw;
> > > > > +???u32 i;
> > > > > +
> > > > > +???for (i = 0; i < dw->hdata->nr_channels; i++) {
> > > > > +???????????if (dw->chan[i].in_use)
> > > > 
> > > > Hmm... I know why we have such flag in dw_dmac, but I doubt it's
> > > > needed
> > > > in this driver. Just double check the need of it.
> > > 
> > > I use this flag to check state of channel (used now/unused) to
> 
> disable
> > > dmac if all channels are unused for now.
> > 
> > ?
> > Okay, but wouldn't be easier to use runtime PM for that? You will
> > not
> > need any special counter and runtime PM will take case of
> > enabling/disabling the device.
> 
> Now in_use variable has several purposes - it is also used to mask
> interrupts from channels, which are not used - that is the reason I
> prefer leave it untouched.

And this is indeed a good argument to move it to runtime PM callbacks!

> Also all existing SoCs with this DMAC don't support power management -
> so there is no really profit from implementing PM.

Disabling IRQ, managing clocks or alike are quite suitable tasks for
runtime PM even if there is no actual *power* management done.

If unsure, ask other developers for their opinions: from Qualcomm,
nVidia, TI, etc.

Besides Vinod I would suggest Tony Lindgren, for example.

> > > +	while (true) {
> > 
> > Usually it makes readability harder and rises a red flag to the
> > code.
> 
> I can write something like next code. Not sure is it looks better.
> ----------->8------------------
> while ((dst_len || dst_sg && dst_nents) &&
> ? ? ? ?(src_len || src_sg && src_nents)) {

Just give a thought about it once more. It might be not easy, but the
result should be quite better than "while (true)" approach.

> > > ?		/* Manage transfer list (xfer_list) */
> > > +		if (!first) {
> > > +			first = desc;
> > > +		} else {
> > > +			list_add_tail(&desc->xfer_list, &first-
> > > > ?
> > > > xfer_list);
> > > 
> > > +			write_desc_llp(prev, desc->vd.tx.phys |
> > > lms);
> > > +		}
> > > +		prev = desc;
> > > +
> > > +		/* update the lengths and addresses for the next
> > > loop
> > > cycle */
> > > +		dst_len -= xfer_len;
> > > +		src_len -= xfer_len;
> > > +		dst_adr += xfer_len;
> > > +		src_adr += xfer_len;
> > > +
> > > +		total_len += xfer_len;
> > 
> > I would suggest to leave this on caller.
> 
> I don't think it is a good idea. Caller doesn't know value of internal
> parameters like max data width and max block size, but we know these
> values and can organize LLI the most optimal way.
> And if the caller has already prepared suitable SG list there will be
> really little overhead, so I prefer leave this code unchanged.

The problem with DMA is a performance in case you need to supply new
chain in fastest possible way.

So, first rationale is to deduplicate the allocation and preparation of
SG list (especially in cases when you have not much nodes in it).

Besides above, caller is the best one who knows *how* to split data in
the *best* way taking into account *all possible limitations*.

That is a second point.

If you still disagree, I would leave it to other maintainers and
experienced engineers to share their opinions.

> > At some point, if no one
> > else
> > do this faster than me, I would like to introduce something like
> > struct
> > dma_parms per DMA channel to allow caller prepare SG list suitable
> > for the DMA device.
> 
> In my opinion it is driver responsibility, not the caller.

See above.

> +	}
> > > +
> > > +	chan->is_paused = true;
> > 
> > This is indeed property of channel.
> > That said, you may do a trick and use descriptor status for it.
> > You channel and driver, I'm sure, can't serve in interleaved mode
> > with
> > descriptors. So, that makes channel(paused) == active
> > descriptor(paused).
> > ?
> > The trick allows to make code cleaner.
> 
> I don't understand how we can use use descriptor status for it.
> I determine descriptor status basing on the is_paused value.
> Look at the code:
> ----------->8------------------
> ret = dma_cookie_status(dchan, cookie, txstate);
> if (chan->is_paused && ret == DMA_IN_PROGRESS)
> 	return DMA_PAUSED;
> ----------->8------------------

You may look to the drivers which have 'enum dma_status' field in their
data structures.

Some of them using it per channel, some per descriptor.

So, either way would be better than current approach in this driver.


> Yep, thanks a lot.
> Looks like I have problem with driver remove function.
> 
> I guess I can solve this problem by freeing irq manually before
> tasklet
> kill:
> ----------->8------------------
> static int dw_remove(...)
> {
> 	devm_free_irq(chip->dev, chip->irq, chip);
> 	tasklet_kill(&dw->tasklet);
> 	...
> }
> ----------->8------------------

Yes, it will fix it.

> > > ??* Add DT bindings
> > > ?
> > > Eugeniy Paltsev (2):
> > > ???dt-bindings: Document the Synopsys DW AXI DMA bindings
> > > ???dmaengine: Add DW AXI DMAC driver
> > > ?
> > > ??.../devicetree/bindings/dma/snps,axi-dw-dmac.txt???|???33 +
> > > ??drivers/dma/Kconfig????????????????????????????????|????8 +
> > > ??drivers/dma/Makefile???????????????????????????????|????1 +
> > > ?
> > > ??drivers/dma/axi_dma_platform.c?????????????????????| 1060
> > > ++++++++++++++++++++
> > 
> > This surprises me. I would expect more then 100+ LOC reduction when
> > switched to virt-dma API. Can you double check that you are using it
> > effectively?
> 
> There is a simple explanation: I switched to virt-dma API (and it
> cause
> LOC reduction) and I implemented some TODOs (and it cause LOC
> increase).

Ah, that explains, indeed.

> Also about previous comment, which I missed before:
> > > +static u32 axi_chan_get_xfer_width(struct axi_dma_chan *chan,
> > > ????????????????????dma_addr_t src, dma_addr_t dst, size_t len)
> > > +{
> > > +	u32 width;
> > > +	dma_addr_t sdl = (src | dst | len);
> > > +	u32 max_width = chan->chip->dw->hdata->m_data_width;
> > 
> > ?
> > Use reverse tree.
> > ?
> > dma_addr_t use above is wrong. (size_t might be bigger in some
> > cases)
> 
> What do you mean by the phrase "Use reverse tree" ?

Just convenient pattern: longest first.

On top of that logical groups of definitions:
a) assignments based on parameters;
b) other variables;
c) return variable last;
d) flags for spin lock -> depends.

Thus:

u32 max_width = chan->chip->dw->hdata->m_data_width;
dma_addr_t sdl = (src | dst | len);
u32 width;

But pay attention to your sdl, which is always nonzero.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
