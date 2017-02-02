From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 Feb 2017 09:22:48 -0800
Subject: [PATCH resend] ARC: ARC_HAS_COH_CACHES no longer relevant
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486056168-5656-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

A typical SMP system expects cache coherency. Initial NPS platform
support was slated to be SMP w/o cache coherency.

However it seems the platform now selects that option, so there is no
point in keeping it around.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig            | 6 ------
 arch/arc/plat-eznps/Kconfig | 1 -
 arch/arc/plat-sim/Kconfig   | 1 -
 3 files changed, 8 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index ba15cb8f60fb..c9f30f4763ab 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -180,16 +180,12 @@ config CPU_BIG_ENDIAN
 config SMP
 	bool "Symmetric Multi-Processing"
 	default n
-	select ARC_HAS_COH_CACHES if ISA_ARCV2
 	select ARC_MCIP if ISA_ARCV2
 	help
 	  This enables support for systems with more than one CPU.
 
 if SMP
 
-config ARC_HAS_COH_CACHES
-	def_bool n
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
 	range 2 4096
@@ -219,8 +215,6 @@ config ARC_MCIP
 menuconfig ARC_CACHE
 	bool "Enable Cache Support"
 	default y
-	# if SMP, cache enabled ONLY if ARC implementation has cache coherency
-	depends on !SMP || ARC_HAS_COH_CACHES
 
 if ARC_CACHE
 
diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index 1d175cc6ad6d..1595a38e50cd 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -5,7 +5,6 @@
 
 menuconfig ARC_PLAT_EZNPS
 	bool "\"EZchip\" ARC dev platform"
-	select ARC_HAS_COH_CACHES if SMP
 	select CPU_BIG_ENDIAN
 	select CLKSRC_NPS
 	select EZNPS_GIC
diff --git a/arch/arc/plat-sim/Kconfig b/arch/arc/plat-sim/Kconfig
index 18e39fcc488a..ac6af96a82f3 100644
--- a/arch/arc/plat-sim/Kconfig
+++ b/arch/arc/plat-sim/Kconfig
@@ -8,7 +8,6 @@
 
 menuconfig ARC_PLAT_SIM
 	bool "ARC nSIM based simulation virtual platforms"
-	select ARC_HAS_COH_CACHES if SMP
 	help
 	  Support for nSIM based ARC simulation platforms
 	  This includes the standalone nSIM (uart only) vs. System C OSCI VP
-- 
2.7.4
