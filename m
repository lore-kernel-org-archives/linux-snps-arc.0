From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Thu, 18 May 2017 12:46:47 +0200
Subject: [PATCH 4.10 18/93] usb: Make sure usb/phy/of gets built-in
In-Reply-To: <20170518104743.163522815@linuxfoundation.org>
References: <20170518104743.163522815@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170518104743.879520336@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

4.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

commit 3d6159640da9c9175d1ca42f151fc1a14caded59 upstream.

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
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 drivers/Makefile |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_USB_PHY)		+= usb/
 obj-$(CONFIG_USB)		+= usb/
 obj-$(CONFIG_PCI)		+= usb/
 obj-$(CONFIG_USB_GADGET)	+= usb/
+obj-$(CONFIG_OF)		+= usb/
 obj-$(CONFIG_SERIO)		+= input/serio/
 obj-$(CONFIG_GAMEPORT)		+= input/gameport/
 obj-$(CONFIG_INPUT)		+= input/
