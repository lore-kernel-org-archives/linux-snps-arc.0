From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 16 Nov 2016 16:56:53 +0300
Subject: [PATCH 2/4] DW DMAC: add is-memcpu property to device tree
In-Reply-To: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479304615-11360-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Memory-to-memory dma transfers were disabled by default if we
used DT to cofigure DMAC.
Add is-memcpu property, so it became possible to enable
memory-to-memory transfers support via DT.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dw/platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 4103f1d..daeceac 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -131,6 +131,9 @@ dw_dma_parse_dt(struct platform_device *pdev)
 	else if (of_property_read_bool(np, "is-private"))
 		pdata->is_private = true;
 
+	if (of_property_read_bool(np, "is-memcpu"))
+		pdata->is_memcpy = true;
+
 	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
 
-- 
2.5.5
