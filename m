From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 21 Apr 2017 14:29:38 +0000
Subject: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1492518695.24567.56.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492784977.16657.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,
thanks for respond.
My comments are inlined below.

On Tue, 2017-04-18@15:31 +0300, Andy Shevchenko wrote:
> On Fri, 2017-04-07@17:04 +0300, Eugeniy Paltsev wrote:
> > This patch adds support for the DW AXI DMAC controller.
> >
> > DW AXI DMAC is a part of upcoming development board from Synopsys.
> >
> > In this driver implementation only DMA_MEMCPY and DMA_SG transfers
> > are supported.
> >
> > +++ b/drivers/dma/axi_dma_platform.c
> > @@ -0,0 +1,1044 @@
> > +#include <linux/bitops.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/dmaengine.h>
> > +#include <linux/dmapool.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
>
> Are you sure you still need of.h along with depends OF ?
"of_match_ptr" used from of.h

> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/property.h>
> > +#include <linux/types.h>
> > +
> > +#include "axi_dma_platform.h"
> > +#include "axi_dma_platform_reg.h"
>
> Can't you have this in one header?
Sure.

> > +#include "dmaengine.h"
> > +#include "virt-dma.h"
> > +#define AXI_DMA_BUSWIDTHS		??\
> > +	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
> > +	DMA_SLAVE_BUSWIDTH_2_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_4_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_8_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_16_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
> > +	DMA_SLAVE_BUSWIDTH_64_BYTES)
> > +/* TODO: check: do we need to use BIT() macro here? */
>
> Still TODO? I remember I answered to this on the first round.
Yes, I remember it.
I left this TODO as a reminder because src_addr_widths and
dst_addr_widths are
not used anywhere and they are set differently in different drivers
(with or without BIT macro).

> > +
> > +static inline void
> > +axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> > +{
> > +	iowrite32(val, chip->regs + reg);
>
> Are you going to use IO ports for this IP? I don't think so.
> Wouldn't be better to call readl()/writel() instead?
As I understand, it's better to use ioread/iowrite as more universal IO
access way. Am I wrong?

> > +}
> > +static inline void
> > +axi_chan_iowrite64(struct axi_dma_chan *chan, u32 reg, u64 val)
> > +{
> > +	iowrite32(val & 0xFFFFFFFF, chan->chan_regs + reg);
> Useless conjunction.
>
> > +	iowrite32(val >> 32, chan->chan_regs + reg + 4);
> > +}
>
> Can your hardware get 8 bytes at once?
> For such cases we have iowrite64() for 64-bit kernels
>
> But with readq()/writeq() we have specific helpers to make this
> pretty,
> i.e. lo_hi_readq() / lo_hi_writeq() (or hi_lo_*() variants).
Ok, I possibly can use lo_hi_writeq here.

> > +static inline void axi_chan_irq_disable(struct axi_dma_chan *chan,
> > u32 irq_mask)
> > +{
> > +	u32 val;
> > +
> > +	if (likely(irq_mask == DWAXIDMAC_IRQ_ALL)) {
> > +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA,
> > DWAXIDMAC_IRQ_NONE);
> > +	} else {
>
> I don't see the benefit. (Yes, I see one read-less path, I think it
> makes perplexity for nothing here)
This function is called mostly with irq_mask = DWAXIDMAC_IRQ_ALL.
Actually it is called only with irq_mask = DWAXIDMAC_IRQ_ALL until I
add DMA_SLAVE support.
But I can cut off this 'if' statment, if it is necessery.

> > +		val = axi_chan_ioread32(chan, CH_INTSTATUS_ENA);
> > +		val &= ~irq_mask;
> > +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA, val);
> > +	}
> > +}
> > +static inline void axi_chan_disable(struct axi_dma_chan *chan)
> > +{
> > +}
> > +
> > +static inline void axi_chan_enable(struct axi_dma_chan *chan)
> > +{
> > +}
> > +static u32 axi_chan_get_xfer_width(struct axi_dma_chan *chan,
> > dma_addr_t src,
> > +				???dma_addr_t dst, size_t len)
> > +{
> > +	u32 max_width = chan->chip->dw->hdata->m_data_width;
> > +	size_t sdl = (src | dst | len);
>
> Redundant parens, redundant temporary variable (you may do this in
> place).
Ok.

> > +
> > +	return min_t(size_t, __ffs(sdl), max_width);
> > +}
> > +static void axi_desc_put(struct axi_dma_desc *desc)
> > +{
> > +	struct axi_dma_chan *chan = desc->chan;
> > +	struct dw_axi_dma *dw = chan->chip->dw;
> > +	struct axi_dma_desc *child, *_next;
> > +	unsigned int descs_put = 0;
> > +	list_for_each_entry_safe(child, _next, &desc->xfer_list,
> > xfer_list) {
>
> xfer_list looks redundant.
> Can you elaborate why virtual channel management is not working for
> you?
Each virtual descriptor encapsulates several hardware descriptors,
which belong to same transfer.
This list (xfer_list) is used only for allocating/freeing these
descriptors and it doesn't affect on virtual dma work logic.
I can see this approach in several drivers with VirtDMA (but they
mostly use array instead of list)

> > +		list_del(&child->xfer_list);
> > +		dma_pool_free(dw->desc_pool, child, child-
> > > vd.tx.phys);
> >
> > +		descs_put++;
> > +	}
> > +}
> > +/* Called in chan locked context */
> > +static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
> > +				??????struct axi_dma_desc *first)
> > +{
> > +	u32 reg, irq_mask;
> > +	u8 lms = 0;
>
> Does it make any sense? It looks like lms is always 0.
> Or I miss the source of its value?
lms variable uset to determine axi bus for reading lli descriptors. It
is equal to 0 for mem-to-mem transfers. Perhaps it is better to use
define instead of this variable.

> > +	u32 priority = chan->chip->dw->hdata->priority[chan->id];
>
> Reversed xmas tree, please.
>
> Btw, are you planning to use priority at all? For now on I didn't see
> a single driver (from the set I have checked, like 4-5 of them) that
> uses priority anyhow. It makes driver more complex for nothing.
Only for dma slave operations.

>
> > +
> > +	if (unlikely(axi_chan_is_hw_enable(chan))) {
> > +		dev_err(chan2dev(chan), "%s is non-idle!\n",
> > +			axi_chan_name(chan));
> > +
> > +		return;
> > +	}
> > +}
> > +static void dma_chan_free_chan_resources(struct dma_chan *dchan)
> > +{
> > +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> > +
> > +	/* ASSERT: channel hw is idle */
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
> > +		__func__, axi_chan_name(chan),
>
> Redundant __func__ parameter for debug prints.
>
> > +		atomic_read(&chan->descs_allocated));
> > +
> > +	pm_runtime_put(chan->chip->dev);
> > +}
> > +static struct dma_async_tx_descriptor *
> > +dma_chan_prep_dma_sg(struct dma_chan *dchan,
> > +		?????struct scatterlist *dst_sg, unsigned int
> > dst_nents,
> > +		?????struct scatterlist *src_sg, unsigned int
> > src_nents,
> > +		?????unsigned long flags)
> > +{
> > +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> > +	struct axi_dma_desc *first = NULL, *desc = NULL, *prev =
> > NULL;
> > +	size_t dst_len = 0, src_len = 0, xfer_len = 0;
> > +	dma_addr_t dst_adr = 0, src_adr = 0;
> > +	u32 src_width, dst_width;
> > +	size_t block_ts, max_block_ts;
> > +	u32 reg;
> > +	u8 lms = 0;
>
> Same about lms.
>
> > +
> > +	dev_dbg(chan2dev(chan), "%s: %s: sn: %d dn: %d flags:
> > 0x%lx",
> > +		__func__, axi_chan_name(chan), src_nents,
> > dst_nents,
> > flags);
>
> Ditto for __func__.
>
> > +
> >
> > +	if (unlikely(dst_nents == 0 || src_nents == 0))
> > +		return NULL;
> > +
> > +	if (unlikely(dst_sg == NULL || src_sg == NULL))
> > +		return NULL;
>
> If we need those checks they should go to dmaengine.h/dmaengine.c.
I checked several drivers, which implements device_prep_dma_sg and they
implements this checkers.
Should I add something like "dma_sg_desc_invalid" function to
dmaengine.h ?

> > +static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
> > +				???struct axi_dma_desc *desc_head)
> > +{
> > +	struct axi_dma_desc *desc;
> > +
> > +	axi_chan_dump_lli(chan, desc_head);
> > +	list_for_each_entry(desc, &desc_head->xfer_list,
> > xfer_list)
> > +		axi_chan_dump_lli(chan, desc);
> > +}
> > +
> > +static void axi_chan_handle_err(struct axi_dma_chan *chan, u32
> > status)
> > +{
> > +	/* WARN about bad descriptor */
> >
> > +	dev_err(chan2dev(chan),
> > +		"Bad descriptor submitted for %s, cookie: %d, irq:
> > 0x%08x\n",
> > +		axi_chan_name(chan), vd->tx.cookie, status);
> > +	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
>
> As I said earlier dw_dmac is *bad* example of the (virtual channel
> based) DMA driver.
>
> I guess you may just fail the descriptor and don't pretend it has
> been processed successfully.
What do you mean by saying "fail the descriptor"?
After I get error I cancel current transfer and free all descriptors
from it (by calling vchan_cookie_complete).
I can't store error status in descriptor structure because it will be
freed by vchan_cookie_complete.
I can't store error status in channel structure because it will be
overwritten by next transfer.


> > +static int dma_chan_pause(struct dma_chan *dchan)
> > +{
> > +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> > +	unsigned long flags;
> > +	unsigned int timeout = 20; /* timeout iterations */
> > +	int ret = -EAGAIN;
> > +	u32 val;
> > +
> > +	spin_lock_irqsave(&chan->vc.lock, flags);
> > +
> > +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> > +	val |= BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT |
> > +	???????BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT;
> > +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);
>
> You have helpers which you don't use. Why?
Ok, will use.

> > +
> > +	while (timeout--) {
>
> In such cases I prefer do {} while (); to explicitly show that body
> goes at least once.
Good idea. Will change to do {} while () here.

> > +		if (axi_chan_irq_read(chan) &
> > DWAXIDMAC_IRQ_SUSPENDED) {
> > +			ret = 0;
> > +			break;
> > +		}
> > +		udelay(2);
> > +	}
> > +
> > +	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +
> > +	chan->is_paused = true;
> > +
> > +	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > +
> > +	return ret;
> > +}
> > +
> > +/* Called in chan locked context */
> > +static inline void axi_chan_resume(struct axi_dma_chan *chan)
> > +{
> > +	u32 val;
> > +
> > +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> > +	val &= ~(BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT);
> > +	val |=??(BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT);
> > +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);
> > +
> > +	chan->is_paused = false;
> > +}
> > +static int axi_dma_runtime_suspend(struct device *dev)
> > +{
> > +	struct axi_dma_chip *chip = dev_get_drvdata(dev);
> > +
> > +	dev_info(dev, "PAL: %s\n", __func__);
>
> Noisy and useless.
> We have functional tracer in kernel. Use it.
Ok.

> > +
> > +	axi_dma_irq_disable(chip);
> > +	axi_dma_disable(chip);
> > +
> > +	clk_disable_unprepare(chip->clk);
> > +
> > +	return 0;
> > +}

[snip]

> > +
> > +static const struct dev_pm_ops dw_axi_dma_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend,
> > axi_dma_runtime_resume, NULL)
> > +};
>
> Have you tried to build with CONFIG_PM disabled?
Yes.

> I'm pretty sure you need __maybe_unused applied to your PM ops.
I call axi_dma_runtime_suspend / axi_dma_runtime_resume even I dont't
use PM.
(I call them in probe / remove function.)
So I don't need to declare them with __maybe_unused.

> > +struct axi_dma_chan {
> > +	struct axi_dma_chip		*chip;
> > +	void __iomem			*chan_regs;
> > +	u8				id;
> > +	atomic_t			descs_allocated;
> > +
> > +	struct virt_dma_chan		vc;
> > +
> > +	/* these other elements are all protected by vc.lock */
> > +	bool				is_paused;
>
> I still didn't get (already forgot) why you can't use dma_status
> instead for the active descriptor?
As I said before, I checked several driver, which have status variable
in their channel structure - it is used *only* for determinating is
channel paused or not. So there is no much sense in replacing
"is_paused" to "status" and I left "is_paused" variable untouched.

(I described above why we can't use status in channel structure for
error handling)

> > +};
> > +/* LLI == Linked List Item */
> > +struct __attribute__ ((__packed__)) axi_dma_lli {
>
> ...
>
> > +	__le64		sar;
> > +	__le64		dar;
> > +	__le32		block_ts_lo;
> > +	__le32		block_ts_hi;
> > +	__le64		llp;
> > +	__le32		ctl_lo;
> > +	__le32		ctl_hi;
> > +	__le32		sstat;
> > +	__le32		dstat;
> > +	__le32		status_lo;
> > +	__le32		ststus_hi;
> > +	__le32		reserved_lo;
> > +	__le32		reserved_hi;
> > +};
>
> Just __packed here.
>
Ok.

> > +
> > +struct axi_dma_desc {
> > +	struct axi_dma_lli		lli;
> > +
> > +	struct virt_dma_desc		vd;
> > +	struct axi_dma_chan		*chan;
> > +	struct list_head		xfer_list;
>
> This looks redundant. Already asked above about it.
Answered above.

> > +};
> > +
> > +/* Common registers offset */
> > +#define DMAC_ID			0x000 /* R DMAC ID */
> > +#define DMAC_COMPVER		0x008 /* R DMAC Component
> > Version
> > */
> > +#define DMAC_CFG		0x010 /* R/W DMAC Configuration */
> > +#define DMAC_CHEN		0x018 /* R/W DMAC Channel Enable
> > */
> > +#define DMAC_CHEN_L		0x018 /* R/W DMAC Channel
> > Enable
> > 00-31 */
> > +#define DMAC_CHEN_H		0x01C /* R/W DMAC Channel
> > Enable
> > 32-63 */
> > +#define DMAC_INTSTATUS		0x030 /* R DMAC Interrupt
> > Status */
> > +#define DMAC_COMMON_INTCLEAR	0x038 /* W DMAC Interrupt
> > Clear
> > */
> > +#define DMAC_COMMON_INTSTATUS_ENA 0x040 /* R DMAC Interrupt Status
> > Enable */
> > +#define DMAC_COMMON_INTSIGNAL_ENA 0x048 /* R/W DMAC Interrupt
> > Signal
> > Enable */
> > +#define DMAC_COMMON_INTSTATUS	0x050 /* R DMAC Interrupt
> > Status
> > */
> > +#define DMAC_RESET		0x058 /* R DMAC Reset Register1
> > */
> > +
> > +/* DMA channel registers offset */
> > +#define CH_SAR			0x000 /* R/W Chan Source
> > Address */
> > +#define CH_DAR			0x008 /* R/W Chan
> > Destination
> > Address */
> > +#define CH_BLOCK_TS		0x010 /* R/W Chan Block
> > Transfer
> > Size */
> > +#define CH_CTL			0x018 /* R/W Chan Control */
> > +#define CH_CTL_L		0x018 /* R/W Chan Control 00-31 */
> > +#define CH_CTL_H		0x01C /* R/W Chan Control 32-63 */
> > +#define CH_CFG			0x020 /* R/W Chan
> > Configuration
> > */
> > +#define CH_CFG_L		0x020 /* R/W Chan Configuration
> > 00-31
> > */
> > +#define CH_CFG_H		0x024 /* R/W Chan Configuration
> > 32-63
> > */
> > +#define CH_LLP			0x028 /* R/W Chan Linked
> > List
> > Pointer */
> > +#define CH_STATUS		0x030 /* R Chan Status */
> > +#define CH_SWHSSRC		0x038 /* R/W Chan SW Handshake
> > Source */
> > +#define CH_SWHSDST		0x040 /* R/W Chan SW Handshake
> > Destination */
> > +#define CH_BLK_TFR_RESUMEREQ	0x048 /* W Chan Block Transfer
> > Resume Req */
> > +#define CH_AXI_ID		0x050 /* R/W Chan AXI ID */
> > +#define CH_AXI_QOS		0x058 /* R/W Chan AXI QOS */
> > +#define CH_SSTAT		0x060 /* R Chan Source Status */
> > +#define CH_DSTAT		0x068 /* R Chan Destination Status
> > */
> > +#define CH_SSTATAR		0x070 /* R/W Chan Source Status
> > Fetch Addr */
> > +#define CH_DSTATAR		0x078 /* R/W Chan Destination
> > Status Fetch Addr */
> > +#define CH_INTSTATUS_ENA	0x080 /* R/W Chan Interrupt Status
> > Enable */
> > +#define CH_INTSTATUS		0x088 /* R/W Chan Interrupt
> > Status */
> > +#define CH_INTSIGNAL_ENA	0x090 /* R/W Chan Interrupt Signal
> > Enable */
> > +#define CH_INTCLEAR		0x098 /* W Chan Interrupt Clear
> > */
>
> I'm wondering if you can use regmap API instead.
Is it really necessary? It'll make driver more complex for nothing.
>
> > +/* DMAC_CFG */
> > +#define DMAC_EN_MASK		0x00000001U
>
> GENMASK()
Ok.

> > +#define DMAC_EN_POS		0
>
> Usually _SHIFT, but it's up to you.
>
> > +enum {
> > +	DWAXIDMAC_BURST_TRANS_LEN_1	= 0x0,
> > +	DWAXIDMAC_BURST_TRANS_LEN_4,
> > +	DWAXIDMAC_BURST_TRANS_LEN_8,
> > +	DWAXIDMAC_BURST_TRANS_LEN_16,
> > +	DWAXIDMAC_BURST_TRANS_LEN_32,
> > +	DWAXIDMAC_BURST_TRANS_LEN_64,
> > +	DWAXIDMAC_BURST_TRANS_LEN_128,
> > +	DWAXIDMAC_BURST_TRANS_LEN_256,
> > +	DWAXIDMAC_BURST_TRANS_LEN_512,
> > +	DWAXIDMAC_BURST_TRANS_LEN_1024
>
> ..._1024, ?
What exactly you are asking about?

> > +};
>
> Hmm... do you need them in the header?
I use some of these definitions in my code so I guess yes.
/* Maybe I misunderstood your question... */

> > +#define CH_CFG_H_TT_FC_POS	0
> > +enum {
> > +	DWAXIDMAC_TT_FC_MEM_TO_MEM_DMAC	= 0x0,
> > +	DWAXIDMAC_TT_FC_MEM_TO_PER_DMAC,
> > +	DWAXIDMAC_TT_FC_PER_TO_MEM_DMAC,
> > +	DWAXIDMAC_TT_FC_PER_TO_PER_DMAC,
> > +	DWAXIDMAC_TT_FC_PER_TO_MEM_SRC,
> > +	DWAXIDMAC_TT_FC_PER_TO_PER_SRC,
> > +	DWAXIDMAC_TT_FC_MEM_TO_PER_DST,
> > +	DWAXIDMAC_TT_FC_PER_TO_PER_DST
> > +};
>
> Some of definitions are the same as for dw_dmac, right? We might
> split them to a common header, though I have no strong opinion about
it.
> Vinod?
APB DMAC and AXI DMAC have completely different regmap. So there is no
much sense to do that.

--
?Eugeniy Paltsev
