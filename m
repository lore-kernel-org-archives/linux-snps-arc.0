From: noamca@mellanox.com (Noam Camus)
Date: Tue, 8 Nov 2016 15:20:59 +0200
Subject: [PATCH v2] ARC: [plat-eznps] set default baud for early console
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478611259-4477-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

For CONFIG_SERIAL_EARLYCON we need 800MHz for NPS SoC
The early console driver uses BASE_BAUD and not using dtb.

The default of 50MHz is NOT good for NPS SoC.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/kernel/devtree.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index f1e07c2..3b67f53 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -31,6 +31,8 @@ static void __init arc_set_early_base_baud(unsigned long dt_root)
 		arc_base_baud = 166666666;	/* Fixed 166.6MHz clk (TB10x) */
 	else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp"))
 		arc_base_baud = 33333333;	/* Fixed 33MHz clk (AXS10x) */
+	else if (of_flat_dt_is_compatible(dt_root, "ezchip,arc-nps"))
+		arc_base_baud = 800000000;      /* Fixed 800MHz clk (NPS) */
 	else
 		arc_base_baud = 50000000;	/* Fixed default 50MHz */
 }
-- 
1.7.1
