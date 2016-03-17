From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 17 Mar 2016 12:41:52 +0300
Subject: [PATCH v2] ARC: axs10x - add Ethernet PHY description in .dts
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458207712-29435-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Following commit broke DW GMAC functionality on AXS10x boards:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763

That's what happens on eth0 up:
--------------------------->8------------------------
libphy: PHY stmmac-0:ffffffff not found
eth0: Could not attach to PHY
stmmac_open: Cannot attach to PHY (error: -19)
--------------------------->8------------------------

Simplest solution is to add PHY description in board's .dts.
And so we do here.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh at kernel.org>
Cc: Phil Reid <preid at electromag.com.au>
Cc: David S. Miller <davem at davemloft.net>
Cc: linux-kernel at vger.kernel.org
Cc: netdev at vger.kernel.org
Cc: stable at vger.kernel.org # 4.5.x
Cc: Sergei Shtylyov <sergei.shtylyov at cogentembedded.com>
---

Changes v1 -> v2:
 * PHY node name changed to match real PHY number being used (Sergei)

 arch/arc/boot/dts/axs10x_mb.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 44a578c..ab5d570 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -47,6 +47,14 @@
 			clocks = <&apbclk>;
 			clock-names = "stmmaceth";
 			max-speed = <100>;
+			mdio0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+				phy1: ethernet-phy at 1 {
+					reg = <1>;
+				};
+			};
 		};
 
 		ehci at 0x40000 {
-- 
2.5.0
