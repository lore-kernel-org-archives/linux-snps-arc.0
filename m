From: ynezz@true.cz (=?UTF-8?q?Petr=20=C5=A0tetiar?=)
Date: Sun, 16 Dec 2018 14:08:43 +0100
Subject: [PATCH] treewide: dts: Remove default-state=off property from all
 gpio LED nodes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1544965723-29445-1-git-send-email-ynezz@true.cz>
To: linux-snps-arc@lists.infradead.org

>From the Documentation/devicetree/bindings/leds/common.txt:

- default-state : The initial state of the LED. Valid values are "on",
   "off", and "keep". If the LED is already on or off and the default-state
   property is set the to same value, then no glitch should be produced
   where the LED momentarily turns off (or on). The "keep" setting will
   keep the LED at whatever its current state is, without producing a
   glitch.  The default is off if this property is not present.

So setting the default-state of the LEDs to `off` is redundant as `off`
is default LED state anyway. Almost everybody is copy&pasting similar
nodes from the other files without checking if the properties are
actually needed, so it would be beneficial for all of us to remove bad
examples from the tree completely. As a bonus the DTS files are a bit
smaller now.

Signed-off-by: Petr ?tetiar <ynezz at true.cz>
---
 arch/arc/boot/dts/abilis_tb100_dvk.dts                 | 10 ----------
 arch/arc/boot/dts/abilis_tb101_dvk.dts                 | 10 ----------
 arch/arm/boot/dts/am335x-baltos-leds.dtsi              |  2 --
 arch/arm/boot/dts/am335x-base0033.dts                  |  2 --
 arch/arm/boot/dts/am335x-bone-common.dtsi              |  4 ----
 arch/arm/boot/dts/am335x-boneblue.dts                  | 11 -----------
 arch/arm/boot/dts/am335x-evmsk.dts                     |  4 ----
 arch/arm/boot/dts/am335x-icev2.dts                     | 14 --------------
 arch/arm/boot/dts/am335x-moxa-uc-2101.dts              |  1 -
 arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts         |  9 ---------
 arch/arm/boot/dts/am335x-nano.dts                      |  1 -
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts            |  4 ----
 arch/arm/boot/dts/am335x-pepper.dts                    |  2 --
 arch/arm/boot/dts/am335x-pocketbeagle.dts              |  4 ----
 arch/arm/boot/dts/am335x-shc.dts                       |  5 -----
 arch/arm/boot/dts/am335x-sl50.dts                      |  4 ----
 arch/arm/boot/dts/am437x-idk-evm.dts                   |  8 --------
 arch/arm/boot/dts/am437x-sk-evm.dts                    |  4 ----
 arch/arm/boot/dts/am571x-idk.dts                       | 18 ------------------
 arch/arm/boot/dts/am572x-idk-common.dtsi               | 18 ------------------
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi        |  4 ----
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts              |  1 -
 arch/arm/boot/dts/am57xx-idk-common.dtsi               |  8 --------
 arch/arm/boot/dts/arm-realview-eb.dtsi                 |  7 -------
 arch/arm/boot/dts/arm-realview-pb1176.dts              |  7 -------
 arch/arm/boot/dts/arm-realview-pb11mp.dts              |  7 -------
 arch/arm/boot/dts/arm-realview-pbx.dtsi                |  7 -------
 arch/arm/boot/dts/armada-370-mirabox.dts               |  2 --
 arch/arm/boot/dts/armada-370-netgear-rn104.dts         |  5 -----
 .../boot/dts/armada-370-seagate-personal-cloud.dtsi    |  1 -
 arch/arm/boot/dts/armada-385-linksys.dtsi              |  1 -
 arch/arm/boot/dts/armada-385-synology-ds116.dts        |  1 -
 arch/arm/boot/dts/armada-388-helios4.dts               |  5 -----
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts        |  4 ----
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts         |  5 -----
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts       |  2 --
 arch/arm/boot/dts/at91-gatwick.dts                     |  6 ------
 arch/arm/boot/dts/at91-vinco.dts                       |  5 -----
 arch/arm/boot/dts/at91-wb50n.dts                       |  3 ---
 arch/arm/boot/dts/dra7-evm-common.dtsi                 |  4 ----
 arch/arm/boot/dts/exynos4412-itop-elite.dts            |  2 --
 arch/arm/boot/dts/exynos4412-tiny4412.dts              |  4 ----
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi        |  1 -
 arch/arm/boot/dts/gemini-dlink-dir-685.dts             |  2 --
 arch/arm/boot/dts/gemini-dlink-dns-313.dts             |  3 ---
 arch/arm/boot/dts/gemini-rut1xx.dts                    |  1 -
 arch/arm/boot/dts/gemini-sl93512r.dts                  |  1 -
 arch/arm/boot/dts/gemini-sq201.dts                     |  1 -
 arch/arm/boot/dts/gemini-wbd111.dts                    |  3 ---
 arch/arm/boot/dts/gemini-wbd222.dts                    |  3 ---
 arch/arm/boot/dts/imx53-cx9020.dts                     |  2 --
 arch/arm/boot/dts/imx53-kp.dtsi                        |  2 --
 arch/arm/boot/dts/imx53-voipac-bsb.dts                 |  2 --
 arch/arm/boot/dts/imx6dl-riotboard.dts                 |  1 -
 arch/arm/boot/dts/imx6q-gw5400-a.dts                   |  2 --
 arch/arm/boot/dts/imx6q-h100.dts                       |  2 --
 arch/arm/boot/dts/imx6q-kp.dtsi                        |  2 --
 arch/arm/boot/dts/imx6q-marsboard.dts                  |  2 --
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi                  |  1 -
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi                  |  2 --
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi                  |  2 --
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi                  |  2 --
 arch/arm/boot/dts/imx6qdl-gw552x.dtsi                  |  2 --
 arch/arm/boot/dts/imx6qdl-gw553x.dtsi                  |  1 -
 arch/arm/boot/dts/imx6qdl-gw560x.dtsi                  |  2 --
 arch/arm/boot/dts/imx6qdl-gw5903.dtsi                  |  1 -
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi                  |  2 --
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi               |  5 -----
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi           |  1 -
 arch/arm/boot/dts/imx6qdl-rex.dtsi                     |  1 -
 arch/arm/boot/dts/imx6qdl-ts4900.dtsi                  |  1 -
 arch/arm/boot/dts/imx6qdl-ts7970.dtsi                  |  4 ----
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi                 |  1 -
 arch/arm/boot/dts/integrator.dtsi                      |  3 ---
 arch/arm/boot/dts/keystone-k2g-ice.dts                 | 12 ------------
 arch/arm/boot/dts/kirkwood-b3.dts                      |  1 -
 arch/arm/boot/dts/lpc3250-ea3250.dts                   | 12 ------------
 arch/arm/boot/dts/lpc3250-phy3250.dts                  |  1 -
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts            | 12 ------------
 arch/arm/boot/dts/meson8b-odroidc1.dts                 |  1 -
 arch/arm/boot/dts/mps2.dtsi                            |  1 -
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts          |  6 ------
 arch/arm/boot/dts/omap3-igep0020-common.dtsi           |  2 --
 arch/arm/boot/dts/omap3-igep0030-common.dtsi           |  3 ---
 arch/arm/boot/dts/omap3-pandora-common.dtsi            |  4 ----
 arch/arm/boot/dts/omap5-cm-t54.dts                     |  1 -
 arch/arm/boot/dts/omap5-igep0050.dts                   |  3 ---
 arch/arm/boot/dts/omap5-uevm.dts                       |  9 ---------
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts         |  3 ---
 arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts    |  6 ------
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi               |  5 -----
 arch/arm/boot/dts/rk3066a-mk808.dts                    |  1 -
 arch/arm/boot/dts/rk3188-radxarock.dts                 |  3 ---
 arch/arm/boot/dts/ste-nomadik-s8815.dts                |  1 -
 arch/arm/boot/dts/stih410-b2260.dts                    |  4 ----
 arch/arm/boot/dts/stih418-b2199.dts                    |  1 -
 arch/arm/boot/dts/stihxxx-b2120.dtsi                   |  1 -
 arch/arm/boot/dts/versatile-ab.dts                     |  7 -------
 arch/arm/boot/dts/vf610-zii-cfu1.dts                   |  4 ----
 arch/arm/boot/dts/zynq-zturn.dts                       |  2 --
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts    |  1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts |  2 --
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts     |  1 -
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi          |  7 -------
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts      |  3 ---
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts   |  4 ----
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts         |  2 --
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts      |  2 --
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi              |  6 ------
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts        |  1 -
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi          |  1 -
 arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts        |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts      |  1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts      |  2 --
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts           |  1 -
 arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts         |  4 ----
 arch/mips/boot/dts/qca/ar9331_omega.dts                |  1 -
 arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts            |  4 ----
 120 files changed, 439 deletions(-)

diff --git a/arch/arc/boot/dts/abilis_tb100_dvk.dts b/arch/arc/boot/dts/abilis_tb100_dvk.dts
index 3acf04d..e4ea2c9 100644
--- a/arch/arc/boot/dts/abilis_tb100_dvk.dts
+++ b/arch/arc/boot/dts/abilis_tb100_dvk.dts
@@ -76,52 +76,42 @@
 			led2 {
 				label = "LED2";
 				gpios = <&gpioi 2 0>;
-				default-state = "off";
 			};
 			led3 {
 				label = "LED3";
 				gpios = <&gpioi 3 0>;
-				default-state = "off";
 			};
 			led4 {
 				label = "LED4";
 				gpios = <&gpioi 4 0>;
-				default-state = "off";
 			};
 			led5 {
 				label = "LED5";
 				gpios = <&gpioi 5 0>;
-				default-state = "off";
 			};
 			led6 {
 				label = "LED6";
 				gpios = <&gpioi 6 0>;
-				default-state = "off";
 			};
 			led7 {
 				label = "LED7";
 				gpios = <&gpioi 7 0>;
-				default-state = "off";
 			};
 			led8 {
 				label = "LED8";
 				gpios = <&gpioi 8 0>;
-				default-state = "off";
 			};
 			led9 {
 				label = "LED9";
 				gpios = <&gpioi 9 0>;
-				default-state = "off";
 			};
 			led10 {
 				label = "LED10";
 				gpios = <&gpioi 10 0>;
-				default-state = "off";
 			};
 			led11 {
 				label = "LED11";
 				gpios = <&gpioi 11 0>;
-				default-state = "off";
 			};
 		};
 	};
diff --git a/arch/arc/boot/dts/abilis_tb101_dvk.dts b/arch/arc/boot/dts/abilis_tb101_dvk.dts
index 37d88c5..155ecd3 100644
--- a/arch/arc/boot/dts/abilis_tb101_dvk.dts
+++ b/arch/arc/boot/dts/abilis_tb101_dvk.dts
@@ -76,52 +76,42 @@
 			led2 {
 				label = "LED2";
 				gpios = <&gpioi 2 0>;
-				default-state = "off";
 			};
 			led3 {
 				label = "LED3";
 				gpios = <&gpioi 3 0>;
-				default-state = "off";
 			};
 			led4 {
 				label = "LED4";
 				gpios = <&gpioi 4 0>;
-				default-state = "off";
 			};
 			led5 {
 				label = "LED5";
 				gpios = <&gpioi 5 0>;
-				default-state = "off";
 			};
 			led6 {
 				label = "LED6";
 				gpios = <&gpioi 6 0>;
-				default-state = "off";
 			};
 			led7 {
 				label = "LED7";
 				gpios = <&gpioi 7 0>;
-				default-state = "off";
 			};
 			led8 {
 				label = "LED8";
 				gpios = <&gpioi 8 0>;
-				default-state = "off";
 			};
 			led9 {
 				label = "LED9";
 				gpios = <&gpioi 9 0>;
-				default-state = "off";
 			};
 			led10 {
 				label = "LED10";
 				gpios = <&gpioi 10 0>;
-				default-state = "off";
 			};
 			led11 {
 				label = "LED11";
 				gpios = <&gpioi 11 0>;
-				default-state = "off";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/am335x-baltos-leds.dtsi b/arch/arm/boot/dts/am335x-baltos-leds.dtsi
index 3ab1767..928bd01 100644
--- a/arch/arm/boot/dts/am335x-baltos-leds.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos-leds.dtsi
@@ -29,12 +29,10 @@
 		wlan {
 			label = "onrisc:blue:wlan";
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		app {
 			label = "onrisc:green:app";
 			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am335x-base0033.dts b/arch/arm/boot/dts/am335x-base0033.dts
index 29782be..62176b2 100644
--- a/arch/arm/boot/dts/am335x-base0033.dts
+++ b/arch/arm/boot/dts/am335x-base0033.dts
@@ -32,13 +32,11 @@
 		led0 {
 			label = "base:red:user";
 			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;	/* gpio1_21 */
-			default-state = "off";
 		};
 
 		led1 {
 			label = "base:green:user";
 			gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;	/* gpio2_0 */
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 9e5e75e..9064303 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -32,28 +32,24 @@
 			label = "beaglebone:green:heartbeat";
 			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led3 {
 			label = "beaglebone:green:mmc0";
 			gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led4 {
 			label = "beaglebone:green:usr2";
 			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 
 		led5 {
 			label = "beaglebone:green:usr3";
 			gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc1";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index 7bcd726..a056fdc 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -39,71 +39,60 @@
 			label = "beaglebone:green:usr0";
 			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		usr_1_led {
 			label = "beaglebone:green:usr1";
 			gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		usr_2_led {
 			label = "beaglebone:green:usr2";
 			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 
 		usr_3_led {
 			label = "beaglebone:green:usr3";
 			gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc1";
-			default-state = "off";
 		};
 
 		wifi_led {
 			label = "wifi";
 			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "phy0assoc";
 		};
 
 		red_led {
 			label = "red";
 			gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green_led {
 			label = "green";
 			gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		batt_1_led {
 			label = "bat25";
 			gpios = <&gpio0 27 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		batt_2_led {
 			label = "bat50";
 			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		batt_3_led {
 			label = "bat75";
 			gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		batt_4_led {
 			label = "bat100";
 			gpios = <&gpio0 26 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index 245868f..3751ea2 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -82,27 +82,23 @@
 		led1 {
 			label = "evmsk:green:usr0";
 			gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "evmsk:green:usr1";
 			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "evmsk:green:mmc0";
 			gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led4 {
 			label = "evmsk:green:heartbeat";
 			gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
index f2005ec..4468900 100644
--- a/arch/arm/boot/dts/am335x-icev2.dts
+++ b/arch/arm/boot/dts/am335x-icev2.dts
@@ -53,49 +53,41 @@
 		led-out0 {
 			label = "out0";
 			gpios = <&tpic2810 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out1 {
 			label = "out1";
 			gpios = <&tpic2810 1 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out2 {
 			label = "out2";
 			gpios = <&tpic2810 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out3 {
 			label = "out3";
 			gpios = <&tpic2810 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out4 {
 			label = "out4";
 			gpios = <&tpic2810 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out5 {
 			label = "out5";
 			gpios = <&tpic2810 5 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out6 {
 			label = "out6";
 			gpios = <&tpic2810 6 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out7 {
 			label = "out7";
 			gpios = <&tpic2810 7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
@@ -108,39 +100,33 @@
 		led0 {
 			label = "status0:red:cpu0";
 			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "cpu0";
 		};
 
 		led1 {
 			label = "status0:green:usr";
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "status0:yellow:usr";
 			gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "status1:red:mmc0";
 			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
 
 		led4 {
 			label = "status1:green:usr";
 			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led5 {
 			label = "status1:yellow:usr";
 			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 	gpio-decoder {
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-2101.dts b/arch/arm/boot/dts/am335x-moxa-uc-2101.dts
index 48aee6d..bfc1070 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-2101.dts
+++ b/arch/arm/boot/dts/am335x-moxa-uc-2101.dts
@@ -20,7 +20,6 @@
 		led1 {
 			label = "UC2100:GREEN:USER";
 			gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
index 5a58efc..a1f4dbb 100644
--- a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
+++ b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
@@ -45,50 +45,41 @@
 		led1 {
 			label = "uc8100me:CEL1";
 			gpios = <&gpio_xten 8 0>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "uc8100me:CEL2";
 			gpios = <&gpio_xten 9 0>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "uc8100me:CEL3";
 			gpios = <&gpio_xten 10 0>;
-			default-state = "off";
 		};
 
 		led4 {
 			label = "uc8100me:DIA1";
 			gpios = <&gpio_xten 11 0>;
-			default-state = "off";
 		};
 		led5 {
 			label = "uc8100me:DIA2";
 			gpios = <&gpio_xten 12 0>;
-			default-state = "off";
 		};
 		led6 {
 			label = "uc8100me:DIA3";
 			gpios = <&gpio_xten 13 0>;
-			default-state = "off";
 		};
 		led7 {
 			label = "uc8100me:SD";
 			gpios = <&gpio_xten 14 0>;
-			default-state = "off";
 		};
 		led8 {
 			label = "uc8100me:USB";
 			gpios = <&gpio_xten 15 0>;
-			default-state = "off";
 		};
 		led9 {
 			label = "uc8100me:USER";
 			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 9c9143e..db74914 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -30,7 +30,6 @@
 		led0 {
 			label = "nanobone:green:usr1";
 			gpios = <&gpio1 5 0>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
index 85cd1d0..29da34e 100644
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -230,28 +230,24 @@
 			label = "beaglebone:green:usr0";
 			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led3 {
 			label = "beaglebone:green:usr1";
 			gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led4 {
 			label = "beaglebone:green:usr2";
 			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 
 		led5 {
 			label = "beaglebone:green:usr3";
 			gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc1";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
index 6be79b8..58b44d8 100644
--- a/arch/arm/boot/dts/am335x-pepper.dts
+++ b/arch/arm/boot/dts/am335x-pepper.dts
@@ -607,14 +607,12 @@
 		label = "pepper:user0:blue";
 		gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
 		linux,default-trigger = "none";
-		default-state = "off";
 	};
 
 	led1 {
 		label = "pepper:user1:red";
 		gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 		linux,default-trigger = "none";
-		default-state = "off";
 	};
 };
 
diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index 62fe5ca..0704217 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -27,27 +27,23 @@
 			label = "beaglebone:green:usr0";
 			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		usr1 {
 			label = "beaglebone:green:usr1";
 			gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		usr2 {
 			label = "beaglebone:green:usr2";
 			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 
 		usr3 {
 			label = "beaglebone:green:usr3";
 			gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-shc.dts b/arch/arm/boot/dts/am335x-shc.dts
index 1d925ed..d925b05 100644
--- a/arch/arm/boot/dts/am335x-shc.dts
+++ b/arch/arm/boot/dts/am335x-shc.dts
@@ -67,7 +67,6 @@
 		led1 {
 			label = "shc:power:red";
 			gpios = <&gpio0 23 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led2 {
@@ -80,25 +79,21 @@
 		led3 {
 			label = "shc:lan:red";
 			gpios = <&gpio0 26 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led4 {
 			label = "shc:lan:bl";
 			gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led5 {
 			label = "shc:cloud:red";
 			gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led6 {
 			label = "shc:cloud:bl";
 			gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am335x-sl50.dts b/arch/arm/boot/dts/am335x-sl50.dts
index 38d57b8..81bd855 100644
--- a/arch/arm/boot/dts/am335x-sl50.dts
+++ b/arch/arm/boot/dts/am335x-sl50.dts
@@ -38,25 +38,21 @@
 		led0 {
 			label = "sl50:red:usr0";
 			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led1 {
 			label = "sl50:green:usr1";
 			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "sl50:red:usr2";
 			gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "sl50:green:usr3";
 			gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index bb28540..5d60df0 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -128,49 +128,41 @@
 		led-out0 {
 			label = "out0";
 			gpios = <&tpic2810 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out1 {
 			label = "out1";
 			gpios = <&tpic2810 1 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out2 {
 			label = "out2";
 			gpios = <&tpic2810 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out3 {
 			label = "out3";
 			gpios = <&tpic2810 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out4 {
 			label = "out4";
 			gpios = <&tpic2810 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out5 {
 			label = "out5";
 			gpios = <&tpic2810 5 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out6 {
 			label = "out6";
 			gpios = <&tpic2810 6 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out7 {
 			label = "out7";
 			gpios = <&tpic2810 7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 088cba0..b670825 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -102,27 +102,23 @@
 			label = "am437x-sk:red:heartbeat";
 			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;	/* Bank 5, pin 0 */
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led1 {
 			label = "am437x-sk:green:mmc1";
 			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;	/* Bank 5, pin 1 */
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led2 {
 			label = "am437x-sk:blue:cpu0";
 			gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;	/* Bank 5, pin 2 */
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 
 		led3 {
 			label = "am437x-sk:blue:usr3";
 			gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;	/* Bank 5, pin 3 */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index 6432309..3227bac 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -28,39 +28,33 @@
 		cpu0-led {
 			label = "status0:red:cpu0";
 			gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "cpu0";
 		};
 
 		usr0-led {
 			label = "status0:green:usr";
 			gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		heartbeat-led {
 			label = "status0:blue:heartbeat";
 			gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 
 		usr1-led {
 			label = "status1:red:usr";
 			gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		usr2-led {
 			label = "status1:green:usr";
 			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		mmc0-led {
 			label = "status1:blue:mmc0";
 			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
 	};
@@ -71,73 +65,61 @@
 		red0-led {
 			label = "idk:red0";
 			gpios = <&gpio6 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green0-led {
 			label = "idk:green0";
 			gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue0-led {
 			label = "idk:blue0";
 			gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red1-led {
 			label = "idk:red1";
 			gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green1-led {
 			label = "idk:green1";
 			gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue1-led {
 			label = "idk:blue1";
 			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red2-led {
 			label = "idk:red2";
 			gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green2-led {
 			label = "idk:green2";
 			gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue2-led {
 			label = "idk:blue2";
 			gpios = <&gpio7 10 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red3-led {
 			label = "idk:red3";
 			gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green3-led {
 			label = "idk:green3";
 			gpios = <&gpio7 25 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue3-led {
 			label = "idk:blue3";
 			gpios = <&gpio7 24 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am572x-idk-common.dtsi b/arch/arm/boot/dts/am572x-idk-common.dtsi
index a064f13..792bcf4 100644
--- a/arch/arm/boot/dts/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/am572x-idk-common.dtsi
@@ -18,40 +18,34 @@
 		cpu0-led {
 			label = "status0:red:cpu0";
 			gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "cpu0";
 		};
 
 		usr0-led {
 			label = "status0:green:usr";
 			gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		heartbeat-led {
 			label = "status0:blue:heartbeat";
 			gpios = <&gpio3 12 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 
 		cpu1-led {
 			label = "status1:red:cpu1";
 			gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "cpu1";
 		};
 
 		usr1-led {
 			label = "status1:green:usr";
 			gpios = <&gpio7 23 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		mmc0-led {
 			label = "status1:blue:mmc0";
 			gpios = <&gpio7 22 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
 	};
@@ -62,73 +56,61 @@
 		red0-led {
 			label = "idk:red0";
 			gpios = <&gpio6 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green0-led {
 			label = "idk:green0";
 			gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue0-led {
 			label = "idk:blue0";
 			gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red1-led {
 			label = "idk:red1";
 			gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green1-led {
 			label = "idk:green1";
 			gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue1-led {
 			label = "idk:blue1";
 			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red2-led {
 			label = "idk:red2";
 			gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green2-led {
 			label = "idk:green2";
 			gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue2-led {
 			label = "idk:blue2";
 			gpios = <&gpio7 10 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red3-led {
 			label = "idk:red3";
 			gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		green3-led {
 			label = "idk:green3";
 			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue3-led {
 			label = "idk:blue3";
 			gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index ad95311..8b86a17 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -68,28 +68,24 @@
 			label = "beagle-x15:usr0";
 			gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led1 {
 			label = "beagle-x15:usr1";
 			gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 
 		led2 {
 			label = "beagle-x15:usr2";
 			gpios = <&gpio7 14 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led3 {
 			label = "beagle-x15:usr3";
 			gpios = <&gpio7 15 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "disk-activity";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 4748ce8..c8436ce 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -33,7 +33,6 @@
 			label = "cl-som-am57x:green";
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index f7bd264..9b261d2 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -54,49 +54,41 @@
 		led-out0 {
 			label = "out0";
 			gpios = <&tpic2810 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out1 {
 			label = "out1";
 			gpios = <&tpic2810 1 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out2 {
 			label = "out2";
 			gpios = <&tpic2810 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out3 {
 			label = "out3";
 			gpios = <&tpic2810 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out4 {
 			label = "out4";
 			gpios = <&tpic2810 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out5 {
 			label = "out5";
 			gpios = <&tpic2810 5 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out6 {
 			label = "out6";
 			gpios = <&tpic2810 6 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led-out7 {
 			label = "out7";
 			gpios = <&tpic2810 7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm-realview-eb.dtsi
index 0e4c7c4..e79bb84 100644
--- a/arch/arm/boot/dts/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm-realview-eb.dtsi
@@ -205,7 +205,6 @@
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
-				default-state = "off";
 			};
 			led at 08.2 {
 				compatible = "register-bit-led";
@@ -213,42 +212,36 @@
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
-				default-state = "off";
 			};
 			led at 08.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
-				default-state = "off";
 			};
 			led at 08.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
-				default-state = "off";
 			};
 			led at 08.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
-				default-state = "off";
 			};
 			led at 08.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
-				default-state = "off";
 			};
 			led at 08.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
-				default-state = "off";
 			};
 			oscclk0: osc0 at 0c {
 				compatible = "arm,syscon-icst307";
diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index 83e0fbc..48e5601 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -223,7 +223,6 @@
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
-				default-state = "off";
 			};
 			led at 08.2 {
 				compatible = "register-bit-led";
@@ -231,42 +230,36 @@
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
-				default-state = "off";
 			};
 			led at 08.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
-				default-state = "off";
 			};
 			led at 08.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
-				default-state = "off";
 			};
 			led at 08.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
-				default-state = "off";
 			};
 			led at 08.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
-				default-state = "off";
 			};
 			led at 08.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
-				default-state = "off";
 			};
 			oscclk0: osc0 at 0c {
 				compatible = "arm,syscon-icst307";
diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index 2f6aa24..0540e2a 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -310,7 +310,6 @@
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
-				default-state = "off";
 			};
 			led at 08.2 {
 				compatible = "register-bit-led";
@@ -318,7 +317,6 @@
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
-				default-state = "off";
 			};
 			led at 08.3 {
 				compatible = "register-bit-led";
@@ -326,7 +324,6 @@
 				mask = <0x08>;
 				label = "versatile:3";
 				linux,default-trigger = "cpu1";
-				default-state = "off";
 			};
 			led at 08.4 {
 				compatible = "register-bit-led";
@@ -334,7 +331,6 @@
 				mask = <0x10>;
 				label = "versatile:4";
 				linux,default-trigger = "cpu2";
-				default-state = "off";
 			};
 			led at 08.5 {
 				compatible = "register-bit-led";
@@ -342,21 +338,18 @@
 				mask = <0x20>;
 				label = "versatile:5";
 				linux,default-trigger = "cpu3";
-				default-state = "off";
 			};
 			led at 08.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
-				default-state = "off";
 			};
 			led at 08.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
-				default-state = "off";
 			};
 
 			oscclk0: osc0 at 0c {
diff --git a/arch/arm/boot/dts/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm-realview-pbx.dtsi
index a567669..06639a1 100644
--- a/arch/arm/boot/dts/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm-realview-pbx.dtsi
@@ -227,7 +227,6 @@
 				mask = <0x02>;
 				label = "versatile:1";
 				linux,default-trigger = "mmc0";
-				default-state = "off";
 			};
 			led at 08.2 {
 				compatible = "register-bit-led";
@@ -235,42 +234,36 @@
 				mask = <0x04>;
 				label = "versatile:2";
 				linux,default-trigger = "cpu0";
-				default-state = "off";
 			};
 			led at 08.3 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x08>;
 				label = "versatile:3";
-				default-state = "off";
 			};
 			led at 08.4 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x10>;
 				label = "versatile:4";
-				default-state = "off";
 			};
 			led at 08.5 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x20>;
 				label = "versatile:5";
-				default-state = "off";
 			};
 			led at 08.6 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x40>;
 				label = "versatile:6";
-				default-state = "off";
 			};
 			led at 08.7 {
 				compatible = "register-bit-led";
 				offset = <0x08>;
 				mask = <0x80>;
 				label = "versatile:7";
-				default-state = "off";
 			};
 			oscclk0: osc0 at 0c {
 				compatible = "arm,syscon-icst307";
diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index 7c2f5a7..db8491f 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -50,13 +50,11 @@
 				blue_stat_led {
 					label = "mirabox:blue:stat";
 					gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
-					default-state = "off";
 				};
 
 				green_stat_led {
 					label = "mirabox:green:stat";
 					gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
-					default-state = "off";
 				};
 			};
 
diff --git a/arch/arm/boot/dts/armada-370-netgear-rn104.dts b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
index 9fd1cb9..077ee03 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn104.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
@@ -109,7 +109,6 @@
 		blue-backup-led {
 			label = "rn104:blue:backup";
 			gpios = <&gpio1 31 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		blue-power-led {
@@ -121,25 +120,21 @@
 		blue-sata1-led {
 			label = "rn104:blue:sata1";
 			gpios = <&pca9554 0 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		blue-sata2-led {
 			label = "rn104:blue:sata2";
 			gpios = <&pca9554 1 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		blue-sata3-led {
 			label = "rn104:blue:sata3";
 			gpios = <&pca9554 2 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		blue-sata4-led {
 			label = "rn104:blue:sata4";
 			gpios = <&pca9554 3 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi b/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi
index a624b23..ad4c402 100644
--- a/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi
+++ b/arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi
@@ -112,7 +112,6 @@
 		red-sata0 {
 			label = "cumulus:red:sata0";
 			gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 827e82b..63bf3e4 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -78,7 +78,6 @@
 
 		sata {
 			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			linux,default-trigger = "disk-activity";
 		};
 	};
diff --git a/arch/arm/boot/dts/armada-385-synology-ds116.dts b/arch/arm/boot/dts/armada-385-synology-ds116.dts
index d8769956..dfa673e 100644
--- a/arch/arm/boot/dts/armada-385-synology-ds116.dts
+++ b/arch/arm/boot/dts/armada-385-synology-ds116.dts
@@ -152,7 +152,6 @@
 			orange {
 				gpios = <&gpio0 13 GPIO_ACTIVE_HIGH>;
 				label = "ds116:orange:disk";
-				default-state = "off";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/armada-388-helios4.dts b/arch/arm/boot/dts/armada-388-helios4.dts
index 705adfa..7590698 100644
--- a/arch/arm/boot/dts/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/armada-388-helios4.dts
@@ -90,31 +90,26 @@
 			label = "helios4:green:ata1";
 			gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata1";
-			default-state = "off";
 		};
 		sata2-led {
 			label = "helios4:green:ata2";
 			gpios = <&gpio1 18 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata2";
-			default-state = "off";
 		};
 		sata3-led {
 			label = "helios4:green:ata3";
 			gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata3";
-			default-state = "off";
 		};
 		sata4-led {
 			label = "helios4:green:ata4";
 			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata4";
-			default-state = "off";
 		};
 		usb-led {
 			label = "helios4:green:usb";
 			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "usb-host";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
index bbbb388..fee40e1 100644
--- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
+++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
@@ -189,7 +189,6 @@
 		hdd-led {
 			label = "ix4-300d:hdd:blue";
 			gpios = <&gpio0 26 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		power-led {
@@ -203,19 +202,16 @@
 		sysfail-led {
 			label = "ix4-300d:sysfail:red";
 			gpios = <&gpio_spi 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		sys-led {
 			label = "ix4-300d:sys:blue";
 			gpios = <&gpio_spi 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		hddfail-led {
 			label = "ix4-300d:hddfail:red";
 			gpios = <&gpio_spi 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 	};
diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
index 8ea7358..d836d97 100644
--- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
+++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
@@ -137,31 +137,26 @@
 		red-sata1-led {
 			label = "rn2120:red:sata1";
 			gpios = <&gpio0 31 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red-sata2-led {
 			label = "rn2120:red:sata2";
 			gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red-sata3-led {
 			label = "rn2120:red:sata3";
 			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red-sata4-led {
 			label = "rn2120:red:sata4";
 			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red-err-led {
 			label = "rn2120:red:err";
 			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index 0efcc16..ff6c361 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -81,13 +81,11 @@
 				red_led {
 					label = "red_led";
 					gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
-					default-state = "off";
 				};
 
 				yellow_led {
 					label = "yellow_led";
 					gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
-					default-state = "off";
 				};
 
 				green_led {
diff --git a/arch/arm/boot/dts/at91-gatwick.dts b/arch/arm/boot/dts/at91-gatwick.dts
index 5a81cab..5941a8e 100644
--- a/arch/arm/boot/dts/at91-gatwick.dts
+++ b/arch/arm/boot/dts/at91-gatwick.dts
@@ -34,37 +34,31 @@
 		ethernet {
 			label = "gatwick:yellow:ethernet";
 			gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		wifi {
 			label = "gatwick:green:wifi";
 			gpios = <&pioA 28 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		ble {
 			label = "gatwick:blue:ble";
 			gpios = <&pioA 22 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		lora {
 			label = "gatwick:orange:lora";
 			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		blank {
 			label = "gatwick:green:blank";
 			gpios = <&pioA 24 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		user {
 			label = "gatwick:yellow:user";
 			gpios = <&pioA 12 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/at91-vinco.dts b/arch/arm/boot/dts/at91-vinco.dts
index 4302772..62427dd 100644
--- a/arch/arm/boot/dts/at91-vinco.dts
+++ b/arch/arm/boot/dts/at91-vinco.dts
@@ -222,31 +222,26 @@
 		led_err {
 			label = "err";
 			gpios = <&pioA 7 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led_rssi {
 			label = "rssi";
 			gpios = <&pioA 9 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led_tls {
 			label = "tls";
 			gpios = <&pioA 24 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led_lmc {
 			label = "lmc";
 			gpios = <&pioA 25 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led_wmt {
 			label = "wmt";
 			gpios = <&pioA 29 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led_pwr {
diff --git a/arch/arm/boot/dts/at91-wb50n.dts b/arch/arm/boot/dts/at91-wb50n.dts
index 8cecc70..01852bf 100644
--- a/arch/arm/boot/dts/at91-wb50n.dts
+++ b/arch/arm/boot/dts/at91-wb50n.dts
@@ -41,19 +41,16 @@
 		led0 {
 			label = "wb50n:blue:led0";
 			gpios = <&pioA 12 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led1 {
 			label = "wb50n:green:led1";
 			gpios = <&pioA 24 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "wb50n:red:led2";
 			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 7e18147..87ff66f 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -64,25 +64,21 @@
 		led0 {
 			label = "dra7:usr1";
 			gpios = <&pcf_lcd 4 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led1 {
 			label = "dra7:usr2";
 			gpios = <&pcf_lcd 5 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "dra7:usr3";
 			gpios = <&pcf_lcd 6 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "dra7:usr4";
 			gpios = <&pcf_lcd 7 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 0dedeba..e4dd4ac 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -30,14 +30,12 @@
 		led2 {
 			label = "red:system";
 			gpios = <&gpx1 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 
 		led3 {
 			label = "red:user";
 			gpios = <&gpk1 1 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 01f37b5..e24ad43 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -31,26 +31,22 @@
 		led1 {
 			label = "led1";
 			gpios = <&gpm4 0 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 
 		led2 {
 			label = "led2";
 			gpios = <&gpm4 1 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "led3";
 			gpios = <&gpm4 2 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led4 {
 			label = "led4";
 			gpios = <&gpm4 3 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 56acd83..4b78677 100644
--- a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
+++ b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
@@ -40,7 +40,6 @@
 		redled {
 			label = "red:microSD";
 			gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "mmc1";
 		};
 	};
diff --git a/arch/arm/boot/dts/gemini-dlink-dir-685.dts b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
index 6f258b5..2bebf74 100644
--- a/arch/arm/boot/dts/gemini-dlink-dir-685.dts
+++ b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
@@ -107,14 +107,12 @@
 			label = "dir685:blue:HD";
 			/* Collides with LPC_SERIRQ, UART DTR, SSP FSC pins */
 			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "disk-read";
 		};
 		led-orange-hd {
 			label = "dir685:orange:HD";
 			/* Collides with LPC_LAD[2], UART DSR, SSP ECLK pins */
 			gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "disk-write";
 		};
 	};
diff --git a/arch/arm/boot/dts/gemini-dlink-dns-313.dts b/arch/arm/boot/dts/gemini-dlink-dns-313.dts
index d132932..8d96e22 100644
--- a/arch/arm/boot/dts/gemini-dlink-dns-313.dts
+++ b/arch/arm/boot/dts/gemini-dlink-dns-313.dts
@@ -53,18 +53,15 @@
 		led-disk-blue {
 			label = "dns313:blue:disk";
 			gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-disk-green {
 			label = "dns313:green:disk";
 			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "disk-read";
 		};
 		led-disk-red {
 			label = "dns313:red:disk";
 			gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "disk-write";
 		};
 	};
diff --git a/arch/arm/boot/dts/gemini-rut1xx.dts b/arch/arm/boot/dts/gemini-rut1xx.dts
index eb4f0bf..b4274a4 100644
--- a/arch/arm/boot/dts/gemini-rut1xx.dts
+++ b/arch/arm/boot/dts/gemini-rut1xx.dts
@@ -51,7 +51,6 @@
 			label = "rut1xx::power";
 			/* Conflict with NAND CE0 */
 			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 	};
diff --git a/arch/arm/boot/dts/gemini-sl93512r.dts b/arch/arm/boot/dts/gemini-sl93512r.dts
index ebefb72..501cc2e 100644
--- a/arch/arm/boot/dts/gemini-sl93512r.dts
+++ b/arch/arm/boot/dts/gemini-sl93512r.dts
@@ -56,7 +56,6 @@
 			label = "sq201:green:harddisk";
 			/* Conflict with LCD (no problem) */
 			gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			linux,default-trigger = "disk-activity";
 		};
 		led-green-wireless {
diff --git a/arch/arm/boot/dts/gemini-sq201.dts b/arch/arm/boot/dts/gemini-sq201.dts
index 3787cf3..f6fcce1 100644
--- a/arch/arm/boot/dts/gemini-sq201.dts
+++ b/arch/arm/boot/dts/gemini-sq201.dts
@@ -50,7 +50,6 @@
 			label = "sq201:green:usb";
 			/* Conflict with parallel and NAND flash */
 			gpios = <&gpio0 31 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "usb-host";
 		};
 	};
diff --git a/arch/arm/boot/dts/gemini-wbd111.dts b/arch/arm/boot/dts/gemini-wbd111.dts
index 29af86c..ad677e6 100644
--- a/arch/arm/boot/dts/gemini-wbd111.dts
+++ b/arch/arm/boot/dts/gemini-wbd111.dts
@@ -45,19 +45,16 @@
 			label = "wbd111:red:L3";
 			/* Conflict with TVC and extended parallel flash */
 			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-green-l4 {
 			label = "wbd111:green:L4";
 			/* Conflict with TVC and extended parallel flash */
 			gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-red-l4 {
 			label = "wbd111:red:L4";
 			/* Conflict with TVC and extended parallel flash */
 			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-greeb-l3 {
 			label = "wbd111:green:L3";
diff --git a/arch/arm/boot/dts/gemini-wbd222.dts b/arch/arm/boot/dts/gemini-wbd222.dts
index 24e6ae3..53b835f 100644
--- a/arch/arm/boot/dts/gemini-wbd222.dts
+++ b/arch/arm/boot/dts/gemini-wbd222.dts
@@ -44,19 +44,16 @@
 			label = "wbd111:red:L3";
 			/* Conflict with TVC and extended parallel flash */
 			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-green-l4 {
 			label = "wbd111:green:L4";
 			/* Conflict with TVC and extended parallel flash */
 			gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-red-l4 {
 			label = "wbd111:red:L4";
 			/* Conflict with TVC and extended parallel flash */
 			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 		led-green-l3 {
 			label = "wbd111:green:L3";
diff --git a/arch/arm/boot/dts/imx53-cx9020.dts b/arch/arm/boot/dts/imx53-cx9020.dts
index cf70ebc4..d0583d5 100644
--- a/arch/arm/boot/dts/imx53-cx9020.dts
+++ b/arch/arm/boot/dts/imx53-cx9020.dts
@@ -90,7 +90,6 @@
 
 		pwr-r {
 			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		pwr-g {
@@ -100,7 +99,6 @@
 
 		pwr-b {
 			gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		sd1-b {
diff --git a/arch/arm/boot/dts/imx53-kp.dtsi b/arch/arm/boot/dts/imx53-kp.dtsi
index 8b25416..766e979 100644
--- a/arch/arm/boot/dts/imx53-kp.dtsi
+++ b/arch/arm/boot/dts/imx53-kp.dtsi
@@ -43,14 +43,12 @@
 			label = "bus";
 			gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "gpio";
-			default-state = "off";
 		};
 
 		led-error {
 			label = "error";
 			gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "gpio";
-			default-state = "off";
 		};
 
 		led-flash {
diff --git a/arch/arm/boot/dts/imx53-voipac-bsb.dts b/arch/arm/boot/dts/imx53-voipac-bsb.dts
index 9570537..ab6e749 100644
--- a/arch/arm/boot/dts/imx53-voipac-bsb.dts
+++ b/arch/arm/boot/dts/imx53-voipac-bsb.dts
@@ -33,13 +33,11 @@
 		led1 {
 			label = "led-red";
 			gpios = <&gpio3 29 0>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "led-orange";
 			gpios = <&gpio2 31 0>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index 8e51491..214dd8a 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -38,7 +38,6 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-gw5400-a.dts b/arch/arm/boot/dts/imx6q-gw5400-a.dts
index a8f70b4..0eedd33 100644
--- a/arch/arm/boot/dts/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/imx6q-gw5400-a.dts
@@ -50,13 +50,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 10 GPIO_ACTIVE_HIGH>; /* 106 -> MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* 111 -> MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-h100.dts b/arch/arm/boot/dts/imx6q-h100.dts
index 714e09e0..b717fb8 100644
--- a/arch/arm/boot/dts/imx6q-h100.dts
+++ b/arch/arm/boot/dts/imx6q-h100.dts
@@ -84,13 +84,11 @@
 		led1: stream {
 			label = "stream";
 			gpios = <&gpio2 29 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led2: rec {
 			label = "rec";
 			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-kp.dtsi b/arch/arm/boot/dts/imx6q-kp.dtsi
index 24c8169..e58134f 100644
--- a/arch/arm/boot/dts/imx6q-kp.dtsi
+++ b/arch/arm/boot/dts/imx6q-kp.dtsi
@@ -70,14 +70,12 @@
 			label = "led1";
 			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "gpio";
-			default-state = "off";
 		};
 
 		red {
 			label = "led0";
 			gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "gpio";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6q-marsboard.dts b/arch/arm/boot/dts/imx6q-marsboard.dts
index dd763f2..b51832d 100644
--- a/arch/arm/boot/dts/imx6q-marsboard.dts
+++ b/arch/arm/boot/dts/imx6q-marsboard.dts
@@ -75,14 +75,12 @@
 		user1 {
 			label = "imx6:green:user1";
 			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 
 		user2 {
 			label = "imx6:green:user2";
 			gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
index 17a7b9c..905822c 100644
--- a/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw51xx.dtsi
@@ -40,7 +40,6 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
index b804468..a8f0e91 100644
--- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
@@ -49,13 +49,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
index 629908f..a7c80e1 100644
--- a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
@@ -49,13 +49,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index a1a6fb5..bdbdf8d 100644
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@ -49,13 +49,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw552x.dtsi b/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
index 81dae5b..9688937 100644
--- a/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw552x.dtsi
@@ -41,13 +41,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/imx6qdl-gw553x.dtsi
index c5d95e8..16cba5f 100644
--- a/arch/arm/boot/dts/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw553x.dtsi
@@ -76,7 +76,6 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 11 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/imx6qdl-gw560x.dtsi
index b5986ef..1e2d053 100644
--- a/arch/arm/boot/dts/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw560x.dtsi
@@ -103,13 +103,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw5903.dtsi b/arch/arm/boot/dts/imx6qdl-gw5903.dtsi
index 3681322..5976c42 100644
--- a/arch/arm/boot/dts/imx6qdl-gw5903.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw5903.dtsi
@@ -79,7 +79,6 @@
 		led0: user1 {
 			label = "user1";
 			gpios = <&gpio6 14 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-gw5904.dtsi b/arch/arm/boot/dts/imx6qdl-gw5904.dtsi
index 3c52bdb..090e35b 100644
--- a/arch/arm/boot/dts/imx6qdl-gw5904.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw5904.dtsi
@@ -83,13 +83,11 @@
 		led1: user2 {
 			label = "user2";
 			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* MX6_PANLEDR */
-			default-state = "off";
 		};
 
 		led2: user3 {
 			label = "user3";
 			gpios = <&gpio4 15 GPIO_ACTIVE_LOW>; /* MX6_LOCLED# */
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
index 29baf25..d594890 100644
--- a/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
@@ -87,31 +87,26 @@
 		j14-pin1 {
 			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 			retain-state-suspended;
-			default-state = "off";
 		};
 
 		j14-pin3 {
 			gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 			retain-state-suspended;
-			default-state = "off";
 		};
 
 		j14-pins8-9 {
 			gpios = <&gpio3 29 GPIO_ACTIVE_LOW>;
 			retain-state-suspended;
-			default-state = "off";
 		};
 
 		j46-pin2 {
 			gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			retain-state-suspended;
-			default-state = "off";
 		};
 
 		j46-pin3 {
 			gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 			retain-state-suspended;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
index 39200e5..1fe6065 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
@@ -183,7 +183,6 @@
 		speaker-enable {
 			gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 			retain-state-suspended;
-			default-state = "off";
 		};
 
 		ttymxc4-rs232 {
diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6qdl-rex.dtsi
index 039e3b8..243a373 100644
--- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
@@ -62,7 +62,6 @@
 		led0: usr {
 			label = "usr";
 			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 		};
 	};
diff --git a/arch/arm/boot/dts/imx6qdl-ts4900.dtsi b/arch/arm/boot/dts/imx6qdl-ts4900.dtsi
index 267c956..1e397cb 100644
--- a/arch/arm/boot/dts/imx6qdl-ts4900.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-ts4900.dtsi
@@ -61,7 +61,6 @@
 		red-led {
 			label = "red-led";
 			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx6qdl-ts7970.dtsi b/arch/arm/boot/dts/imx6qdl-ts7970.dtsi
index f0be516..1fc2478 100644
--- a/arch/arm/boot/dts/imx6qdl-ts7970.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-ts7970.dtsi
@@ -58,19 +58,16 @@
 		red-led {
 			label = "red-led";
 			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		yel-led {
 			label = "yellow-led";
 			gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		blue-led {
 			label = "blue-led";
 			gpios = <&gpio4 25 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		en-usb-5v {
@@ -82,7 +79,6 @@
 		sel_dc_usb {
 			label = "sel_dc_usb";
 			gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 	};
diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
index 53b3eac..0644b07 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -55,7 +55,6 @@
 		red {
 			label = "udoo-neo:red:mmc";
 			gpios = <&gpio6 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
 
diff --git a/arch/arm/boot/dts/integrator.dtsi b/arch/arm/boot/dts/integrator.dtsi
index 4d58638..30f8ed8 100644
--- a/arch/arm/boot/dts/integrator.dtsi
+++ b/arch/arm/boot/dts/integrator.dtsi
@@ -113,21 +113,18 @@
 				offset = <0x04>;
 				mask = <0x02>;
 				label = "integrator:yellow";
-				default-state = "off";
 			};
 			led at 4.2 {
 				compatible = "register-bit-led";
 				offset = <0x04>;
 				mask = <0x04>;
 				label = "integrator:red";
-				default-state = "off";
 			};
 			led at 4.3 {
 				compatible = "register-bit-led";
 				offset = <0x04>;
 				mask = <0x08>;
 				label = "integrator:green1";
-				default-state = "off";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/keystone-k2g-ice.dts b/arch/arm/boot/dts/keystone-k2g-ice.dts
index 2a2d38c..932df42 100644
--- a/arch/arm/boot/dts/keystone-k2g-ice.dts
+++ b/arch/arm/boot/dts/keystone-k2g-ice.dts
@@ -138,75 +138,63 @@
 		led0 {
 			label = "status0:red:cpu0";
 			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "cpu0";
 		};
 
 		led1 {
 			label = "status0:green:usr";
 			gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led2 {
 			label = "status0:yellow:usr";
 			gpios = <&gpio0 13 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led3 {
 			label = "status1:red:mmc0";
 			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "mmc0";
 		};
 
 		led4 {
 			label = "status1:green:usr";
 			gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led5 {
 			label = "status1:yellow:usr";
 			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led6 {
 			label = "status2:red:usr";
 			gpios = <&gpio0 44 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led7 {
 			label = "status2:green:usr";
 			gpios = <&gpio0 43 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led8 {
 			label = "status2:yellow:usr";
 			gpios = <&gpio0 42 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led9 {
 			label = "status3:red:usr";
 			gpios = <&gpio0 41 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led10 {
 			label = "status3:green:usr";
 			gpios = <&gpio0 101 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led11 {
 			label = "status3:yellow:usr";
 			gpios = <&gpio0 102 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		led12 {
diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
index 17f48f8..343999a 100644
--- a/arch/arm/boot/dts/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/kirkwood-b3.dts
@@ -121,7 +121,6 @@
 		programming_led {
 			label = "bubba3:green:programming";
 			gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		error_led {
diff --git a/arch/arm/boot/dts/lpc3250-ea3250.dts b/arch/arm/boot/dts/lpc3250-ea3250.dts
index 58ea0a4..edae2a5 100644
--- a/arch/arm/boot/dts/lpc3250-ea3250.dts
+++ b/arch/arm/boot/dts/lpc3250-ea3250.dts
@@ -90,57 +90,45 @@
 		led1 {
 			gpios = <&gpio 5 14 1>; /* GPO_P3 14, GPIO 93, active low */
 			linux,default-trigger = "timer";
-			default-state = "off";
 		};
 
 		led2 {
 			gpios = <&gpio 2 10 1>; /* P2.10, active low */
-			default-state = "off";
 		};
 
 		led3 {
 			gpios = <&gpio 2 11 1>; /* P2.11, active low */
-			default-state = "off";
 		};
 
 		led4 {
 			gpios = <&gpio 2 12 1>; /* P2.12, active low */
-			default-state = "off";
 		};
 
 		/* LEDs on Base Board */
 
 		lede1 {
 			gpios = <&pca9532 8 0>;
-			default-state = "off";
 		};
 		lede2 {
 			gpios = <&pca9532 9 0>;
-			default-state = "off";
 		};
 		lede3 {
 			gpios = <&pca9532 10 0>;
-			default-state = "off";
 		};
 		lede4 {
 			gpios = <&pca9532 11 0>;
-			default-state = "off";
 		};
 		lede5 {
 			gpios = <&pca9532 12 0>;
-			default-state = "off";
 		};
 		lede6 {
 			gpios = <&pca9532 13 0>;
-			default-state = "off";
 		};
 		lede7 {
 			gpios = <&pca9532 14 0>;
-			default-state = "off";
 		};
 		lede8 {
 			gpios = <&pca9532 15 0>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index 1e1c2f5..09ecd82 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -61,7 +61,6 @@
 
 		led0 { /* red */
 			gpios = <&gpio 5 1 0>; /* GPO_P3 1, GPIO 80, active high */
-			default-state = "off";
 		};
 
 		led1 { /* green */
diff --git a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
index d01f64b..f44236a6 100644
--- a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
@@ -45,13 +45,11 @@
 		cel-pwr {
 			label = "UC8410A:CEL-PWR";
 			gpios = <&gpio3 27 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		cel-reset {
 			label = "UC8410A:CEL-RESET";
 			gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		str-led {
@@ -69,61 +67,51 @@
 		beeper {
 			label = "UC8410A:BEEP";
 			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		prog-led0 {
 			label = "UC8410A:GREEN:PROG2";
 			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		prog-led1 {
 			label = "UC8410A:GREEN:PROG1";
 			gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		prog-led2 {
 			label = "UC8410A:GREEN:PROG0";
 			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		wifi-signal0 {
 			label = "UC8410A:GREEN:CEL2";
 			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		wifi-signal1 {
 			label = "UC8410A:GREEN:CEL1";
 			gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		wifi-signal2 {
 			label = "UC8410A:GREEN:CEL0";
 			gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		cpu-diag-red {
 			label = "UC8410A:RED:DIA";
 			gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		cpu-diag-green {
 			label = "UC8410A:GREEN:DIA";
 			gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		cpu-diag-yellow {
 			label = "UC8410A:YELLOW:DIA";
 			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 58669ab..604006b 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -71,7 +71,6 @@
 			label = "c1:blue:alive";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/mps2.dtsi b/arch/arm/boot/dts/mps2.dtsi
index 2346739..99656ee 100644
--- a/arch/arm/boot/dts/mps2.dtsi
+++ b/arch/arm/boot/dts/mps2.dtsi
@@ -229,7 +229,6 @@
 				mask = <0x02>;
 				label = "userled:1";
 				linux,default-trigger = "usr";
-				default-state = "off";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 2b760f9..5d91127 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -92,19 +92,16 @@
 		blue {
 			label = "bpi-r2:pio:blue";
 			gpios = <&pio 240 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		green {
 			label = "bpi-r2:pio:green";
 			gpios = <&pio 241 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		red {
 			label = "bpi-r2:pio:red";
 			gpios = <&pio 239 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
@@ -243,19 +240,16 @@
 	led at 0 {
 		reg = <0>;
 		label = "bpi-r2:isink:green";
-		default-state = "off";
 	};
 
 	led at 1 {
 		reg = <1>;
 		label = "bpi-r2:isink:red";
-		default-state = "off";
 	};
 
 	led at 2 {
 		reg = <2>;
 		label = "bpi-r2:isink:blue";
-		default-state = "off";
 	};
 };
 
diff --git a/arch/arm/boot/dts/omap3-igep0020-common.dtsi b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
index ecbec23..966b449 100644
--- a/arch/arm/boot/dts/omap3-igep0020-common.dtsi
+++ b/arch/arm/boot/dts/omap3-igep0020-common.dtsi
@@ -28,13 +28,11 @@
 		user0 {
 			 label = "omap3:red:user0";
 			 gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
-			 default-state = "off";
 		};
 
 		user1 {
 			 label = "omap3:red:user1";
 			 gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-			 default-state = "off";
 		};
 
 		user2 {
diff --git a/arch/arm/boot/dts/omap3-igep0030-common.dtsi b/arch/arm/boot/dts/omap3-igep0030-common.dtsi
index 443f717..92dd3ee 100644
--- a/arch/arm/boot/dts/omap3-igep0030-common.dtsi
+++ b/arch/arm/boot/dts/omap3-igep0030-common.dtsi
@@ -18,19 +18,16 @@
 		user0 {
 			 label = "omap3:red:user0";
 			 gpios = <&twl_gpio 18 GPIO_ACTIVE_LOW>;	/* LEDA */
-			 default-state = "off";
 		};
 
 		user1 {
 			 label = "omap3:green:user1";
 			 gpios = <&twl_gpio 19 GPIO_ACTIVE_LOW>;	/* LEDB */
-			 default-state = "off";
 		};
 
 		user2 {
 			 label = "omap3:red:user1";
 			 gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;		/* gpio_16 */
-			 default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap3-pandora-common.dtsi b/arch/arm/boot/dts/omap3-pandora-common.dtsi
index 90c98f9..9586bae 100644
--- a/arch/arm/boot/dts/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/omap3-pandora-common.dtsi
@@ -56,28 +56,24 @@
 			label = "pandora::sd1";
 			gpios = <&gpio5 0 GPIO_ACTIVE_HIGH>;	/* GPIO_128 */
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led2 {
 			label = "pandora::sd2";
 			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;	/* GPIO_129 */
 			linux,default-trigger = "mmc1";
-			default-state = "off";
 		};
 
 		led3 {
 			label = "pandora::bluetooth";
 			gpios = <&gpio5 30 GPIO_ACTIVE_HIGH>;	/* GPIO_158 */
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led4 {
 			label = "pandora::wifi";
 			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;	/* GPIO_159 */
 			linux,default-trigger = "mmc2";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap5-cm-t54.dts b/arch/arm/boot/dts/omap5-cm-t54.dts
index 5e21fb4..7b5e684 100644
--- a/arch/arm/boot/dts/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/omap5-cm-t54.dts
@@ -79,7 +79,6 @@
 			label = "Heartbeat";
 			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>; /* gpio3_80 ACT_LED */
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/omap5-igep0050.dts b/arch/arm/boot/dts/omap5-igep0050.dts
index fef2a44..b80eeb2 100644
--- a/arch/arm/boot/dts/omap5-igep0050.dts
+++ b/arch/arm/boot/dts/omap5-igep0050.dts
@@ -40,17 +40,14 @@
 		led at 1 {
 			label = "board:green:usr0";
 			gpios = <&tca6416 1 0>;
-			default-state = "off";
 		};
 		led at 2 {
 			label = "board:red:usr1";
 			gpios = <&tca6416 2 0>;
-			default-state = "off";
 		};
 		led at 3 {
 			label = "board:blue:usr1";
 			gpios = <&tca6416 3 0>;
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/omap5-uevm.dts b/arch/arm/boot/dts/omap5-uevm.dts
index 592e17f..45b4e87 100644
--- a/arch/arm/boot/dts/omap5-uevm.dts
+++ b/arch/arm/boot/dts/omap5-uevm.dts
@@ -28,7 +28,6 @@
 			label = "omap5:blue:usr1";
 			gpios = <&gpio5 25 GPIO_ACTIVE_HIGH>; /* gpio5_153 D1 LED */
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
@@ -58,56 +57,48 @@
 			label = "omap5:red:led";
 			gpios = <&gpio9 17 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		led2 {
 			label = "omap5:green:led";
 			gpios = <&gpio9 18 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc1";
-			default-state = "off";
 		};
 
 		led3 {
 			label = "omap5:blue:led";
 			gpios = <&gpio9 19 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc2";
-			default-state = "off";
 		};
 
 		led4 {
 			label = "omap5:green:led1";
 			gpios = <&gpio9 2 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led5 {
 			label = "omap5:green:led2";
 			gpios = <&gpio9 3 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "default-on";
-			default-state = "off";
 		};
 
 		led6 {
 			label = "omap5:green:led3";
 			gpios = <&gpio9 4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		led7 {
 			label = "omap5:green:led4";
 			gpios = <&gpio9 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "default-on";
-			default-state = "off";
 		};
 
 		led8 {
 			label = "omap5:green:led5";
 			gpios = <&gpio9 6 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 497bb06..773e37b 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -431,14 +431,12 @@
 					compatible = "qcom,pm8058-keypad-led";
 					reg = <0x48>;
 					label = "pm8058:infrared:proximitysensor";
-					default-state = "off";
 					linux,default-trigger = "cm3605";
 				};
 				led at 131 {
 					compatible = "qcom,pm8058-led";
 					reg = <0x131>;
 					label = "pm8058:red";
-					default-state = "off";
 				};
 				led at 132 {
 					/*
@@ -448,7 +446,6 @@
 					compatible = "qcom,pm8058-led";
 					reg = <0x132>;
 					label = "pm8058:yellow";
-					default-state = "off";
 					linux,default-trigger = "mmc0";
 				};
 				led at 133 {
diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
index 76b56ea..9c6aa57 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
@@ -264,40 +264,34 @@
 				label = "user0-led";
 				gpios = <&tlmm_pinmux 3 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "heartbeat";
-				default-state = "off";
 			};
 
 			user-led1 {
 				label = "user1-led";
 				gpios = <&tlmm_pinmux 7 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "mmc0";
-				default-state = "off";
 			};
 
 			user-led2 {
 				label = "user2-led";
 				gpios = <&tlmm_pinmux 10 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "mmc1";
-				default-state = "off";
 			};
 
 			user-led3 {
 				label = "user3-led";
 				gpios = <&tlmm_pinmux 11 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "none";
-				default-state = "off";
 			};
 
 			wifi-led {
 				label = "WiFi-led";
 				gpios = <&pm8921_mpps 7 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
 			};
 
 			bt-led {
 				label = "BT-led";
 				gpios = <&pm8921_mpps 8 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
 			};
 		};
 
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index e239a04..6774de4 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -95,32 +95,27 @@
 				label = "led_usb1";
 				gpios = <&qcom_pinmux 7 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "usbdev";
-				default-state = "off";
 			};
 
 			led at 8 {
 				label = "led_usb3";
 				gpios = <&qcom_pinmux 8 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "usbdev";
-				default-state = "off";
 			};
 
 			led at 9 {
 				label = "status_led_fail";
 				gpios = <&qcom_pinmux 9 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
 			};
 
 			led at 26 {
 				label = "sata_led";
 				gpios = <&qcom_pinmux 26 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
 			};
 
 			led at 53 {
 				label = "status_led_pass";
 				gpios = <&qcom_pinmux 53 GPIO_ACTIVE_HIGH>;
-				default-state = "off";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index b6a8a82..59a5bd5 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -25,7 +25,6 @@
 		blue {
 			label = "mk808:blue:power";
 			gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			linux,default-trigger = "default-on";
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index 4a28906..f60db41 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -36,19 +36,16 @@
 		green {
 			label = "rock:green:user1";
 			gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		blue {
 			label = "rock:blue:user2";
 			gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		sleep {
 			label = "rock:red:power";
 			gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-nomadik-s8815.dts b/arch/arm/boot/dts/ste-nomadik-s8815.dts
index 4445446..9e1edf2 100644
--- a/arch/arm/boot/dts/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/ste-nomadik-s8815.dts
@@ -150,7 +150,6 @@
 		user-led {
 			label = "user_led";
 			gpios = <&gpio0 2 0x1>;
-			default-state = "off";
 			linux,default-trigger = "heartbeat";
 			pinctrl-names = "default";
 			pinctrl-0 = <&user_led_default_mode>;
diff --git a/arch/arm/boot/dts/stih410-b2260.dts b/arch/arm/boot/dts/stih410-b2260.dts
index 4ee6d51..1cf7c80 100644
--- a/arch/arm/boot/dts/stih410-b2260.dts
+++ b/arch/arm/boot/dts/stih410-b2260.dts
@@ -35,25 +35,21 @@
 			label = "User_green_1";
 			gpios = <&pio1 3 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		user_green_2 {
 			label = "User_green_2";
 			gpios = <&pio4 1 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		user_green_3 {
 			label = "User_green_3";
 			gpios = <&pio2 1 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		user_green_4 {
 			label = "User_green_4";
 			gpios = <&pio2 5 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/stih418-b2199.dts b/arch/arm/boot/dts/stih418-b2199.dts
index cd0d719..bfd9985 100644
--- a/arch/arm/boot/dts/stih418-b2199.dts
+++ b/arch/arm/boot/dts/stih418-b2199.dts
@@ -37,7 +37,6 @@
 		};
 		green {
 			gpios = <&pio1 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 97e05f5..b1453b3 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -19,7 +19,6 @@
 		};
 		green {
 			gpios = <&pio1 3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index 6f4f60b..a02e16a 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -85,7 +85,6 @@
 			mask = <0x02>;
 			label = "versatile:1";
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 		led at 08.2 {
 			compatible = "register-bit-led";
@@ -93,42 +92,36 @@
 			mask = <0x04>;
 			label = "versatile:2";
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 		led at 08.3 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x08>;
 			label = "versatile:3";
-			default-state = "off";
 		};
 		led at 08.4 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x10>;
 			label = "versatile:4";
-			default-state = "off";
 		};
 		led at 08.5 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x20>;
 			label = "versatile:5";
-			default-state = "off";
 		};
 		led at 08.6 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x40>;
 			label = "versatile:6";
-			default-state = "off";
 		};
 		led at 08.7 {
 			compatible = "register-bit-led";
 			offset = <0x08>;
 			mask = <0x80>;
 			label = "versatile:7";
-			default-state = "off";
 		};
 
 		/* OSC1 on AB, OSC4 on PB */
diff --git a/arch/arm/boot/dts/vf610-zii-cfu1.dts b/arch/arm/boot/dts/vf610-zii-cfu1.dts
index b76c3d04..2ec25b6 100644
--- a/arch/arm/boot/dts/vf610-zii-cfu1.dts
+++ b/arch/arm/boot/dts/vf610-zii-cfu1.dts
@@ -34,28 +34,24 @@
 		led-fail {
 			label = "zii:red:fail";
 			gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			max-brightness = <1>;
 		};
 
 		led-status {
 			label = "zii:green:status";
 			gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			max-brightness = <1>;
 		};
 
 		led-debug-a {
 			label = "zii:green:debug_a";
 			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			max-brightness = <1>;
 		};
 
 		led-debug-b {
 			label = "zii:green:debug_b";
 			gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			max-brightness = <1>;
 		};
 	};
diff --git a/arch/arm/boot/dts/zynq-zturn.dts b/arch/arm/boot/dts/zynq-zturn.dts
index b387046..2219c3c 100644
--- a/arch/arm/boot/dts/zynq-zturn.dts
+++ b/arch/arm/boot/dts/zynq-zturn.dts
@@ -37,13 +37,11 @@
 		usr-led1 {
 			label = "usr-led1";
 			gpios = <&gpio0 0x0 0x1>;
-			default-state = "off";
 		};
 
 		usr-led2 {
 			label = "usr-led2";
 			gpios = <&gpio0 0x9 0x1>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 4cf7f6e..af09d8d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -35,7 +35,6 @@
 			label = "a95x:system-status";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 54954b3..e9f6c96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -46,7 +46,6 @@
 			label = "c2:blue:alive";
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index 0038522..5e90e4d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -17,13 +17,11 @@
 		wifi {
 			label = "wetek-play:wifi-status";
 			gpios = <&gpio GPIODV_26 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		ethernet {
 			label = "wetek-play:ethernet-status";
 			gpios = <&gpio GPIODV_27 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 7212dc4..490f9ca 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -45,7 +45,6 @@
 		red {
 			label = "rbox-pro:red:standby";
 			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 			retain-state-suspended;
 			panic-indicator;
 		};
diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 1792b07..cf3001d 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -166,7 +166,6 @@
 						mask = <0x02>;
 						label = "vexpress:1";
 						linux,default-trigger = "mmc0";
-						default-state = "off";
 					};
 					led2 {
 						compatible = "register-bit-led";
@@ -174,7 +173,6 @@
 						mask = <0x04>;
 						label = "vexpress:2";
 						linux,default-trigger = "cpu0";
-						default-state = "off";
 					};
 					led3 {
 						compatible = "register-bit-led";
@@ -182,7 +180,6 @@
 						mask = <0x08>;
 						label = "vexpress:3";
 						linux,default-trigger = "cpu1";
-						default-state = "off";
 					};
 					led4 {
 						compatible = "register-bit-led";
@@ -190,7 +187,6 @@
 						mask = <0x10>;
 						label = "vexpress:4";
 						linux,default-trigger = "cpu2";
-						default-state = "off";
 					};
 					led5 {
 						compatible = "register-bit-led";
@@ -198,21 +194,18 @@
 						mask = <0x20>;
 						label = "vexpress:5";
 						linux,default-trigger = "cpu3";
-						default-state = "off";
 					};
 					led6 {
 						compatible = "register-bit-led";
 						offset = <0x08>;
 						mask = <0x40>;
 						label = "vexpress:6";
-						default-state = "off";
 					};
 					led7 {
 						compatible = "register-bit-led";
 						offset = <0x08>;
 						mask = <0x80>;
 						label = "vexpress:7";
-						default-state = "off";
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index c98bcbc..fdd2975 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -102,7 +102,6 @@
 			label = "user_led3";
 			/* gpio_189_user_led3 */
 			gpios = <&gpio23 5 0>;
-			default-state = "off";
 		};
 
 		user_led4 {
@@ -118,7 +117,6 @@
 			/* gpio_205_wifi_active */
 			gpios = <&gpio25 5 0>;
 			linux,default-trigger = "phy0tx";
-			default-state = "off";
 		};
 
 		bt_active_led {
@@ -126,7 +124,6 @@
 			gpios = <&gpio25 7 0>;
 			/* gpio_207_user_led1 */
 			linux,default-trigger = "hci0-power";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
index d30f6eb..ff701b1 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
@@ -38,28 +38,24 @@
 			label = "USER-LED0";
 			gpios = <&gpio6 3 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
-			default-state = "off";
 		};
 
 		user-led1 {
 			label = "USER-LED1";
 			gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "mmc0";
-			default-state = "off";
 		};
 
 		user-led2 {
 			label = "USER-LED2";
 			gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "none";
-			default-state = "off";
 		};
 
 		user-led3 {
 			label = "USER-LED3";
 			gpios = <&gpio10 6 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "cpu0";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index f4964be..46b83d3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -369,14 +369,12 @@
 			label = "wifi_active";
 			gpios = <&gpio3 5 0>; /* <&gpio_wlan_active_led>; */
 			linux,default-trigger = "phy0tx";
-			default-state = "off";
 		};
 
 		bt_active_led {
 			label = "bt_active";
 			gpios = <&gpio4 7 0>; /* <&gpio_bt_active_led>; */
 			linux,default-trigger = "hci0rx";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 710c5c3..00d0c03 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -59,13 +59,11 @@
 		green {
 			label = "bpi-r64:pio:green";
 			gpios = <&pio 89 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		red {
 			label = "bpi-r64:pio:red";
 			gpios = <&pio 88 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 46feedf..48b56b5 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -303,21 +303,18 @@
 				label = "apq8016-sbc:green:user1";
 				gpios = <&msmgpio 21 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "heartbeat";
-				default-state = "off";
 			};
 
 			led at 2 {
 				label = "apq8016-sbc:green:user2";
 				gpios = <&msmgpio 120 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "mmc0";
-				default-state = "off";
 			};
 
 			led at 3 {
 				label = "apq8016-sbc:green:user3";
 				gpios = <&pm8916_gpios 1 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "mmc1";
-				default-state = "off";
 			};
 
 			led at 4 {
@@ -325,21 +322,18 @@
 				gpios = <&pm8916_gpios 2 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "none";
 				panic-indicator;
-				default-state = "off";
 			};
 
 			led at 5 {
 				label = "apq8016-sbc:yellow:wlan";
 				gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "phy0tx";
-				default-state = "off";
 			};
 
 			led at 6 {
 				label = "apq8016-sbc:blue:bt";
 				gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
 				linux,default-trigger = "bluetooth-power";
-				default-state = "off";
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
index 6b9b1ac..8df6283 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -59,7 +59,6 @@
 		red {
 			gpios = <&gpio2 RK_PA3 GPIO_ACTIVE_HIGH>;
 			label = "geekbox:red:led";
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
index 1315972..450d877 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
@@ -90,7 +90,6 @@
 		module_led2 {
 			label = "module_led2";
 			gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
index 96147d9..b101515 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
@@ -63,7 +63,6 @@
 			label = "orion:blue:led";
 			pinctrl-names = "default";
 			pinctrl-0 = <&stby_pwren>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index c706db0..dcb871d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -101,7 +101,6 @@
 
 		diy-led {
 			label = "diy";
-			default-state = "off";
 			gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index 1d35f54..5614ae0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -62,7 +62,6 @@
 
 		diy-led {
 			label = "diy";
-			default-state = "off";
 			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
index eb5e8bd..69ef7e2 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
@@ -66,14 +66,12 @@
 			label = "ds3";
 			gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "phy0tx"; /* WLAN tx */
-			default-state = "off";
 		};
 
 		ds4 {
 			label = "ds4";
 			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "phy0rx"; /* WLAN rx */
-			default-state = "off";
 		};
 
 		ds5 {
diff --git a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
index e7af2cf..d53ccc3 100644
--- a/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dpt_module.dts
@@ -25,7 +25,6 @@
 		system {
 			label = "dpt-module:green:system";
 			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
index d38aa73..a2ae8bc 100644
--- a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
@@ -25,25 +25,21 @@
 		wlan {
 			label = "dragino2:red:wlan";
 			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		lan {
 			label = "dragino2:red:lan";
 			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		wan {
 			label = "dragino2:red:wan";
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		system {
 			label = "dragino2:red:system";
 			gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/mips/boot/dts/qca/ar9331_omega.dts b/arch/mips/boot/dts/qca/ar9331_omega.dts
index 11778ab..6a4e815 100644
--- a/arch/mips/boot/dts/qca/ar9331_omega.dts
+++ b/arch/mips/boot/dts/qca/ar9331_omega.dts
@@ -25,7 +25,6 @@
 		system {
 			label = "onion:amber:system";
 			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
diff --git a/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts b/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
index c8290d3..0ea58bc 100644
--- a/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
+++ b/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
@@ -25,25 +25,21 @@
 		wlan {
 			label = "tp-link:green:wlan";
 			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
 		};
 
 		lan {
 			label = "tp-link:green:lan";
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		wps {
 			label = "tp-link:green:wps";
 			gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 
 		led3g {
 			label = "tp-link:green:3g";
 			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 		};
 	};
 
-- 
1.9.1
