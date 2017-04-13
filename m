From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 13 Apr 2017 15:33:34 +0300
Subject: [PATCH] usb: Make sure usb/phy/of gets built-in
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492086814-21006-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DWC3 driver uses of_usb_get_phy_mode() which is
implemented in drivers/usb/phy/of.c and in bare minimal
configuration it might not be pulled in kernel binary.

In case of ARC or ARM this could be easily reproduced with
"allnodefconfig" +CONFIG_USB=m +CONFIG_USB_DWC3=m.

On building all ends-up with:
---------------------->8------------------
  Kernel: arch/arm/boot/Image is ready
  Kernel: arch/arm/boot/zImage is ready
  Building modules, stage 2.
  MODPOST 5 modules
ERROR: "of_usb_get_phy_mode" [drivers/usb/dwc3/dwc3.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2
---------------------->8------------------

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
Cc: Geert Uytterhoeven <geert+renesas at glider.be>
Cc: Nicolas Pitre <nicolas.pitre at linaro.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Felipe Balbi <balbi at kernel.org>
Cc: Felix Fietkau <nbd at nbd.name>
Cc: Jeremy Kerr <jk at ozlabs.org>
Cc: linux-snps-arc at lists.infradead.org
Cc: stable at vger.kernel.org
---
 drivers/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/Makefile b/drivers/Makefile
index 2eced9afba53..8f8bdc9e3d29 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_USB_PHY)		+= usb/
 obj-$(CONFIG_USB)		+= usb/
 obj-$(CONFIG_PCI)		+= usb/
 obj-$(CONFIG_USB_GADGET)	+= usb/
+obj-$(CONFIG_OF)		+= usb/
 obj-$(CONFIG_SERIO)		+= input/serio/
 obj-$(CONFIG_GAMEPORT)		+= input/gameport/
 obj-$(CONFIG_INPUT)		+= input/
-- 
2.7.4
