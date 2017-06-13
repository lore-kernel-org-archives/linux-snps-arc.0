From: noamca@mellanox.com (Noam Camus)
Date: Tue, 13 Jun 2017 17:03:53 +0300
Subject: [PATCH v2 09/12] ARC: [plat-eznps] Update the init sequence of aux
 regs per cpu.
In-Reply-To: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
References: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497362636-30353-10-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Liav Rehana <liavr@mellanox.com>

The following commit adds a config that will enable us to distinguish
between building the kernel for platforms that have a different set
of auxiliary registers for each cpu and platforms that have a shared
set of auxiliary registers across every thread in each core.
On platforms that implement a different set of auxiliary registers
there is a need to initialize them on every cpu and not just the for the
first thread of the core.

Signed-off-by: Liav Rehana <liavr at mellanox.com>
Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/plat-eznps/Kconfig |   11 +++++++++++
 arch/arc/plat-eznps/entry.S |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index fa25136..019de58 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -44,3 +44,14 @@ config EZNPS_MEM_ERROR
 	  real chip architecture).This configuration will cause the kernel
 	  to handle memory error similar to a machine check exception.
 	  It means NOT sending a SIGBUS, but panic the system.
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
