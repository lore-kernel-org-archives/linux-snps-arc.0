From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  8 Sep 2017 23:12:59 +0300
Subject: [PATCH] ARC: Reenable soft lock-up detector
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170908201259.29889-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit 92e5aae45778 "kernel/watchdog: split up config options"
introduced SOFTLOCKUP_DETECTOR which selects LOCKUP_DETECTOR
instead of the latter to be selected itself.

We need to adjust our defconfigs accordingly.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/configs/axs101_defconfig       | 2 +-
 arch/arc/configs/axs103_defconfig       | 2 +-
 arch/arc/configs/axs103_smp_defconfig   | 2 +-
 arch/arc/configs/haps_hs_smp_defconfig  | 2 +-
 arch/arc/configs/hsdk_defconfig         | 2 +-
 arch/arc/configs/vdk_hs38_defconfig     | 2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 6980b966a364..ec7c849a5c8e 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -105,7 +105,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 2233f5777a71..63d3cf69e0b0 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -104,7 +104,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 30a3d4cf53d2..f613ecac14a7 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -107,7 +107,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
index 821a2e562f3f..3507be2af6fe 100644
--- a/arch/arc/configs/haps_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -84,5 +84,5 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 9a3fcf446388..7b8f8faf8a24 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -72,7 +72,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index c0d6a010751a..4fcf4f2503f6 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -94,7 +94,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_SHIRQ=y
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 5c0971787acf..7b71464f6c2f 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -98,7 +98,7 @@ CONFIG_NLS_ISO8859_1=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_SHIRQ=y
-CONFIG_LOCKUP_DETECTOR=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-- 
2.11.0
