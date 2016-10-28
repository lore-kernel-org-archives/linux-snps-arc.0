From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Oct 2016 19:00:00 +0300
Subject: [PATCH v3 1/3] dmaengine: DW DMAC: split pdata to hardware properties
 and platform quirks
In-Reply-To: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477670402-23943-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Split platform data to actual hardware properties, and platform quirks.
Now we able to use quirks and hardware properties separately from
different sources (pdata, device tree or autoconfig registers)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dw/core.c                | 23 ++++++++++++++---------
 drivers/dma/dw/platform.c            | 34 +++++++++++++++++++++-------------
 include/linux/platform_data/dma-dw.h |  6 ++++++
 3 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c2c0a61..6281009 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -1452,9 +1452,22 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 	dw->regs = chip->regs;
 	chip->dw = dw;
 
+	/* Reassign the platform data pointer */
+	pdata = dw->pdata;
+
 	pm_runtime_get_sync(chip->dev);
 
-	if (!chip->pdata) {
+	if (!chip->pdata || chip->pdata->only_quirks_used) {
+		/* Fill quirks with the default values */
+		pdata->is_private = true;
+		pdata->is_memcpy = true;
+
+		/* Apply platform defined quirks */
+		if (chip->pdata && chip->pdata->only_quirks_used) {
+			pdata->is_private = chip->pdata->is_private;
+			pdata->is_memcpy = chip->pdata->is_memcpy;
+		}
+
 		dw_params = dma_readl(dw, DW_PARAMS);
 		dev_dbg(chip->dev, "DW_PARAMS: 0x%08x\n", dw_params);
 
@@ -1464,9 +1477,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 			goto err_pdata;
 		}
 
-		/* Reassign the platform data pointer */
-		pdata = dw->pdata;
-
 		/* Get hardware configuration parameters */
 		pdata->nr_channels = (dw_params >> DW_PARAMS_NR_CHAN & 7) + 1;
 		pdata->nr_masters = (dw_params >> DW_PARAMS_NR_MASTER & 3) + 1;
@@ -1477,8 +1487,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 		pdata->block_size = dma_readl(dw, MAX_BLK_SIZE);
 
 		/* Fill platform data with the default values */
-		pdata->is_private = true;
-		pdata->is_memcpy = true;
 		pdata->chan_allocation_order = CHAN_ALLOCATION_ASCENDING;
 		pdata->chan_priority = CHAN_PRIORITY_ASCENDING;
 	} else if (chip->pdata->nr_channels > DW_DMA_MAX_NR_CHANNELS) {
@@ -1486,9 +1494,6 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 		goto err_pdata;
 	} else {
 		memcpy(dw->pdata, chip->pdata, sizeof(*dw->pdata));
-
-		/* Reassign the platform data pointer */
-		pdata = dw->pdata;
 	}
 
 	dw->chan = devm_kcalloc(chip->dev, pdata->nr_channels, sizeof(*dw->chan),
diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..77cde375 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -111,24 +111,33 @@ dw_dma_parse_dt(struct platform_device *pdev)
 		return NULL;
 	}
 
-	if (of_property_read_u32(np, "dma-masters", &nr_masters))
-		return NULL;
-	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
-		return NULL;
-
-	if (of_property_read_u32(np, "dma-channels", &nr_channels))
-		return NULL;
-
 	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return NULL;
 
-	pdata->nr_masters = nr_masters;
-	pdata->nr_channels = nr_channels;
+	pdata->only_quirks_used = true;
 
 	if (of_property_read_bool(np, "is_private"))
 		pdata->is_private = true;
 
+	if (of_property_read_bool(np, "is-memcpy"))
+		pdata->is_memcpy = true;
+
+	if (of_property_read_u32(np, "dma-masters", &nr_masters))
+		return pdata;
+	if (nr_masters < 1 || nr_masters > DW_DMA_MAX_NR_MASTERS)
+		return pdata;
+
+	pdata->nr_masters = nr_masters;
+
+	if (of_property_read_u32(np, "dma-channels", &nr_channels))
+		return pdata;
+
+	pdata->nr_channels = nr_channels;
+
+	if (of_property_read_bool(np, "is-nollp"))
+		pdata->is_nollp = true;
+
 	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
 
@@ -141,11 +150,10 @@ dw_dma_parse_dt(struct platform_device *pdev)
 	if (!of_property_read_u32_array(np, "data-width", arr, nr_masters)) {
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
diff --git a/include/linux/platform_data/dma-dw.h b/include/linux/platform_data/dma-dw.h
index 5f0e11e..6cc1d7c 100644
--- a/include/linux/platform_data/dma-dw.h
+++ b/include/linux/platform_data/dma-dw.h
@@ -40,6 +40,11 @@ struct dw_dma_slave {
  * @is_private: The device channels should be marked as private and not for
  *	by the general purpose DMA channel allocator.
  * @is_memcpy: The device channels do support memory-to-memory transfers.
+ * @only_quirks_used: Only read quirks from platform data structure.
+ *	Read other parameters from device tree node (if exists) or from
+ *	hardware autoconfig registers. Only properties "is_private" and
+ *	"is_memcpy" are quirks for now. Note that all listed quirks will
+ *	be copied from platform data.
  * @is_nollp: The device channels does not support multi block transfers.
  * @chan_allocation_order: Allocate channels starting from 0 or 7
  * @chan_priority: Set channel priority increasing from 0 to 7 or 7 to 0.
@@ -52,6 +57,7 @@ struct dw_dma_platform_data {
 	unsigned int	nr_channels;
 	bool		is_private;
 	bool		is_memcpy;
+	bool		only_quirks_used;
 	bool		is_nollp;
 #define CHAN_ALLOCATION_ASCENDING	0	/* zero to seven */
 #define CHAN_ALLOCATION_DESCENDING	1	/* seven to zero */
-- 
2.5.5
