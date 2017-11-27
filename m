From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 27 Nov 2017 21:56:10 +0300
Subject: [PATCH 3/4] ARC: [plat-axs103]: Set initial core pll output frequency
In-Reply-To: <20171127185611.12379-1-Eugeniy.Paltsev@synopsys.com>
References: <20171127185611.12379-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171127185611.12379-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Set initial core pll output frequency specified in device tree to
100MHz for SMP configuration and 90MHz for UP configuration.
It will be applied at the core pll driver probing.

Update platform quirk for decreasing core frequency for quad core
configuration.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/axc003.dtsi     | 8 ++++++++
 arch/arc/boot/dts/axc003_idu.dtsi | 8 ++++++++
 arch/arc/plat-axs10x/axs10x.c     | 8 ++------
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index 4e6e9f5..dc91c66 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -35,6 +35,14 @@
 			reg = <0x80 0x10>, <0x100 0x10>;
 			#clock-cells = <0>;
 			clocks = <&input_clk>;
+
+			/*
+			 * Set initial core pll output frequency to 90MHz.
+			 * It will be applied at the core pll driver probing
+			 * on early boot.
+			 */
+			assigned-clocks = <&core_clk>;
+			assigned-clock-rates = <90000000>;
 		};
 
 		core_intc: archs-intc at cpu {
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 63954a8..69ff4895 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -35,6 +35,14 @@
 			reg = <0x80 0x10>, <0x100 0x10>;
 			#clock-cells = <0>;
 			clocks = <&input_clk>;
+
+			/*
+			 * Set initial core pll output frequency to 100MHz.
+			 * It will be applied at the core pll driver probing
+			 * on early boot.
+			 */
+			assigned-clocks = <&core_clk>;
+			assigned-clock-rates = <100000000>;
 		};
 
 		core_intc: archs-intc at cpu {
diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index cf14ebc..28b3cb2 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -327,22 +327,18 @@ static void __init axs103_early_init(void)
 	unsigned int num_cores = (read_aux_reg(ARC_REG_MCIP_BCR) >> 16) & 0x3F;
 	if (num_cores > 2) {
 		u32 freq = 50, orig;
-		/*
-		 * TODO: use cpu node "cpu-freq" param instead of platform-specific
-		 * "/cpu_card/core_clk" as it works only if we use fixed-clock for cpu.
-		 */
 		int off = fdt_path_offset(initial_boot_params, "/cpu_card/core_clk");
 		const struct fdt_property *prop;
 
 		prop = fdt_get_property(initial_boot_params, off,
-					"clock-frequency", NULL);
+					"assigned-clock-rates", NULL);
 		orig = be32_to_cpu(*(u32*)(prop->data)) / 1000000;
 
 		/* Patching .dtb in-place with new core clock value */
 		if (freq != orig ) {
 			freq = cpu_to_be32(freq * 1000000);
 			fdt_setprop_inplace(initial_boot_params, off,
-					    "clock-frequency", &freq, sizeof(freq));
+					    "assigned-clock-rates", &freq, sizeof(freq));
 		}
 	}
 #endif
-- 
2.9.3
