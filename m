From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Oct 2016 19:00:02 +0300
Subject: [PATCH v3 3/3] dmaengine: DW DMAC: move "nollp" to "dwc->flags"
In-Reply-To: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477670402-23943-4-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add "DW_DMA_IS_LLP_SUPPORTED" flag. Use this flag to get rid
of "dwc->nollp" as separate variable.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dw/core.c | 11 ++++++-----
 drivers/dma/dw/regs.h |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 6281009..98beb16 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -227,7 +227,7 @@ static void dwc_dostart(struct dw_dma_chan *dwc, struct dw_desc *first)
 		return;
 	}
 
-	if (dwc->nollp) {
+	if (!test_bit(DW_DMA_IS_LLP_SUPPORTED, &dwc->flags)) {
 		was_soft_llp = test_and_set_bit(DW_DMA_IS_SOFT_LLP,
 						&dwc->flags);
 		if (was_soft_llp) {
@@ -1265,7 +1265,7 @@ struct dw_cyclic_desc *dw_dma_cyclic_prep(struct dma_chan *chan,
 	unsigned long			flags;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	if (dwc->nollp) {
+	if (!test_bit(DW_DMA_IS_LLP_SUPPORTED, &dwc->flags)) {
 		spin_unlock_irqrestore(&dwc->lock, flags);
 		dev_dbg(chan2dev(&dwc->chan),
 				"channel doesn't support LLP transfers\n");
@@ -1570,11 +1570,12 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 			 */
 			dwc->block_size =
 				(4 << ((pdata->block_size >> 4 * i) & 0xf)) - 1;
-			dwc->nollp =
-				(dwc_params >> DWC_PARAMS_MBLK_EN & 0x1) == 0;
+			if ((dwc_params >> DWC_PARAMS_MBLK_EN & 0x1) != 0)
+				set_bit(DW_DMA_IS_LLP_SUPPORTED, &dwc->flags);
 		} else {
 			dwc->block_size = pdata->block_size;
-			dwc->nollp = pdata->is_nollp;
+			if (!pdata->is_nollp)
+				set_bit(DW_DMA_IS_LLP_SUPPORTED, &dwc->flags);
 		}
 	}
 
diff --git a/drivers/dma/dw/regs.h b/drivers/dma/dw/regs.h
index f65dd10..f50c0fc 100644
--- a/drivers/dma/dw/regs.h
+++ b/drivers/dma/dw/regs.h
@@ -218,6 +218,7 @@ enum dw_dmac_flags {
 	DW_DMA_IS_SOFT_LLP = 1,
 	DW_DMA_IS_PAUSED = 2,
 	DW_DMA_IS_INITIALIZED = 3,
+	DW_DMA_IS_LLP_SUPPORTED = 4,
 };
 
 struct dw_dma_chan {
@@ -242,7 +243,6 @@ struct dw_dma_chan {
 
 	/* hardware configuration */
 	unsigned int		block_size;
-	bool			nollp;
 
 	/* custom slave configuration */
 	struct dw_dma_slave	dws;
-- 
2.5.5
