From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 22 Nov 2016 14:16:36 +0300
Subject: [PATCH] ARC: axs10x: really enable ARC PGU
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479813396-16592-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Up until now we had ARC PGU not enabled in axs10x defconfigs trying
to not bloat kernel image again with yet another drivers and subsystems.

This change configures ARC PGU (as well as DRM bits it depends on)
to be built as a module and so those who need LCD screen to work on
axs10x may bundle built .ko files in their target's file-system with
help of the following command on host:
------------->8-------------
make INSTALL_MOD_PATH=_path_to_target_fs_ modules_install
------------->8-------------

and later on target with commands as simple as:
------------->8-------------
modprobe adv7511.ko
modprobe arcpgu.ko
------------->8-------------
get LCD working.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/boot/dts/axs101.dts          | 2 +-
 arch/arc/boot/dts/axs103_idu.dts      | 2 +-
 arch/arc/configs/axs101_defconfig     | 4 +++-
 arch/arc/configs/axs103_smp_defconfig | 4 +++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arc/boot/dts/axs101.dts b/arch/arc/boot/dts/axs101.dts
index d9b9b9dcfc4c..70aec7d6ca60 100644
--- a/arch/arc/boot/dts/axs101.dts
+++ b/arch/arc/boot/dts/axs101.dts
@@ -17,6 +17,6 @@
 	compatible = "snps,axs101", "snps,arc-sdp";
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0";
+		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 video=1280x720 at 60";
 	};
 };
diff --git a/arch/arc/boot/dts/axs103_idu.dts b/arch/arc/boot/dts/axs103_idu.dts
index 070c29782216..5c843d9b4ac8 100644
--- a/arch/arc/boot/dts/axs103_idu.dts
+++ b/arch/arc/boot/dts/axs103_idu.dts
@@ -20,6 +20,6 @@
 	compatible = "snps,axs103", "snps,arc-sdp";
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=ttyS3,115200n8 debug print-fatal-signals=1";
+		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 print-fatal-signals=1 consoleblank=0 video=1280x720 at 60";
 	};
 };
diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 0a0eaf09aac7..6980b966a364 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -75,9 +75,11 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
+CONFIG_DRM=m
+CONFIG_DRM_I2C_ADV7511=m
+CONFIG_DRM_ARCPGU=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 110874705085..30a3d4cf53d2 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -77,9 +77,11 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
+CONFIG_DRM=m
+CONFIG_DRM_I2C_ADV7511=m
+CONFIG_DRM_ARCPGU=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-- 
2.7.4
