From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 14 Aug 2018 17:12:25 +0300
Subject: [RFC] etnaviv: missing dma_mask
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180814141225.6123-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lucas, Christoph,

After switching ARC to generic dma_noncoherent cache ops 
etnaviv driver start failing on dma maping functions because of
dma_mask lack.

So I'm wondering is it valid case to have device which is
DMA capable and doesn't have dma_mask set?

If not, then I guess something like that should work
(at least it works for ARC):

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
