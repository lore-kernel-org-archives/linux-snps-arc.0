From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 10 Dec 2018 11:33:49 +0300
Subject: [PATCH] ARC: [zebu] Remove CONFIG_INITRAMFS_SOURCE from defconfigs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181210083349.35728-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Zebu boards were added in v4.9 and then renamed to "haps" in v4.10.

Thus backporting
commit 64234961c145 (ARC: configs: Remove CONFIG_INITRAMFS_SOURCE from defconfigs)
we missed "zebu" defconfigs in v4.9.

Note this is only applicable to "linux-4.9.y"!

Spotted by KerneCI, see [1].

[1] https://storage.kernelci.org/stable/linux-4.9.y/v4.9.144/arc/zebu_hs_smp_defconfig/build.log

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: Kevin Hilman <khilman at baylibre.com>
---
 arch/arc/configs/zebu_hs_defconfig     | 1 -
 arch/arc/configs/zebu_hs_smp_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arc/configs/zebu_hs_defconfig b/arch/arc/configs/zebu_hs_defconfig
index 9f6166be7145..3346829b02bb 100644
--- a/arch/arc/configs/zebu_hs_defconfig
+++ b/arch/arc/configs/zebu_hs_defconfig
@@ -11,7 +11,6 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/arc/configs/zebu_hs_smp_defconfig b/arch/arc/configs/zebu_hs_smp_defconfig
index 44e9693f4257..4471f9c37d7e 100644
--- a/arch/arc/configs/zebu_hs_smp_defconfig
+++ b/arch/arc/configs/zebu_hs_smp_defconfig
@@ -11,7 +11,6 @@ CONFIG_NAMESPACES=y
 # CONFIG_UTS_NS is not set
 # CONFIG_PID_NS is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="../../arc_initramfs_hs/"
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-- 
2.16.2
