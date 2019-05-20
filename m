From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 20 May 2019 15:43:12 +0200
Subject: [PATCH 1/2] ARC: [plat-hsdk]: Add missing multicast filter bins
 number to GMAC node
In-Reply-To: <cover.1558359611.git.joabreu@synopsys.com>
References: <cover.1558359611.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <efc8afc421f2461c2df4489c979545548782d857.1558359611.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

GMAC controller on HSDK boards supports 256 Hash Table size so we need to
add the multicast filter bins property. This allows for the Hash filter
to work properly using stmmac driver.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Joao Pinto <jpinto at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
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
