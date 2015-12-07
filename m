From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  7 Dec 2015 14:21:37 +0300
Subject: [PATCH] ARC: [axs10x] cap ethernet phy to 100 Mbit/sec
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449487297-10093-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Current ARC SDP boards cannot reliably handle 1Gbit
Ethernet connections due to limitations in hardware.

To make sure networking is stable on the board we're
limiting phy to 100 Mbit.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index f3db321..44a578c 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -46,6 +46,7 @@
 			snps,pbl = < 32 >;
 			clocks = <&apbclk>;
 			clock-names = "stmmaceth";
+			max-speed = <100>;
 		};
 
 		ehci at 0x40000 {
-- 
2.5.0
