From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Oct 2016 19:00:01 +0300
Subject: [PATCH v3 2/3] dmaengine: DW DMAC: convert to unified device property
 API
In-Reply-To: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477670402-23943-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Convert device tree properties reading to unified device
property API, update properties names as ordered by DT policy.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dw/platform.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 77cde375..85368bc 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -98,56 +98,51 @@ static inline void dw_dma_acpi_controller_register(struct dw_dma *dw) {}
 
 #ifdef CONFIG_OF
 static struct dw_dma_platform_data *
-dw_dma_parse_dt(struct platform_device *pdev)
+dw_dma_parse_properties(struct device *dev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct dw_dma_platform_data *pdata;
 	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS];
 	u32 nr_masters;
 	u32 nr_channels;
 
-	if (!np) {
-		dev_err(&pdev->dev, "Missing DT data\n");
-		return NULL;
-	}
-
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return NULL;
 
 	pdata->only_quirks_used = true;
 
-	if (of_property_read_bool(np, "is_private"))
+	if (device_property_read_bool(dev, "is-private"))
 		pdata->is_private = true;
 
-	if (of_property_read_bool(np, "is-memcpy"))
+	if (device_property_read_bool(dev, "is-memcpy"))
 		pdata->is_memcpy = true;
 
-	if (of_property_read_u32(np, "dma-masters", &nr_masters))
+	if (device_property_read_u32(dev, "dma-masters", &nr_masters))
 		return pdata;
 	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
 		return pdata;
 
 	pdata->nr_masters = nr_masters;
 
-	if (of_property_read_u32(np, "dma-channels", &nr_channels))
+	if (device_property_read_u32(dev, "dma-channels", &nr_channels))
 		return pdata;
 
 	pdata->nr_channels = nr_channels;
 
-	if (of_property_read_bool(np, "is-nollp"))
+	if (device_property_read_bool(dev, "is-nollp"))
 		pdata->is_nollp = true;
 
-	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
+	if (!device_property_read_u32(dev, "chan-allocation-order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
 
-	if (!of_property_read_u32(np, "chan_priority", &tmp))
+	if (!device_property_read_u32(dev, "chan-priority", &tmp))
 		pdata->chan_priority = tmp;
 
-	if (!of_property_read_u32(np, "block_size", &tmp))
+	if (!device_property_read_u32(dev, "block-size", &tmp))
 		pdata->block_size = tmp;
 
-	if (!of_property_read_u32_array(np, "data-width", arr, nr_masters)) {
+	if (!device_property_read_u32_array(dev, "data-width", arr,
+					    nr_masters)) {
 		for (tmp = 0; tmp < nr_masters; tmp++)
 			pdata->data_width[tmp] = arr[tmp];
 	}
@@ -158,7 +153,7 @@ dw_dma_parse_dt(struct platform_device *pdev)
 }
 #else
 static inline struct dw_dma_platform_data *
-dw_dma_parse_dt(struct platform_device *pdev)
+dw_dma_parse_properties(struct device *dev)
 {
 	return NULL;
 }
@@ -191,7 +186,7 @@ static int dw_probe(struct platform_device *pdev)
 
 	pdata = dev_get_platdata(dev);
 	if (!pdata)
-		pdata = dw_dma_parse_dt(pdev);
+		pdata = dw_dma_parse_properties(dev);
 
 	chip->dev = dev;
 	chip->pdata = pdata;
-- 
2.5.5
