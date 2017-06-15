From: noamca@mellanox.com (Noam Camus)
Date: Thu, 15 Jun 2017 11:43:58 +0300
Subject: [PATCH v3 08/11] ARC: [plat-eznps] Update the init sequence of aux
 regs per cpu.
In-Reply-To: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497516241-16446-9-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Liav Rehana <liavr@mellanox.com>

This commit add new configuration that enables us to distinguish
between building the kernel for platforms that have a different set
of auxiliary registers for each cpu and platforms that have a shared
set of auxiliary registers across every thread in each core.
On platforms that implement a different set of auxiliary registers
disabling this configuration insures that we initialize registers on
every cpu and not just for the first thread of the core.
Example for non shared registers is working with EZsim (non silicon)

Signed-off-by: Liav Rehana <liavr at mellanox.com>
Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/plat-eznps/Kconfig |   11 +++++++++++
 arch/arc/plat-eznps/entry.S |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index b36afb1..e151e20 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -43,3 +43,14 @@ config EZNPS_MEM_ERROR_ALIGN
 	  simulator platform for NPS, is handled as a Level 2 interrupt
 	  (just a stock ARC700) which is recoverable. This option makes
 	  simulator behave like hardware.
+
+config EZNPS_SHARED_AUX_REGS
+	bool "ARC-EZchip Shared Auxiliary Registers Per Core"
+	depends on ARC_PLAT_EZNPS
+	default y
+	help
+	  On the real chip of the NPS, auxiliary registers are shared between
+	  all the cpus of the core, whereas on simulator platform for NPS,
+	  each cpu has a different set of auxiliary registers. Configuration
+	  should be unset if auxiliary registers are not shared between the cpus
+	  of the core, so there will be a need to initialize them per cpu.
diff --git a/arch/arc/plat-eznps/entry.S b/arch/arc/plat-eznps/entry.S
index 328261c..091c92c 100644
--- a/arch/arc/plat-eznps/entry.S
+++ b/arch/arc/plat-eznps/entry.S
@@ -27,7 +27,7 @@
 	.align 1024	; HW requierment for restart first PC
 
 ENTRY(res_service)
-#ifdef CONFIG_EZNPS_MTM_EXT
+#if defined(CONFIG_EZNPS_MTM_EXT) && defined(CONFIG_EZNPS_SHARED_AUX_REGS)
 	; There is no work for HW thread id != 0
 	lr	r3, [CTOP_AUX_THREAD_ID]
 	cmp	r3, 0
-- 
1.7.1
