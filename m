From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 15 Feb 2019 19:17:33 +0300
Subject: [PATCH] ARC: [plat-hsdk]: Add reset controller handle to manage USB
 reset
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190215161733.29914-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DW USB controller on HSDK hangs sometimes after SW reset, so
add reset handle to make possible to reset DW USB controller HW.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 43f17b51ee89..f80fb9dc8653 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -200,6 +200,7 @@
 			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
 			reg = <0x60000 0x100>;
 			interrupts = <15>;
+			resets = <&cgu_rst HSDK_USB_RESET>;
 			dma-coherent;
 		};
 
@@ -207,6 +208,7 @@
 			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
 			reg = <0x40000 0x100>;
 			interrupts = <15>;
+			resets = <&cgu_rst HSDK_USB_RESET>;
 			dma-coherent;
 		};
 
-- 
2.14.5
