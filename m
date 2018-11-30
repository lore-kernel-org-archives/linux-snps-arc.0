From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 30 Nov 2018 15:51:56 +0300
Subject: [PATCH v2] ARC: change defconfig defaults to ARCv2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181130125156.34460-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

Change the default defconfig (used with 'make defconfig') to the ARCv2
nsim_hs_defconfig, and also switch the default Kconfig ISA selection to
ARCv2.

This allows several default defconfigs (e.g. make defconfig, make
allnoconfig, make tinyconfig) to all work with ARCv2 by default.

Note since we change default architecture from ARCompact to ARCv2
it's required to explicitly mention architecture type in ARCompact
defconfigs otherwise ARCv2 will be implied and binaries will be
generated for ARCv2.

Signed-off-by: Kevin Hilman <khilman at baylibre.com>
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: <stable at vger.kernel.org> # 4.4.x
---

Changes v1 -> v2:
 * Added CONFIG_ISA_ARCOMPACT to ARCompact defconfigs

 arch/arc/Kconfig                    | 2 +-
 arch/arc/Makefile                   | 2 +-
 arch/arc/configs/axs101_defconfig   | 1 +
 arch/arc/configs/nps_defconfig      | 1 +
 arch/arc/configs/nsim_700_defconfig | 1 +
 arch/arc/configs/nsimosci_defconfig | 1 +
 arch/arc/configs/tb10x_defconfig    | 1 +
 7 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 5fcbda6b37cc..6dd783557330 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -109,7 +109,7 @@ endmenu
 
 choice
 	prompt "ARC Instruction Set"
-	default ISA_ARCOMPACT
+	default ISA_ARCV2
 
 config ISA_ARCOMPACT
 	bool "ARCompact ISA"
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c64c505d966c..df00578c279d 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -6,7 +6,7 @@
 # published by the Free Software Foundation.
 #
 
-KBUILD_DEFCONFIG := nsim_700_defconfig
+KBUILD_DEFCONFIG := nsim_hs_defconfig
 
 cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 8c23bd086cd0..020d4493edfd 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -14,6 +14,7 @@ CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
+CONFIG_ISA_ARCOMPACT=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arc/configs/nps_defconfig b/arch/arc/configs/nps_defconfig
index ae7a0d8be98d..6e84060e7c90 100644
--- a/arch/arc/configs/nps_defconfig
+++ b/arch/arc/configs/nps_defconfig
@@ -15,6 +15,7 @@ CONFIG_SYSCTL_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
+CONFIG_ISA_ARCOMPACT=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index 8e0b8b134cd9..219c2a65294b 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -15,6 +15,7 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
+CONFIG_ISA_ARCOMPACT=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 # CONFIG_LBDAF is not set
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index ad77f20e5aa6..35dfc6491a09 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -15,6 +15,7 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
+CONFIG_ISA_ARCOMPACT=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 # CONFIG_LBDAF is not set
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index a7f65313f84a..e71ade3cf9c8 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -19,6 +19,7 @@ CONFIG_KALLSYMS_ALL=y
 # CONFIG_AIO is not set
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
+CONFIG_ISA_ARCOMPACT=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
-- 
2.16.2
