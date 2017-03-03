From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Fri,  3 Mar 2017 14:30:01 +0300
Subject: [PATCH 2/3] ARC: [dts] add cpu nodes to ARCHS SMP device tree
In-Reply-To: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
References: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488540602-11438-3-git-send-email-vzakhar@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Trying to get clock for CPU cores on SMP systems I found that I was only
able to get clock for core[0]. That was because only one cpu at 0 node was
represented in ARC HS device tree and it was impossible to get clock for
"non-existing" cores.

So as ARC HS may have up to 4 cores we update device tree to match
maximum possible cores quantity.

Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
---
 arch/arc/boot/dts/skeleton_hs_idu.dtsi | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/skeleton_hs_idu.dtsi b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
index 662c5e0..54b277d 100644
--- a/arch/arc/boot/dts/skeleton_hs_idu.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
@@ -19,10 +19,28 @@
 
 		cpu at 0 {
 			device_type = "cpu";
-			compatible = "snps,archs38xN";
+			compatible = "snps,archs38";
 			reg = <0>;
 			clocks = <&core_clk>;
 		};
+		cpu at 1 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <1>;
+			clocks = <&core_clk>;
+		};
+		cpu at 2 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <2>;
+			clocks = <&core_clk>;
+		};
+		cpu at 3 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <3>;
+			clocks = <&core_clk>;
+		};
 	};
 
 	/* TIMER0 with interrupt for clockevent */
-- 
2.7.4
