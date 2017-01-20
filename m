From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 20 Jan 2017 18:21:18 +0000
Subject: [RFC] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1484919509.2133.270.camel@linux.intel.com>
References: <1484909414-21078-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1484919509.2133.270.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484936477.17477.97.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,
thanks for respond.

I'm agree with most of the comments.
My comments below.

On Fri, 2017-01-20@15:38 +0200, Andy Shevchenko wrote:
> On Fri, 2017-01-20@13:50 +0300, Eugeniy Paltsev wrote:
> > 
> > This patch adds support for the DW AXI DMAC controller.
> > 
> > DW AXI DMAC is a part of upcoming development board from Synopsys.
> > 
> > In this driver implementation only DMA_MEMCPY and DMA_SG transfers
> > are supported.
> > 
> > Note: there is no DT documentation in this patch yet, but it will
> > be added in the nearest future.
> First of all, please use virt-dma API.
Is it?necessary?
I couldn't find any notes about virt-dma in documentation.?

> Second, don't look to dw_dmac for examples, it's not a good one to be
> learned from.
Any suggestions about DMA driver to look for?examples?

> 
> Some mostly style comments below.
> 
> > 
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/device.h>
> > +#include <linux/bitops.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/delay.h>
> > +#include <linux/dmaengine.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/dmapool.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_dma.h>
> > +#include <linux/err.h>
> Alphabetical order?
> Check if you need all of them.
> 
> If you are going to use this driver as a library I would recommend to
> do
> it as a library in the first place.
> 
> 
> > 
> > +/*
> > + * The set of bus widths supported by the DMA controller. DW AXI
> > DMAC
> > supports
> > + * master data bus width up to 512 bits (for both AXI master
> > interfaces), but
> > + * it depends on IP block configurarion.
> > + */
> > +#define AXI_DMA_BUSWIDTHS		??\
> > +	(DMA_SLAVE_BUSWIDTH_UNDEFINED	| \
> > +	DMA_SLAVE_BUSWIDTH_1_BYTE	| \
> > +	DMA_SLAVE_BUSWIDTH_2_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_4_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_8_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_16_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_64_BYTES)
> > +/* TODO: check: do we need to use BIT() macro here? */
> Yes, and here is the problem of that API.
> 
> > 
> > +
> > +/* NOTE: DW AXI DMAC theoretically can be configured with BE IO */
> Do this as ops in your channel or chip struct.
> 
> +static inline void axi_dma_disable(struct axi_dma_chip *chip)
> > 
> > +{
> > +	u32 val = axi_dma_ioread32(chip, DMAC_CFG);
> > +	val &= ~DMAC_EN_MASK;
> > +	axi_dma_iowrite32(chip, DMAC_CFG, val);
> Better to use
> 
> u32 val;
> 
> val = read();
> val &= y;
> write(val);
> 
> pattern.
> 
> Same for similar places.
Are you sure?
I saw opposite advise to use construction like
------------->8---------------
u32 val = read();
val &= y;
write(val);
------------->8---------------
to
reduce space.
> 
> > 
> > +static inline void axi_chan_irq_disable(struct axi_dma_chan *chan,
> > u32 irq_mask)
> > +{
> > +	u32 val;
> > +
> > +	if (likely(irq_mask == DWAXIDMAC_IRQ_ALL)) {
> I doubt likely() is useful here anyhow. Have you looked into
> assembly?
> Does it indeed do what it's supposed to?
Yes, i looked into assembly.
I used "likely()" because?irq_mask will be equal DWAXIDMAC_IRQ_ALL in
99.9% of this function call.
It is?useful here, am I wrong?

> > 
> > +static inline void axi_chan_disable(struct axi_dma_chan *chan)
> > +{
> > +	u32 val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> > +	val &= ~((1 << chan->id) << DMAC_CHAN_EN_SHIFT);
> > +	val |=??((1 << chan->id) << DMAC_CHAN_EN_WE_SHIFT);
> You talked somewhere of a BIT macro, here it is one
> 
> val &= ~BIT(chan->id + DMAC_CHAN_EN_SHIFT);
> 
> or
> 
> val &= ~(BIT(chan->id) << DMAC_CHAN_EN_SHIFT);
> 
> whatever suits better.
> 
> Check all code for this.
> 
> > 
> > +static inline bool axi_dma_is_sw_enable(struct axi_dma_chip *chip)
> > +{
> > +	struct dw_axi_dma *dw = chip->dw;
> > +	u32 i;
> > +
> > +	for (i = 0; i < dw->hdata->nr_channels; i++) {
> > +		if (dw->chan[i].in_use)
> Hmm... I know why we have such flag in dw_dmac, but I doubt it's
> needed
> in this driver. Just double check the need of it.
I use this flag to check state of channel (used now/unused) to disable
dmac if all channels are unused for now.

> > 
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > 
> > 
> > +static u32 axi_chan_get_xfer_width(struct axi_dma_chan *chan,
> > dma_addr_t src,
> > +				???dma_addr_t dst, size_t len)
> > +{
> > 
> > +	u32 width;
> > +	dma_addr_t sdl = (src | dst | len);
> > +	u32 max_width = chan->chip->dw->hdata->m_data_width;
> Use reverse tree.
> 
> dma_addr_t use above is wrong. (size_t might be bigger in some cases)
> 
> > 
> > +
> > +	width = sdl ? __ffs(sdl) : DWAXIDMAC_TRANS_WIDTH_MAX;
> > +
> > +	return width <= max_width ? width : max_width;
> min() / min_t()
> 
> > 
> > +}
> > 
> > +static void write_desc_sar(struct axi_dma_desc *desc, dma_addr_t
> > adr)
> > +{
> > +	desc->lli.sar_lo = cpu_to_le32(adr);
> > +}
> Perhaps macros for all them? Choose whatever looks and suits better.
> 
> 
> > 
> > +/* TODO: REVISIT: how we should choose AXI master for mem-to-mem
> > transfer? */
> > +static void set_desc_dest_master(struct axi_dma_desc *desc)
> > +{
> > +	u32 val;
> > +
> > +	/* select AXI1 for source master if available*/
> Fix indentation, capitalize it.
> 
> > 
> > +}
> > 
> > +
> > +static int dw_probe(struct platform_device *pdev)
> > +{
> > +	struct axi_dma_chip *chip;
> > +	struct resource *mem;
> > +	struct dw_axi_dma *dw;
> > +	struct dw_axi_dma_hcfg *hdata;
> > +	u32 i;
> > +	int ret;
> > +
> > +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip),
> > GFP_KERNEL);
> > +	if (!chip)
> > +		return -ENOMEM;
> > +
> > +	dw = devm_kzalloc(&pdev->dev, sizeof(*dw), GFP_KERNEL);
> > +	if (!dw)
> > +		return -ENOMEM;
> > +
> > +	hdata = devm_kzalloc(&pdev->dev, sizeof(*hdata),
> > GFP_KERNEL);
> > +	if (!hdata)
> > +		return -ENOMEM;
> > +
> > +	chip->dw = dw;
> > +	chip->dev = &pdev->dev;
> > +	chip->dw->hdata = hdata;
> > +
> > +	chip->irq = platform_get_irq(pdev, 0);
> > +	if (chip->irq < 0)
> > +		return chip->irq;
> > +
> > +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	chip->regs = devm_ioremap_resource(chip->dev, mem);
> > +	if (IS_ERR(chip->regs))
> > +		return PTR_ERR(chip->regs);
> > +
> > 
> > +	ret = dma_coerce_mask_and_coherent(chip->dev,
> > DMA_BIT_MASK(32));
> It will not work for 64 bits, it will not work for other users of
> this
> driver if any (when you have different DMA mask to be set).
Looks like I misunderstood?dma_coerce_mask_and_coherent purposes of
using.

> 
> > 
> > +	if (ret)
> > +		return ret;
> > +
> > +	chip->clk = devm_clk_get(chip->dev, NULL);
> > +	if (IS_ERR(chip->clk))
> > +		return PTR_ERR(chip->clk);
> > +
> > +	ret = parse_device_properties(chip);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dw->chan = devm_kcalloc(chip->dev, hdata->nr_channels,
> > +				sizeof(*dw->chan), GFP_KERNEL);
> > +	if (!dw->chan)
> > +		return -ENOMEM;
> > +
> > +	ret = devm_request_irq(chip->dev, chip->irq,
> > dw_axi_dma_intretupt,
> > +			???????IRQF_SHARED, DRV_NAME, chip);
> > +	if (ret)
> > +		return ret;
> > +
> > 
> > 
> > +
> > +	INIT_LIST_HEAD(&dw->dma.channels);
> > +	for (i = 0; i < hdata->nr_channels; i++) {
> > +		struct axi_dma_chan *chan = &dw->chan[i];
> > +
> > +		chan->chip = chip;
> > +		chan->chan.device = &dw->dma;
> > +		dma_cookie_init(&chan->chan);
> > +		list_add_tail(&chan->chan.device_node, &dw-
> > > 
> > > dma.channels);
> > +
> > 
> > 
> > +		chan->id = (u8)i;
> This duplicates what you have in struct dma_chan
> 
> > 
> > +		chan->priority = (u8)i;
> > +		chan->direction = DMA_TRANS_NONE;
> > +
> > 
> > +
> > +	dw->dma.device_alloc_chan_resources =
> > dma_chan_alloc_chan_resources;
> > +	dw->dma.device_free_chan_resources =
> > dma_chan_free_chan_resources;
> > +
> > +	dw->dma.device_prep_dma_memcpy = dma_chan_prep_dma_memcpy;
> > +	dw->dma.device_prep_dma_sg = dma_chan_prep_dma_sg;
> > +
> > +	ret = clk_prepare_enable(chip->clk);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > 
> > +	ret = dma_async_device_register(&dw->dma);
> // offtopic
> Perhaps someone can eventually introduce devm_ variant of this?
> // offtopic
> 
> > 
> > +	if (ret)
> > +		goto err_clk_disable;
> > +
> > 
> > +MODULE_DESCRIPTION("Synopsys DesignWare AXI DMA Controller
> > platform
> > driver");
> > +MODULE_AUTHOR("Paltsev Eugeniy <Eugeniy.Paltsev at synopsys.com>");
> FirstName LastName <email at address.com> ?
> 
> 
-- 
?Paltsev Eugeniy
