From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu,  2 May 2019 17:12:32 +0200
Subject: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins number to
 GMAC node
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

GMAC controller on HSDK boards supports 256 Hash Table size so we need to
add the multicast filter bins property. This allows for the Hash filter
to work properly using stmmac driver.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Joao Pinto <jpinto at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 69bc1c9e8e50..b0f059377ab0 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -187,6 +187,7 @@
 			interrupt-names = "macirq";
 			phy-mode = "rgmii";
 			snps,pbl = <32>;
+			snps,multicast-filter-bins = <256>;
 			clocks = <&gmacclk>;
 			clock-names = "stmmaceth";
 			phy-handle = <&phy0>;
-- 
2.7.4
