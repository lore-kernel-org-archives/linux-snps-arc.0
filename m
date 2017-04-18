From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 18 Apr 2017 12:23:20 +0000
Subject: [PATCH] usb: Make sure usb/phy/of gets built-in
In-Reply-To: <58F584C9.3050607@gmail.com>
References: <1492086814-21006-1-git-send-email-abrodkin@synopsys.com>
 <58F584C9.3050607@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1492518199.7548.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello Frank,

On Mon, 2017-04-17@20:15 -0700, Frank Rowand wrote:
> On 04/13/17 05:33, Alexey Brodkin wrote:
> > 
> > DWC3 driver uses of_usb_get_phy_mode() which is
> > implemented in drivers/usb/phy/of.c and in bare minimal
> > configuration it might not be pulled in kernel binary.
> > 
> > In case of ARC or ARM this could be easily reproduced with
> > "allnodefconfig" +CONFIG_USB=m +CONFIG_USB_DWC3=m.
> > 
> > On building all ends-up with:
> > ---------------------->8------------------
> > ? Kernel: arch/arm/boot/Image is ready
> > ? Kernel: arch/arm/boot/zImage is ready
> > ? Building modules, stage 2.
> > ? MODPOST 5 modules
> > ERROR: "of_usb_get_phy_mode" [drivers/usb/dwc3/dwc3.ko] undefined!
> > make[1]: *** [__modpost] Error 1
> > make: *** [modules] Error 2
> > ---------------------->8------------------
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> > Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
> > Cc: Geert Uytterhoeven <geert+renesas at glider.be>
> > Cc: Nicolas Pitre <nicolas.pitre at linaro.org>
> > Cc: Thomas Gleixner <tglx at linutronix.de>
> > Cc: Felipe Balbi <balbi at kernel.org>
> > Cc: Felix Fietkau <nbd at nbd.name>
> > Cc: Jeremy Kerr <jk at ozlabs.org>
> > Cc: linux-snps-arc at lists.infradead.org
> > Cc: stable at vger.kernel.org
> > ---
> > ?drivers/Makefile | 1 +
> > ?1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/Makefile b/drivers/Makefile
> > index 2eced9afba53..8f8bdc9e3d29 100644
> > --- a/drivers/Makefile
> > +++ b/drivers/Makefile
> > @@ -104,6 +104,7 @@ obj-$(CONFIG_USB_PHY)		+= usb/
> > ?obj-$(CONFIG_USB)		+= usb/
> > ?obj-$(CONFIG_PCI)		+= usb/
> > ?obj-$(CONFIG_USB_GADGET)	+= usb/
> 
> > 
> > +obj-$(CONFIG_OF)		+= usb/
> 
> Would CONFIG_USB_SUPPORT make more sense? (And does it work?)

Well I'm not really sure here.

The problem was in missing "drivers/usb/phy/of.o" in "drivers/usb/built-in.o".
So I took a look at how components get enabled and saw quite mixed stuff.

In "drivers/usb/phy/Makefile" we see:
------------------------->8---------------------------
obj-$(CONFIG_OF)????????????????????????+= of.o
------------------------->8---------------------------

In "drivers/usb/Makefile" we see:
------------------------->8---------------------------
obj-$(CONFIG_USB_SUPPORT)???????+= phy/
------------------------->8---------------------------
