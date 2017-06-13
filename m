From: noamca@mellanox.com (Noam Camus)
Date: Tue, 13 Jun 2017 17:03:45 +0300
Subject: [PATCH v2 01/12] ARC: [plat-eznps] Handle memory error as an exception
In-Reply-To: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
References: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497362636-30353-2-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

On ARC700, user mode memory error is treated as L2 interrupt, but NPS
hardware treats it as Machine Check exception.

Address this by defining an NPS specific bus error handler.

Signed-off-by: Noam Camus <noamca at mellanox.com>
Signed-off-by: Elad Kanfi <eladkan at mellanox.com>
---
 arch/arc/kernel/traps.c     |    2 +-
 arch/arc/plat-eznps/Kconfig |   12 ++++++++++++
 arch/arc/plat-eznps/mtm.c   |   11 +++++++++++
 3 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index ff83e78..62675b9 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -80,7 +80,7 @@ int name(unsigned long address, struct pt_regs *regs) \
 DO_ERROR_INFO(SIGILL, "Priv Op/Disabled Extn", do_privilege_fault, ILL_PRVOPC)
 DO_ERROR_INFO(SIGILL, "Invalid Extn Insn", do_extension_fault, ILL_ILLOPC)
 DO_ERROR_INFO(SIGILL, "Illegal Insn (or Seq)", insterror_is_error, ILL_ILLOPC)
-DO_ERROR_INFO(SIGBUS, "Invalid Mem Access", do_memory_error, BUS_ADRERR)
+DO_ERROR_INFO(SIGBUS, "Invalid Mem Access", __weak do_memory_error, BUS_ADRERR)
 DO_ERROR_INFO(SIGTRAP, "Breakpoint Set", trap_is_brkpt, TRAP_BRKPT)
 DO_ERROR_INFO(SIGBUS, "Misaligned Access", do_misaligned_error, BUS_ADRALN)
 
diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index feaa471..fa25136 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -32,3 +32,15 @@ config EZNPS_MTM_EXT
 	  any of them seem like CPU from Linux point of view.
 	  All threads within same core share the execution unit of the
 	  core and HW scheduler round robin between them.
+
+config EZNPS_MEM_ERROR
+       bool "ARC-EZchip Memory error as an exception"
+       depends on EZNPS_MTM_EXT
+       default n
+       help
+	  On the real chip of the NPS, user memory errors are handled
+	  as a machine check exception, whereas on simulator platform
+	  for NPS, is handled as an interrupt level 2 (like legacy arc
+	  real chip architecture).This configuration will cause the kernel
+	  to handle memory error similar to a machine check exception.
+	  It means NOT sending a SIGBUS, but panic the system.
diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c
index e0cb36b..59a0162 100644
--- a/arch/arc/plat-eznps/mtm.c
+++ b/arch/arc/plat-eznps/mtm.c
@@ -25,6 +25,17 @@
 #define MT_CTRL_ST_CNT		0xF
 #define NPS_NUM_HW_THREADS	0x10
 
+#ifdef CONFIG_EZNPS_MEM_ERROR
+int do_memory_error(unsigned long address, struct pt_regs *regs)
+{
+	char *str = "Invalid Mem Access";
+
+	die(str, regs, address);
+
+	return 1;
+}
+#endif
+
 static void mtm_init_nat(int cpu)
 {
 	struct nps_host_reg_mtm_cfg mtm_cfg;
-- 
1.7.1
