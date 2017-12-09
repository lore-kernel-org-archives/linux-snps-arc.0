From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Sat,  9 Dec 2017 16:59:18 +0300
Subject: [PATCH 4/4] ARC: [plat-axs103] refactor the quad core DT quirk code
In-Reply-To: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
References: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171209135918.16720-5-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Refactor the quad core DT quirk code:
get rid of waste division and multiplication by 1000000 constant.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/plat-axs10x/axs10x.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 28b3cb2..0ea2f86 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -324,19 +324,21 @@ static void __init axs103_early_init(void)
 	 * Instead of duplicating defconfig/DT for SMP/QUAD, add a small hack
 	 * of fudging the freq in DT
 	 */
+#define AXS103_QUAD_CORE_CPU_FREQ_HZ	50000000
+
 	unsigned int num_cores = (read_aux_reg(ARC_REG_MCIP_BCR) >> 16) & 0x3F;
 	if (num_cores > 2) {
-		u32 freq = 50, orig;
+		u32 freq;
 		int off = fdt_path_offset(initial_boot_params, "/cpu_card/core_clk");
 		const struct fdt_property *prop;
 
 		prop = fdt_get_property(initial_boot_params, off,
 					"assigned-clock-rates", NULL);
-		orig = be32_to_cpu(*(u32*)(prop->data)) / 1000000;
+		freq = be32_to_cpu(*(u32 *)(prop->data));
 
 		/* Patching .dtb in-place with new core clock value */
-		if (freq != orig ) {
-			freq = cpu_to_be32(freq * 1000000);
+		if (freq != AXS103_QUAD_CORE_CPU_FREQ_HZ) {
+			freq = cpu_to_be32(AXS103_QUAD_CORE_CPU_FREQ_HZ);
 			fdt_setprop_inplace(initial_boot_params, off,
 					    "assigned-clock-rates", &freq, sizeof(freq));
 		}
-- 
2.9.3
