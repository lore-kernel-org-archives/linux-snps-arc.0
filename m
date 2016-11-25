From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 25 Nov 2016 17:59:06 +0300
Subject: [PATCH v6 1/2] DW DMAC: enable memory-to-memory transfers support
In-Reply-To: <1480085947-31273-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1480085947-31273-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1480085947-31273-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

All known devices, which use DT for configuration, support
memory-to-memory transfers. So enable it by default, if we read
configuration from DT.

Acked-by: Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dw/platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..aa7a5c1 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
 	if (of_property_read_bool(np, "is_private"))
 		pdata->is_private = true;
 
+	/*
+	 * All known devices, which use DT for configuration, support
+	 * memory-to-memory transfers. So enable it by default.
+	 */
+	pdata->is_memcpy = true;
+
 	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
 
-- 
2.5.5
