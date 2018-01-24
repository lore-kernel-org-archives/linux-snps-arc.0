From: brgl@bgdev.pl (Bartosz Golaszewski)
Date: Wed, 24 Jan 2018 22:39:55 +0100
Subject: [PATCH] arc: dts: use 'atmel' as manufacturer for at24 in axs10x_mb
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180124213955.4975-1-brgl@bgdev.pl>
To: linux-snps-arc@lists.infradead.org

Using compatible strings without the <manufacturer> part for at24 is
now deprecated. Use a correct 'atmel,<model>' value.

Signed-off-by: Bartosz Golaszewski <brgl at bgdev.pl>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 74d070cd3c13..47b74fbc403c 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -214,13 +214,13 @@
 			};
 
 			eeprom at 0x54{
-				compatible = "24c01";
+				compatible = "atmel,24c01";
 				reg = <0x54>;
 				pagesize = <0x8>;
 			};
 
 			eeprom at 0x57{
-				compatible = "24c04";
+				compatible = "atmel,24c04";
 				reg = <0x57>;
 				pagesize = <0x8>;
 			};
-- 
2.16.1
