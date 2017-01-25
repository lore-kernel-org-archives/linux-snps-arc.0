From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Wed, 25 Jan 2017 19:25:06 +0200
Subject: [PATCH 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485365106.2133.331.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2017-01-25@18:34 +0300, Eugeniy Paltsev wrote:
> This patch adds support for the DW AXI DMAC controller.
> 
> DW AXI DMAC is a part of upcoming development board from Synopsys.
> 
> In this driver implementation only DMA_MEMCPY and DMA_SG transfers
> are supported.
> 

Few more comments on top of not addressed/answered yet.

> +static inline void axi_chan_disable(struct axi_dma_chan *chan)
> +{
> +	u32 val;
> +
> +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> +	val &= ~(BIT(chan->id) << DMAC_CHAN_EN_SHIFT);
> +	val |=??(BIT(chan->id) << DMAC_CHAN_EN_WE_SHIFT);
> +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);
> +}
> +
> +static inline void axi_chan_enable(struct axi_dma_chan *chan)
> +{
> +	u32 val;
> +
> +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);

> +	val |= (BIT(chan->id) << DMAC_CHAN_EN_SHIFT |
> +		BIT(chan->id) << DMAC_CHAN_EN_WE_SHIFT);
> 

Redundant parens.

> +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);
> +}


> +static void axi_desc_put(struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_chan *chan = desc->chan;
> +	struct dw_axi_dma *dw = chan->chip->dw;
> +	struct axi_dma_desc *child, *_next;
> +	unsigned int descs_put = 0;
> +

> +	if (unlikely(!desc))
> +		return;

Would it be the case?

> +static void dma_chan_issue_pending(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +	unsigned long flags;
> +

> +	dev_dbg(dchan2dev(dchan), "%s: %s\n", __func__,
> axi_chan_name(chan));

Messages like this kinda redundant.
Either you use function tracer and see them anyway, or you are using
Dynamic Debug, which may include function name.

Basically you wrote an equivalent to something like

dev_dbg(dev, "%s\n", channame);

> +
> +	spin_lock_irqsave(&chan->vc.lock, flags);
> +	if (vchan_issue_pending(&chan->vc))
> +		axi_chan_start_first_queued(chan);
> +	spin_unlock_irqrestore(&chan->vc.lock, flags);

...and taking into account the function itself one might expect
something useful printed in _start_first_queued().

For some cases there is also dev_vdbg().

> +}
> +
> +static int dma_chan_alloc_chan_resources(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +
> +	/* ASSERT: channel is idle */
> +	if (axi_chan_is_hw_enable(chan)) {
> +		dev_err(chan2dev(chan), "%s is non-idle!\n",
> +			axi_chan_name(chan));
> +		return -EBUSY;
> +	}
> +

> +	dev_dbg(dchan2dev(dchan), "%s: allocating\n",
> axi_chan_name(chan));

Can you try to enable DMADEVICES_DEBUG and VDEBUG and see what is useful
and what is not?

Give a chance to function tracer as well.

> +static void dma_chan_free_chan_resources(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +
> 

> +	/* ASSERT: channel is idle */
> +	if (axi_chan_is_hw_enable(chan))
> +		dev_err(dchan2dev(dchan), "%s is non-idle!\n",
> +			axi_chan_name(chan));

Yeah, as I said, dw_dmac is not a good example. And this one can be
managed by runtime PM I suppose.

> +
> +/* TODO: REVISIT: how we should choose AXI master for mem-to-mem
> transfer? */

Read datasheet for a SoC/platform? For dw_dmac is chosen with accordance
to hardware topology.

> +	while (true) {

Usually it makes readability harder and rises a red flag to the code.

> 		/* Manage transfer list (xfer_list) */
> +		if (!first) {
> +			first = desc;
> +		} else {
> +			list_add_tail(&desc->xfer_list, &first-
> >xfer_list);
> +			write_desc_llp(prev, desc->vd.tx.phys | lms);
> +		}
> +		prev = desc;
> +
> +		/* update the lengths and addresses for the next loop
> cycle */
> +		dst_len -= xfer_len;
> +		src_len -= xfer_len;
> +		dst_adr += xfer_len;
> +		src_adr += xfer_len;
> +
> +		total_len += xfer_len;

I would suggest to leave this on caller. At some point, if no one else
do this faster than me, I would like to introduce something like struct
dma_parms per DMA channel to allow caller prepare SG list suitable for
the DMA device.

> +
> +static struct dma_async_tx_descriptor *
> +dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dest,
> +			?dma_addr_t src, size_t len, unsigned long
> flags)
> +{

Do you indeed have a use case for this except debugging and testing?

> +	unsigned int nents = 1;
> +	struct scatterlist dst_sg;
> +	struct scatterlist src_sg;
> +
> +	sg_init_table(&dst_sg, nents);
> +	sg_init_table(&src_sg, nents);
> +
> +	sg_dma_address(&dst_sg) = dest;
> +	sg_dma_address(&src_sg) = src;
> +
> +	sg_dma_len(&dst_sg) = len;
> +	sg_dma_len(&src_sg) = len;
> +
> +	/* Implement memcpy transfer as sg transfer with single list
> */

> +	return dma_chan_prep_dma_sg(dchan, &dst_sg, nents,
> +				????&src_sg, nents, flags);

One line?

> +}

> +
> +static void axi_chan_dump_lli(struct axi_dma_chan *chan,
> +			??????struct axi_dma_desc *desc)
> +{
> +	dev_err(dchan2dev(&chan->vc.chan),
> +		"SAR: 0x%x DAR: 0x%x LLP: 0x%x BTS 0x%x CTL:
> 0x%x:%08x",
> +		le32_to_cpu(desc->lli.sar_lo),
> +		le32_to_cpu(desc->lli.dar_lo),
> +		le32_to_cpu(desc->lli.llp_lo),
> +		le32_to_cpu(desc->lli.block_ts_lo),
> +		le32_to_cpu(desc->lli.ctl_hi),
> +		le32_to_cpu(desc->lli.ctl_lo));

I hope at some point ARC (and other architectures which will use this
IP) can implement MMIO tracer.

> +}

> +		axi_chan_dump_lli(chan, desc);
> +}
> +
> +

Extra line.

> +static void axi_chan_handle_err(struct axi_dma_chan *chan, u32
> status)
> +{

> +
> +static int dma_chan_pause(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +	unsigned long flags;
> +	unsigned int timeout = 20; /* timeout iterations */
> +	int ret = -EAGAIN;
> +	u32 val;
> +
> +	spin_lock_irqsave(&chan->vc.lock, flags);
> +
> +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> +	val |= (BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT |
> +		BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT);

Redundant parens.

> +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);
> +
> +	while (timeout--) {

> +		if (axi_chan_irq_read(chan) &
> DWAXIDMAC_IRQ_SUSPENDED) {

> +			axi_chan_irq_clear(chan,
> DWAXIDMAC_IRQ_SUSPENDED);

You may move this invariant out from the loop. Makes code cleaner.

> +			ret = 0;
> +			break;
> +		}

> +		udelay(2);


> +	}
> +
> +	chan->is_paused = true;

This is indeed property of channel.
That said, you may do a trick and use descriptor status for it.
You channel and driver, I'm sure, can't serve in interleaved mode with
descriptors. So, that makes channel(paused) == active
descriptor(paused).

The trick allows to make code cleaner.

> +	ret = device_property_read_u32_array(dev, "priority", carr,

I'm not sure you will have a use case for that. Have you?

> +	ret = devm_request_irq(chip->dev, chip->irq,
> dw_axi_dma_intretupt,
> +			???????IRQF_SHARED, DRV_NAME, chip);
> +	if (ret)
> +		return ret;

You can't do this unless you are using threaded IRQ handler without any
tasklets involved.

There was a nice mail by Thomas who explained what the problem you have
there.

It's a bug in your code.

> +static int __init dw_init(void)
> +{
> +	return platform_driver_register(&dw_driver);
> +}
> +subsys_initcall(dw_init);

Hmm... Why it can't be just a platform driver? You describe the
dependency in Device Tree, if you have something happened, you may
utilize -EPROBE_DEFER.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
