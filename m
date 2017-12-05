From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  5 Dec 2017 13:19:38 +0300
Subject: [PATCH] ARC: [plat-hsdk] Switch DisplayLink driver from fbdev to DRM
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512469178-6058-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Currently there're 2 different implementations of the driver for
DisplayLink USB2.0-to-HDMI/DVI adapters: older FBDEV and modern true
DRM.

We initially decided to use FBDEV version just because with it
/dev/fbX is usable from user-space while in DRM version
with DRM_FBDEV_EMULATION user-space cannot draw anything on a real
screen, for more info read [1].

But today /dev/fbX is not that important as more and more software
projects switch to use of DRI (/dev/dri/cardX).

But what's even more important DRM driver allows building of complicated
graphics processing chains. The most important for us is rendering of
3D on a dedicated GPU while outputting video through a simpler
bitstreamer like DisplayLink. So let's use much more future-proof
driver from now on.

[1] https://lists.freedesktop.org/archives/dri-devel/2017-December/159519.html

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/hsdk_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 7b8f8faf8a24..ac6b0ed8341e 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -49,10 +49,11 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
+CONFIG_DRM=y
+# CONFIG_DRM_FBDEV_EMULATION is not set
+CONFIG_DRM_UDL=y
 CONFIG_FB=y
-CONFIG_FB_UDL=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.7.5
