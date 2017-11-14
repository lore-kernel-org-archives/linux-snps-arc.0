From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 14 Nov 2017 17:32:14 +0300
Subject: [PATCH 2/2] ARC: [plat-axs10x]: Remove platform quirk to reset
 ethernet IP
In-Reply-To: <20171114143214.2513-1-Eugeniy.Paltsev@synopsys.com>
References: <20171114143214.2513-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171114143214.2513-3-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Remove platform quirk to reset ethernet IP as AXS10x reset driver
(reset-axs10x.c) was applied.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/plat-axs10x/axs10x.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index cf14ebc..f1ac679 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -111,13 +111,6 @@ static void __init axs10x_early_init(void)
 
 	axs10x_enable_gpio_intc_wire();
 
-	/*
-	 * Reset ethernet IP core.
-	 * TODO: get rid of this quirk after axs10x reset driver (or simple
-	 * reset driver) will be available in upstream.
-	 */
-	iowrite32((1 << 5), (void __iomem *) CREG_MB_SW_RESET);
-
 	scnprintf(mb, 32, "MainBoard v%d", mb_rev);
 	axs10x_print_board_ver(CREG_MB_VER, mb);
 }
-- 
2.9.3
