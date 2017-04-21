From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Fri, 21 Apr 2017 18:13:03 +0300
Subject: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1492784977.16657.6.camel@synopsys.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
 <1492784977.16657.6.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492787583.24567.120.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2017-04-21@14:29 +0000, Eugeniy Paltsev wrote:
> On Tue, 2017-04-18@15:31 +0300, Andy Shevchenko wrote:
> > On Fri, 2017-04-07@17:04 +0300, Eugeniy Paltsev wrote:
> > > This patch adds support for the DW AXI DMAC controller.
> > > 

> > > +#include <linux/of.h>
> > 
> > Are you sure you still need of.h along with depends OF ?
> 
> "of_match_ptr" used from of.h

It safe not to use it and always have a table. In this case the driver
even would be available for ACPI-enabled platforms (I suppose some ARM64
might find this useful).

> > > +#define AXI_DMA_BUSWIDTHS		??\
> > > +	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
> > > +	DMA_SLAVE_BUSWIDTH_2_BYTES	| \
> > > +	DMA_SLAVE_BUSWIDTH_4_BYTES	| \
> > > +	DMA_SLAVE_BUSWIDTH_8_BYTES	| \
> > > +	DMA_SLAVE_BUSWIDTH_16_BYTES	| \
> > > +	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
> > > +	DMA_SLAVE_BUSWIDTH_64_BYTES)
> > > +/* TODO: check: do we need to use BIT() macro here? */
> > 
> > Still TODO? I remember I answered to this on the first round.
> 
> Yes, I remember it.
> I left this TODO as a reminder because src_addr_widths and
> dst_addr_widths are
> not used anywhere and they are set differently in different drivers
> (with or without BIT macro).

Strange. AFAIK they are representing bits (which is not the best idea)
in the resulting u64 field. So, anything bigger than 63 doesn't make
sense. In drivers where they are not bits quite likely a bug is hidden.

> 
> > > +
> > > +static inline void
> > > +axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> > > +{
> > > +	iowrite32(val, chip->regs + reg);
> > 
> > Are you going to use IO ports for this IP? I don't think so.
> > Wouldn't be better to call readl()/writel() instead?
> 
> As I understand, it's better to use ioread/iowrite as more universal
> IO
> access way. Am I wrong?

As I said above the ioreadX/iowriteX makes only sense when your IP would
be accessed via IO region or MMIO. I'm pretty sure IO is not the case at
all for this IP.

> > > +static inline void axi_chan_irq_disable(struct axi_dma_chan
> > > *chan,
> > > u32 irq_mask)
> > > +{
> > > +	u32 val;
> > > +
> > > +	if (likely(irq_mask == DWAXIDMAC_IRQ_ALL)) {
> > > +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA,
> > > DWAXIDMAC_IRQ_NONE);
> > > +	} else {
> > 
> > I don't see the benefit. (Yes, I see one read-less path, I think it
> > makes perplexity for nothing here)
> 
> This function is called mostly with irq_mask = DWAXIDMAC_IRQ_ALL.
> Actually it is called only with irq_mask = DWAXIDMAC_IRQ_ALL until I
> add DMA_SLAVE support.
> But I can cut off this 'if' statment, if it is necessery.

It's not necessary, but from my point of view increases readability of
the code a lot for the price of an additional readl().

> 
> > > +		val = axi_chan_ioread32(chan, CH_INTSTATUS_ENA);
> > > +		val &= ~irq_mask;
> > > +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA, val);
> > > +	}

> > > +
> > > +	return min_t(size_t, __ffs(sdl), max_width);
> > > +}
> > > +static void axi_desc_put(struct axi_dma_desc *desc)
> > > +{
> > > +	struct axi_dma_chan *chan = desc->chan;
> > > +	struct dw_axi_dma *dw = chan->chip->dw;
> > > +	struct axi_dma_desc *child, *_next;
> > > +	unsigned int descs_put = 0;
> > > +	list_for_each_entry_safe(child, _next, &desc->xfer_list,
> > > xfer_list) {
> > 
> > xfer_list looks redundant.
> > Can you elaborate why virtual channel management is not working for
> > you?
> 
> Each virtual descriptor encapsulates several hardware descriptors,
> which belong to same transfer.
> This list (xfer_list) is used only for allocating/freeing these
> descriptors and it doesn't affect on virtual dma work logic.
> I can see this approach in several drivers with VirtDMA (but they
> mostly use array instead of list)

You described how most of the DMA drivers are implemented, though they
are using just sg_list directly. I would recommend to do the same and
get rid of this list.

> > Btw, are you planning to use priority at all? For now on I didn't
> > see
> > a single driver (from the set I have checked, like 4-5 of them) that
> > uses priority anyhow. It makes driver more complex for nothing.
> 
> Only for dma slave operations.

So, in other words you *have* an actual two or more users that *need*
prioritization?

> > > +	if (unlikely(dst_nents == 0 || src_nents == 0))
> > > +		return NULL;
> > > +
> > > +	if (unlikely(dst_sg == NULL || src_sg == NULL))
> > > +		return NULL;
> > 
> > If we need those checks they should go to dmaengine.h/dmaengine.c.
> 
> I checked several drivers, which implements device_prep_dma_sg and
> they
> implements this checkers.
> Should I add something like "dma_sg_desc_invalid" function to
> dmaengine.h ?

I suppose it's better to implement them in the corresponding helpers in
dmaengine.h.

> > > +static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
> > > +				???struct axi_dma_desc
> > > *desc_head)
> > > +{
> > > +	struct axi_dma_desc *desc;
> > > +
> > > +	axi_chan_dump_lli(chan, desc_head);
> > > +	list_for_each_entry(desc, &desc_head->xfer_list,
> > > xfer_list)
> > > +		axi_chan_dump_lli(chan, desc);
> > > +}
> > > +
> > > +static void axi_chan_handle_err(struct axi_dma_chan *chan, u32
> > > status)
> > > +{
> > > +	/* WARN about bad descriptor */
> > > 
> > > +	dev_err(chan2dev(chan),
> > > +		"Bad descriptor submitted for %s, cookie: %d,
> > > irq:
> > > 0x%08x\n",
> > > +		axi_chan_name(chan), vd->tx.cookie, status);
> > > +	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
> > 
> > As I said earlier dw_dmac is *bad* example of the (virtual channel
> > based) DMA driver.
> > 
> > I guess you may just fail the descriptor and don't pretend it has
> > been processed successfully.
> 
> What do you mean by saying "fail the descriptor"?
> After I get error I cancel current transfer and free all descriptors
> from it (by calling vchan_cookie_complete).
> I can't store error status in descriptor structure because it will be
> freed by vchan_cookie_complete.
> I can't store error status in channel structure because it will be
> overwritten by next transfer.

Better not to pretend that it has been processed successfully. Don't
call callback on it and set its status to DMA_ERROR (that's why
descriptors in many drivers have dma_status field). When user asks for
status (using cookie) the saved value would be returned until descriptor
is active. 

Do you have some other workflow in mind?

> > > +
> > > +static const struct dev_pm_ops dw_axi_dma_pm_ops = {
> > > +	SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend,
> > > axi_dma_runtime_resume, NULL)
> > > +};
> > 
> > Have you tried to build with CONFIG_PM disabled?
> 
> Yes.
> 
> > I'm pretty sure you need __maybe_unused applied to your PM ops.
> 
> I call axi_dma_runtime_suspend / axi_dma_runtime_resume even I dont't
> use PM.
> (I call them in probe / remove function.)

Hmm... I didn't check your ->probe() and ->remove(). Do you mean you
call them explicitly by those names?

If so, please don't do that. Use pm_runtime_*() instead. And...

> So I don't need to declare them with __maybe_unused.

...in that case it's possible you have them defined but not used.


> >> +struct axi_dma_chan {
> > > +	struct axi_dma_chip		*chip;
> > > +	void __iomem			*chan_regs;
> > > +	u8				id;
> > > +	atomic_t			descs_allocated;
> > > +
> > > +	struct virt_dma_chan		vc;
> > > +
> > > +	/* these other elements are all protected by vc.lock */
> > > +	bool				is_paused;
> > 
> > I still didn't get (already forgot) why you can't use dma_status
> > instead for the active descriptor?
> 
> As I said before, I checked several driver, which have status variable
> in their channel structure - it is used *only* for determinating is
> channel paused or not. So there is no much sense in replacing
> "is_paused" to "status" and I left "is_paused" variable untouched.

Not only (see above), the errored descriptor keeps that status.

> (I described above why we can't use status in channel structure for
> error handling)

Ah, I'm talking about descriptor.

> > > Status Fetch Addr */
> > > +#define CH_INTSTATUS_ENA	0x080 /* R/W Chan Interrupt
> > > Status
> > > Enable */
> > > +#define CH_INTSTATUS		0x088 /* R/W Chan Interrupt
> > > Status */
> > > +#define CH_INTSIGNAL_ENA	0x090 /* R/W Chan Interrupt
> > > Signal
> > > Enable */
> > > +#define CH_INTCLEAR		0x098 /* W Chan Interrupt
> > > Clear
> > > */
> > 
> > I'm wondering if you can use regmap API instead.
> 
> Is it really necessary? It'll make driver more complex for nothing.

That's why I'm not suggesting but wondering.

> > > +	DWAXIDMAC_BURST_TRANS_LEN_1024
> > 
> > ..._1024, ?
> 
> What exactly you are asking about?

Comma at the end.

> 
> > > +};
> > 
> > Hmm... do you need them in the header?
> 
> I use some of these definitions in my code so I guess yes.
> /* Maybe I misunderstood your question... */

I mean, who are the users of them? If it's only one module, there is no
need to put them in header.

> 
> > > +#define CH_CFG_H_TT_FC_POS	0
> > > +enum {
> > > +	DWAXIDMAC_TT_FC_MEM_TO_MEM_DMAC	= 0x0,
> > > +	DWAXIDMAC_TT_FC_MEM_TO_PER_DMAC,
> > > +	DWAXIDMAC_TT_FC_PER_TO_MEM_DMAC,
> > > +	DWAXIDMAC_TT_FC_PER_TO_PER_DMAC,
> > > +	DWAXIDMAC_TT_FC_PER_TO_MEM_SRC,
> > > +	DWAXIDMAC_TT_FC_PER_TO_PER_SRC,
> > > +	DWAXIDMAC_TT_FC_MEM_TO_PER_DST,
> > > +	DWAXIDMAC_TT_FC_PER_TO_PER_DST
> > > +};
> > 
> > Some of definitions are the same as for dw_dmac, right? We might
> > split them to a common header, though I have no strong opinion about
> 
> it.
> > Vinod?
> 
> APB DMAC and AXI DMAC have completely different regmap. So there is no
> much sense to do that.

I'm not talking about registers, I'm talking about definitions like
above. Though it would be indeed little sense to split some common code
between those two.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
