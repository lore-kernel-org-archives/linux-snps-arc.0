From: tpiepho@impinj.com (Trent Piepho)
Date: Tue, 14 May 2019 17:40:15 +0000
Subject: [PATCH] ARC: [hsdk]  Use rgmii-id mode for ethernet phy
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190514173941.20046-1-tpiepho@impinj.com>
To: linux-snps-arc@lists.infradead.org

If internal delays are desired on the RGMII link, "rgmii-id" should be
used as the phy-mode rather than "rgmii" .

This dts has properties to set the delay values, but they are ignored.
I suspect this is a mistake.

While the driver should disable delay based on the current DT, it does
not, and instead leaves the PHY in the pin strapping default.  Which is
usually to have delays very close to the unused values the hsdk DT.
Which is why the phy would work even if the delays in the DT are
ignored.

Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Trent Piepho <tpiepho at impinj.com>
---
 arch/arc/boot/dts/hsdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 7425bb0f2d1b..d77b27894ab6 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -185,7 +185,7 @@
 			reg = <0x8000 0x2000>;
 			interrupts = <10>;
 			interrupt-names = "macirq";
-			phy-mode = "rgmii";
+			phy-mode = "rgmii-id";
 			snps,pbl = <32>;
 			clocks = <&gmacclk>;
 			clock-names = "stmmaceth";
-- 
2.14.5
