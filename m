From: info@metux.net (Enrico Weigelt, metux IT consult)
Date: Mon, 11 Mar 2019 14:57:59 +0100
Subject: [PATCH] arch: arc: Kconfig: pedantic formatting
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1552312679-26388-1-git-send-email-info@metux.net>
To: linux-snps-arc@lists.infradead.org

Formatting of Kconfig files doesn't look so pretty, so let the
Great White Handkerchief come around and clean it up.

Signed-off-by: Enrico Weigelt, metux IT consult <info at metux.net>
---
 arch/arc/Kconfig            | 12 ++++++------
 arch/arc/plat-eznps/Kconfig | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index df55672..1414797 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -144,11 +144,11 @@ config ARC_CPU_770
 	  Support for ARC770 core introduced with Rel 4.10 (Summer 2011)
 	  This core has a bunch of cool new features:
 	  -MMU-v3: Variable Page Sz (4k, 8k, 16k), bigger J-TLB (128x4)
-                   Shared Address Spaces (for sharing TLB entries in MMU)
+	           Shared Address Spaces (for sharing TLB entries in MMU)
 	  -Caches: New Prog Model, Region Flush
 	  -Insns: endian swap, load-locked/store-conditional, time-stamp-ctr
 
-endif	#ISA_ARCOMPACT
+endif #ISA_ARCOMPACT
 
 config ARC_CPU_HS
 	bool "ARC-HS"
@@ -198,7 +198,7 @@ config ARC_SMP_HALT_ON_RESET
 	  at designated entry point. For other case, all jump to common
 	  entry point and spin wait for Master's signal.
 
-endif	#SMP
+endif #SMP
 
 config ARC_MCIP
 	bool "ARConnect Multicore IP (MCIP) Support "
@@ -249,7 +249,7 @@ config ARC_CACHE_VIPT_ALIASING
 	bool "Support VIPT Aliasing D$"
 	depends on ARC_HAS_DCACHE && ISA_ARCOMPACT
 
-endif	#ARC_CACHE
+endif #ARC_CACHE
 
 config ARC_HAS_ICCM
 	bool "Use ICCM"
@@ -370,7 +370,7 @@ config ARC_FPU_SAVE_RESTORE
 	  based on actual usage of FPU by a task. Thus our implemn does
 	  this for all tasks in system.
 
-endif	#ISA_ARCOMPACT
+endif #ISA_ARCOMPACT
 
 config ARC_CANT_LLSC
 	def_bool n
@@ -414,7 +414,7 @@ config ARC_IRQ_NO_AUTOSAVE
 	  This is programmable and can be optionally disabled in which case
 	  software INTERRUPT_PROLOGUE/EPILGUE do the needed work
 
-endif	# ISA_ARCV2
+endif # ISA_ARCV2
 
 endmenu   # "ARC CPU Configuration"
 
diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index 8eff057..2eaecfb 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -26,8 +26,8 @@ config EZNPS_MTM_EXT
 	help
 	  Here we add new hierarchy for CPUs topology.
 	  We got:
-		Core
-		Thread
+	    Core
+	    Thread
 	  At the new thread level each CPU represent one HW thread.
 	  At highest hierarchy each core contain 16 threads,
 	  any of them seem like CPU from Linux point of view.
@@ -35,10 +35,10 @@ config EZNPS_MTM_EXT
 	  core and HW scheduler round robin between them.
 
 config EZNPS_MEM_ERROR_ALIGN
-       bool "ARC-EZchip Memory error as an exception"
-       depends on EZNPS_MTM_EXT
-       default n
-       help
+	bool "ARC-EZchip Memory error as an exception"
+	depends on EZNPS_MTM_EXT
+	default n
+	help
 	  On the real chip of the NPS, user memory errors are handled
 	  as a machine check exception, which is fatal, whereas on
 	  simulator platform for NPS, is handled as a Level 2 interrupt
-- 
1.9.1
