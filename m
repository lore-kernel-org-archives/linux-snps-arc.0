From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 31 Oct 2016 15:59:11 +0300
Subject: [PATCH v2] ARC: Enable PERF_EVENTS in nSIM driven platforms
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477918751-28058-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Now when we have properly working performance counters in nSIM
even with interrupt support (fix should be a part of upcoming
nSIM engineering build 2016.12-005) we may enable perf support
by default for all platforms that use nSIM for ARC cores simulation.

Note 1: PCT node was missing for some reason in nsimosci.dts
        while all other nSIM-related .dts files already had
        PCT node for quite some time, so adding it now.

Note 2: All defconfigs were regenerated with "make savedefconfig"
        which led to some clean-ups in nsimosci_hs_smp_defconfig:
        CONFIG_FRAMEBUFFER_CONSOLE=y was removed because it is
        automatically selected now by DRM.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

changes v1 -> v2:
 * Added missing PCT Device Tree node in nsimosci.dts

 arch/arc/boot/dts/nsimosci.dts             | 4 ++++
 arch/arc/configs/nsim_700_defconfig        | 1 +
 arch/arc/configs/nsim_hs_defconfig         | 1 +
 arch/arc/configs/nsim_hs_smp_defconfig     | 1 +
 arch/arc/configs/nsimosci_defconfig        | 1 +
 arch/arc/configs/nsimosci_hs_defconfig     | 1 +
 arch/arc/configs/nsimosci_hs_smp_defconfig | 3 +--
 7 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index bcf603142a33..7fe184435956 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -83,5 +83,9 @@
 			reg = <0xf0003000 0x44>;
 			interrupts = <7>;
 		};
+
+		arcpct0: pct {
+			compatible = "snps,archs-pct";
+		};
 	};
 };
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 7314f538847b..b0066a749d4c 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -14,6 +14,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="../arc_initramfs/"
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KPROBES=y
diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
index 65ab9fbf83f2..ebe9ebb92933 100644
--- a/arch/arc/configs/nsim_hs_defconfig
+++ b/arch/arc/configs/nsim_hs_defconfig
@@ -14,6 +14,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KPROBES=y
diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
index 3b3990cddbe1..4bde43278be6 100644
--- a/arch/arc/configs/nsim_hs_smp_defconfig
+++ b/arch/arc/configs/nsim_hs_smp_defconfig
@@ -12,6 +12,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KPROBES=y
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 98cf20933bbb..f6fb3d26557e 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -14,6 +14,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="../arc_initramfs/"
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KPROBES=y
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index ddf8b96d494e..b9f0fe00044b 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -14,6 +14,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
+CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KPROBES=y
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index ceb90745326e..6da71ba253a9 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -10,6 +10,7 @@ CONFIG_IKCONFIG_PROC=y
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="../arc_initramfs_hs/"
+CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
@@ -34,7 +35,6 @@ CONFIG_INET=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
@@ -72,7 +72,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=y
 CONFIG_DRM_ARCPGU=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
-- 
2.7.4
