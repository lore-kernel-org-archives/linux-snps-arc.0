From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu,  2 Aug 2018 11:41:07 +0300
Subject: [PATCH] ARC: Remove CONFIG_DEFAULT_HOSTNAME from defconfigs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180802084107.14616-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There's no reason to set the same hostname to all ARC boards
by default. It usually gets overwritten by init scripts anyways.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/axs101_defconfig          | 1 -
 arch/arc/configs/axs103_defconfig          | 1 -
 arch/arc/configs/axs103_smp_defconfig      | 1 -
 arch/arc/configs/haps_hs_defconfig         | 1 -
 arch/arc/configs/haps_hs_smp_defconfig     | 1 -
 arch/arc/configs/hsdk_defconfig            | 1 -
 arch/arc/configs/nsim_700_defconfig        | 1 -
 arch/arc/configs/nsim_hs_defconfig         | 1 -
 arch/arc/configs/nsim_hs_smp_defconfig     | 1 -
 arch/arc/configs/nsimosci_defconfig        | 1 -
 arch/arc/configs/nsimosci_hs_defconfig     | 1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig | 1 -
 arch/arc/configs/vdk_hs38_defconfig        | 1 -
 arch/arc/configs/vdk_hs38_smp_defconfig    | 1 -
 14 files changed, 14 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 55686cc4bb19..3dbb2b3f60af 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 20fb8e4e7337..4d7b85d4b2dc 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 51d1e866ce94..92417e2e39f3 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
index ab231c040efe..4984d9ed1573 100644
--- a/arch/arc/configs/haps_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
index cf449cbf440d..1e93690b4a4f 100644
--- a/arch/arc/configs/haps_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index ba101d12515f..200d4ee436bc 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_NO_HZ_IDLE=y
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 31c2c70b34a1..0b59778604e4 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
index a578c721d50f..e829b683887d 100644
--- a/arch/arc/configs/nsim_hs_defconfig
+++ b/arch/arc/configs/nsim_hs_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
index 37d7395f3272..bef937c551f8 100644
--- a/arch/arc/configs/nsim_hs_smp_defconfig
+++ b/arch/arc/configs/nsim_hs_smp_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 1e1470e2a7f0..ac601e33bb47 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index 084a6e42685b..fef290c65e4c 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index f36d47990415..c0d19623aa82 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index f629493929ea..4a459de56679 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 21f0ca26a05d..a8ac5e917d9a 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
-- 
2.17.1
