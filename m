From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 16 Aug 2016 14:31:20 +0300
Subject: [PATCH] DW: Read "is_memcpy" and "is_nollp" property from device tree.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471347080-1411-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DW DMAC on ARC SDP became broken after df5c7386 ("dmaengine: dw: some Intel
devices has no memcpy support") and 30cb2639 ("dmaengine: dw: don't override
platform data with autocfg") commits.

* After df5c7386 commit "DMA_MEMCPY" capability option doesn't get set
correctly in platform driver version.
* After 30cb2639 commit "nollp" parameters don't get set correctly in
platform driver version.

This happens because in old driver version there are three sources of
parameters: pdata, device tree and autoconfig hardware registers. Some
parameters were read from pdata and others from autoconfig hardware
registers. If pdata was absent some pdata structure fields were filled
with parameters from device tree.
But 30cb2639 commit disabled overriding pdata with autocfg, so if we
use platform driver version without pdata some parameters will not be set.
This leads to inoperability of DW DMAC.

This patch adds reading missed parameters from device tree.

Note there's a prerequisite http://www.spinics.net/lists/dmaengine/msg10682.html

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dw/platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..2712602 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
 	if (of_property_read_bool(np, "is_private"))
 		pdata->is_private = true;
 
+	if (of_property_read_bool(np, "is_memcpy"))
+		pdata->is_memcpy = true;
+
+	if (of_property_read_bool(np, "is_nollp"))
+		pdata->is_nollp = true;
+
 	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
 
-- 
2.5.5
