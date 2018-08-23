From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 23 Aug 2018 19:38:39 +0300
Subject: [PATCH] etnaviv: setup missing dma_mask
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180823163839.14824-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As for today etnaviv device doesn't setup dma_mask.
The etnaviv device is a virtual device not represented in DT
so missing dma_mask isn't setup by generic plaform code
(by of_dma_configure function).

Missing dma_mask causes fails in some dma cache ops functions.
For example it causes fails on map_* operations in generic
dma_noncoherent_ops and dma_direct_ops.

We faced with this behaviour after switching ARC to generic
dma_noncoherent cache ops using.

So fix this by setting dma_mask via dma_coerce_mask_and_coherent()

Reviewed-by: Christoph Hellwig <hch at lst.de>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 540b59fb4103..69d80937e021 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -593,7 +593,7 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct component_match *match = NULL;
 
-	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 
 	if (!dev->platform_data) {
 		struct device_node *core_node;
-- 
2.14.4
