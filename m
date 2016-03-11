From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Mar 2016 14:57:21 +0530
Subject: [PATCH 2/2] ARC: [*defconfig] No need to specify CONFIG_CROSS_COMPILE
In-Reply-To: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
References: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457688441-31337-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The problem is with CONFIG_CPU_BIG_ENDIAN=y we still needed .config
fixup to override the the defconfig prefix to arceb-linux-

So remove these from defconfig and let user pass this via CROSS_COMPILE
environment var or use the default for ENDIAN (per previous patch)

No other arch carries them in defconfigs anyways !

Cc: Noam Camus <noamc at ezchip.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Anton Kolesov <akolesov at synosys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/configs/axs101_defconfig          | 1 -
 arch/arc/configs/axs103_defconfig          | 1 -
 arch/arc/configs/axs103_smp_defconfig      | 1 -
 arch/arc/configs/nsim_700_defconfig        | 1 -
 arch/arc/configs/nsim_hs_defconfig         | 1 -
 arch/arc/configs/nsim_hs_smp_defconfig     | 1 -
 arch/arc/configs/nsimosci_defconfig        | 1 -
 arch/arc/configs/nsimosci_hs_defconfig     | 1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig | 1 -
 arch/arc/configs/tb10x_defconfig           | 1 -
 arch/arc/configs/vdk_hs38_defconfig        | 1 -
 arch/arc/configs/vdk_hs38_smp_defconfig    | 1 -
 12 files changed, 12 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 5d4e2a07ad3e..6cdffea3a914 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 87ee46b237ef..f8b396c9aedb 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index d80daf4f7e73..56128ea2b748 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index f41095340b6a..7314f538847b 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
diff --git a/arch/arc/configs/nsim_hs_defconfig b/arch/arc/configs/nsim_hs_defconfig
index cfaa33cb5921..a99dc7a3f0af 100644
--- a/arch/arc/configs/nsim_hs_defconfig
+++ b/arch/arc/configs/nsim_hs_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
diff --git a/arch/arc/configs/nsim_hs_smp_defconfig b/arch/arc/configs/nsim_hs_smp_defconfig
index bb2a8dc778b5..59f221fc9a41 100644
--- a/arch/arc/configs/nsim_hs_smp_defconfig
+++ b/arch/arc/configs/nsim_hs_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index 646182e93753..0972e753101a 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index ceca2541950d..24d9d0e18232 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 4b6da90f6f26..6746d01b6d7b 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 9b342eaf95ae..4c5118384eb5 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="tb10x"
 CONFIG_SYSVIPC=y
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index a07f20de221b..c0d6a010751a 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_CROSS_MEMORY_ATTACH is not set
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 735985974a31..52ec315dc5c9 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -1,4 +1,3 @@
-CONFIG_CROSS_COMPILE="arc-linux-"
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_DEFAULT_HOSTNAME="ARCLinux"
 # CONFIG_CROSS_MEMORY_ATTACH is not set
-- 
2.5.0
