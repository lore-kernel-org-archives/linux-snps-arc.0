From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 27 Oct 2016 18:34:57 +0300
Subject: [PATCH v2] dmaengine: DW DMAC: split pdata to hardware properties and
 platform quirks
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477582497-19302-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch is to address a proposal by Andy in this thread:
http://www.spinics.net/lists/dmaengine/msg11506.html
Split platform data to actual hardware properties, and platform quirks.
Now we able to use quirks and hardware properties separately from
different sources (pdata, device tree or autoconfig registers)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
Changes for v2:
   - use separate bool values for quirks in "dw_dma_platform_data" instead of
     common bit field.
   - convert device tree properties reading to unified device property API.

I was wrong about DW_DMA_IS_SOFT_LLP flag - it is used to check about
ongoing soft llp transfer. So DW_DMA_IS_SOFT_LLP flag and "dwc->nollp" 
variable have different functions and I couldn't just get rid of "dwc->nollp"
and use DW_DMA_IS_SOFT_LLP flag instead. So I left "dwc->nollp" untouched.


 drivers/dma/dw/core.c                | 25 +++++++++++------
 drivers/dma/dw/platform.c            | 53 +++++++++++++++++++-----------------
 include/linux/platform_data/dma-dw.h |  4 +++
 3 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c2c0a61..5903e9d 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -1452,9 +1452,24 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 	dw->regs = chip->regs;
 	chip->dw = dw;
 
+	/* Reassign the platform data pointer */
+	pdata = dw->pdata;
+
 	pm_runtime_get_sync(chip->dev);
 
-	if (!chip->pdata) {
+	if ((!chip->pdata) || (chip->pdata && chip->pdata->only_quirks_used)) {
+		if (!chip->pdata) {
+			/*
+			 * Fill quirks with the default values in case of
+			 * pdata absence.
+			 */
+			pdata->is_private = true;
+			pdata->is_memcpy = true;
+		} else {
+			pdata->is_private = chip->pdata->is_private;
+			pdata->is_memcpy = chip->pdata->is_memcpy;
+		}
+
 		dw_params = dma_readl(dw, DW_PARAMS);
 		dev_dbg(chip->dev, "DW_PARAMS: 0x%08x\n", dw_params);
 
@@ -1464,9 +1479,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 			goto err_pdata;
 		}
 
-		/* Reassign the platform data pointer */
-		pdata = dw->pdata;
-
 		/* Get hardware configuration parameters */
 		pdata->nr_channels = (dw_params >> DW_PARAMS_NR_CHAN & 7) + 1;
 		pdata->nr_masters = (dw_params >> DW_PARAMS_NR_MASTER & 3) + 1;
@@ -1477,8 +1489,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 		pdata->block_size = dma_readl(dw, MAX_BLK_SIZE);
 
 		/* Fill platform data with the default values */
-		pdata->is_private = true;
-		pdata->is_memcpy = true;
 		pdata->chan_allocation_order = CHAN_ALLOCATION_ASCENDING;
 		pdata->chan_priority = CHAN_PRIORITY_ASCENDING;
 	} else if (chip->pdata->nr_channels > DW_DMA_MAX_NR_CHANNELS) {
@@ -1486,9 +1496,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 		goto err_pdata;
 	} else {
 		memcpy(dw->pdata, chip->pdata, sizeof(*dw->pdata));
-
-		/* Reassign the platform data pointer */
-		pdata = dw->pdata;
 	}
 
 	dw->chan = devm_kcalloc(chip->dev, pdata->nr_channels, sizeof(*dw->chan),
diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..d8f067e 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -98,59 +98,62 @@ static inline void dw_dma_acpi_controller_register(struct dw_dma *dw) {}
 
 #ifdef CONFIG_OF
 static struct dw_dma_platform_data *
-dw_dma_parse_dt(struct platform_device *pdev)
+dw_dma_parse_dt(struct device *dev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct dw_dma_platform_data *pdata;
 	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS];
 	u32 nr_masters;
 	u32 nr_channels;
 
-	if (!np) {
-		dev_err(&pdev->dev, "Missing DT data\n");
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
 		return NULL;
-	}
 
-	if (of_property_read_u32(np, "dma-masters", &nr_masters))
-		return NULL;
-	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
-		return NULL;
+	pdata->only_quirks_used = true;
 
-	if (of_property_read_u32(np, "dma-channels", &nr_channels))
-		return NULL;
+	if (device_property_read_bool(dev, "is-private"))
+		pdata->is_private = true;
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return NULL;
+	if (device_property_read_bool(dev, "is-memcpy"))
+		pdata->is_memcpy = true;
+
+	if (device_property_read_u32(dev, "dma-masters", &nr_masters))
+		return pdata;
+	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
+		return pdata;
 
 	pdata->nr_masters = nr_masters;
+
+	if (device_property_read_u32(dev, "dma-channels", &nr_channels))
+		return pdata;
+
 	pdata->nr_channels = nr_channels;
 
-	if (of_property_read_bool(np, "is_private"))
-		pdata->is_private = true;
+	if (device_property_read_bool(dev, "is-nollp"))
+		pdata->is_nollp = true;
 
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
-	} else if (!of_property_read_u32_array(np, "data_width", arr, nr_masters)) {
-		for (tmp = 0; tmp < nr_masters; tmp++)
-			pdata->data_width[tmp] = BIT(arr[tmp] & 0x07);
 	}
 
+	pdata->only_quirks_used = false;
+
 	return pdata;
 }
 #else
 static inline struct dw_dma_platform_data *
-dw_dma_parse_dt(struct platform_device *pdev)
+dw_dma_parse_dt(struct device *dev)
 {
 	return NULL;
 }
@@ -183,7 +186,7 @@ static int dw_probe(struct platform_device *pdev)
 
 	pdata = dev_get_platdata(dev);
 	if (!pdata)
-		pdata = dw_dma_parse_dt(pdev);
+		pdata = dw_dma_parse_dt(dev);
 
 	chip->dev = dev;
 	chip->pdata = pdata;
diff --git a/include/linux/platform_data/dma-dw.h b/include/linux/platform_data/dma-dw.h
index 5f0e11e..e720fc3 100644
--- a/include/linux/platform_data/dma-dw.h
+++ b/include/linux/platform_data/dma-dw.h
@@ -40,6 +40,9 @@ struct dw_dma_slave {
  * @is_private: The device channels should be marked as private and not for
  *	by the general purpose DMA channel allocator.
  * @is_memcpy: The device channels do support memory-to-memory transfers.
+ * @only_quirks_used: Only read quirks (like "is_private" or "is_memcpy") from
+ *	platform data structure. Read other parameters from device tree
+ *	node (if exists) or from hardware autoconfig registers.
  * @is_nollp: The device channels does not support multi block transfers.
  * @chan_allocation_order: Allocate channels starting from 0 or 7
  * @chan_priority: Set channel priority increasing from 0 to 7 or 7 to 0.
@@ -52,6 +55,7 @@ struct dw_dma_platform_data {
 	unsigned int	nr_channels;
 	bool		is_private;
 	bool		is_memcpy;
+	bool		only_quirks_used;
 	bool		is_nollp;
 #define CHAN_ALLOCATION_ASCENDING	0	/* zero to seven */
 #define CHAN_ALLOCATION_DESCENDING	1	/* seven to zero */
-- 
2.5.5
