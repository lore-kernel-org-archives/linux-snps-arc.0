From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 28 Mar 2017 19:28:36 +0000
Subject: [PATCH v1 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <20170314030040.GZ2843@localhost>
References: <1487709484-868-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1487709484-868-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20170314030040.GZ2843@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490729315.6561.4.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vinod!

Thanks for respond.
My comments below.

On Tue, 2017-03-14@08:30 +0530, Vinod Koul wrote:
> On Tue, Feb 21, 2017@11:38:04PM +0300, Eugeniy Paltsev wrote:
>?
> > +static void vchan_desc_put(struct virt_dma_desc *vdesc)
> > +{
> > +	axi_desc_put(vd_to_axi_desc(vdesc));
> > +}
> well this has no logic and becomes a dummy fn, so why do we need it.
>?
Both functions (vchan_desc_put and axi_desc_put) are used.
First one is put as callback to vchan, second one is used when we need
to free descriptors after errors in preparing function (before we call
vchan_tx_prep).

> >?
> > +
> > +static enum dma_status
> > +dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
> > +		??struct dma_tx_state *txstate)
> > +{
> > +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> > +	enum dma_status ret;
> > +
> > +	ret = dma_cookie_status(dchan, cookie, txstate);
> > +
> > +	if (chan->is_paused && ret == DMA_IN_PROGRESS)
> > +		return DMA_PAUSED;
> no residue calculation?

I don't think we need residue calculation in mem-to-mem transfers. I'm
planning to add residue calculation at once with DMA_SLAVE
functionality.

> >?
> > +static void dma_chan_free_chan_resources(struct dma_chan *dchan)
> > +{
> > +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> > +
> > +	/* ASSERT: channel is idle */
> > +	if (axi_chan_is_hw_enable(chan))
> > +		dev_err(dchan2dev(dchan), "%s is non-idle!\n",
> > +			axi_chan_name(chan));
> > +
> > +	axi_chan_disable(chan);
> > +	axi_chan_irq_disable(chan, DWAXIDMAC_IRQ_ALL);
> > +
> > +	vchan_free_chan_resources(&chan->vc);
> > +
> > +	dev_vdbg(dchan2dev(dchan), "%s: %s: descriptor still
> > allocated: %u\n",
> > +		__func__, axi_chan_name(chan), chan-
> > >descs_allocated);
> > +
> > +	pm_runtime_put_sync_suspend(chan->chip->dev);
> any reason why sync variant is used?
>?
I re-read the documentation and yes - I can use async variant here (and
in the other parts of this driver).

> > +		block_ts = xfer_len >> src_width;
> > +		if (block_ts > max_block_ts) {
> > +			block_ts = max_block_ts;
> > +			xfer_len = max_block_ts << src_width;
> > +		}
> > +
> > +		desc = axi_desc_get(chan);
> > +		if (unlikely(!desc))
> > +			goto err_desc_get;
> > +
> > +		write_desc_sar(desc, src_adr);
> > +		write_desc_dar(desc, dst_adr);
> > +		desc->lli.block_ts_lo = cpu_to_le32(block_ts - 1);
> > +		desc->lli.ctl_hi =
> > cpu_to_le32(CH_CTL_H_LLI_VALID);
> > +
> > +		reg = (DWAXIDMAC_BURST_TRANS_LEN_4 <<
> > CH_CTL_L_DST_MSIZE_POS |
> > +		???????DWAXIDMAC_BURST_TRANS_LEN_4 <<
> > CH_CTL_L_SRC_MSIZE_POS |
> > +		???????dst_width << CH_CTL_L_DST_WIDTH_POS |
> > +		???????src_width << CH_CTL_L_SRC_WIDTH_POS |
> > +		???????DWAXIDMAC_CH_CTL_L_INC <<
> > CH_CTL_L_DST_INC_POS |
> > +		???????DWAXIDMAC_CH_CTL_L_INC <<
> > CH_CTL_L_SRC_INC_POS);
> > +		desc->lli.ctl_lo = cpu_to_le32(reg);
> > +
> > +		set_desc_src_master(desc);
> > +		set_desc_dest_master(desc);
> > +
> > +		/* Manage transfer list (xfer_list) */
> > +		if (!first) {
> > +			first = desc;
> > +		} else {
> > +			list_add_tail(&desc->xfer_list, &first-
> > >xfer_list);
> and since you use vchan why do you need this list

Each virtual descriptor encapsulates several hardware descriptors,
which belong to same transfer.
This list (xfer_list) is used only for allocating/freeing these
descriptors and it doesn't affect on virtual dma work logic.

--?
?Eugeniy Paltsev
