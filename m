From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed,  6 Sep 2017 21:21:08 +0300
Subject: [PATCH] ARC: AXS10x: Add temporary quirk to reset ethernet IP
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170906182108.16765-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DW ethernet controller on AXS10x hangs sometimes after SW reset, so
add temporary quirk to reset DW ethernet controller IP core.
This quirk can be removed after axs10x reset driver
(see http://patchwork.ozlabs.org/patch/800273/)
or simple reset driver
(see https://patchwork.kernel.org/patch/9903375/)
will be available in upstream.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/plat-axs10x/axs10x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index f1ac679..cf14ebc 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -111,6 +111,13 @@ static void __init axs10x_early_init(void)
 
 	axs10x_enable_gpio_intc_wire();
 
+	/*
+	 * Reset ethernet IP core.
+	 * TODO: get rid of this quirk after axs10x reset driver (or simple
+	 * reset driver) will be available in upstream.
+	 */
+	iowrite32((1 << 5), (void __iomem *) CREG_MB_SW_RESET);
+
 	scnprintf(mb, 32, "MainBoard v%d", mb_rev);
 	axs10x_print_board_ver(CREG_MB_VER, mb);
 }
-- 
2.9.3
