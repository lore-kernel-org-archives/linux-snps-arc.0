From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 05:34:20 +0300
Subject: [PATCH 10/10] ARC: [plat-eznps] Handle memory error as an exception
In-Reply-To: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495679660-9598-11-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

This commit adds the configuration CONFIG_EZNPS_MEM_ERROR.
If set, it will cause the kernel to handle user memory error
as a machine check exception.
It is required in order to align the NPS simulator memory
error handling to the one of the NPS400 real chip behavior.

Signed-off-by: Elad Kanfi <eladkan at mellanox.com>
Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/kernel/entry-compact.S |   11 +++++++++++
 arch/arc/plat-eznps/Kconfig     |   11 +++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/arch/arc/kernel/entry-compact.S b/arch/arc/kernel/entry-compact.S
index f285dbb..d152d36 100644
--- a/arch/arc/kernel/entry-compact.S
+++ b/arch/arc/kernel/entry-compact.S
@@ -203,6 +203,17 @@ END(handle_interrupt_level2)
 ; ---------------------------------------------
 ENTRY(mem_service)
 
+#if defined(CONFIG_EZNPS_MEM_ERROR)
+        ; SW workaround to cover up on a difference between
+        ; NPS real chip and simulator behaviors.
+        ; NPS real chip will activate a machine check exception
+        ; in case of memory error, while the simulator will
+        ; trigger a level 2 interrupt. Therefor this code section
+        ; should be reached only in simulation mode.
+        ; DEAD END: display Regs and HALT
+
+	j EV_MachineCheck
+#endif
 	INTERRUPT_PROLOGUE 2
 
 	mov r0, ilink2
diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
index feaa471..c5f946c 100644
--- a/arch/arc/plat-eznps/Kconfig
+++ b/arch/arc/plat-eznps/Kconfig
@@ -32,3 +32,14 @@ config EZNPS_MTM_EXT
 	  any of them seem like CPU from Linux point of view.
 	  All threads within same core share the execution unit of the
 	  core and HW scheduler round robin between them.
+
+config EZNPS_MEM_ERROR
+       bool "ARC-EZchip Memory error as an exception"
+       depends on ARC_PLAT_EZNPS
+       default n
+       help
+         On the real chip of the NPS, user memory errors are handled
+         as a machine check exception, whereas on simulator platform
+         for NPS, it handled as an interrupt level 2 (like legacy arc
+         real chip architecture).This configuration will cause the kernel
+         to handle memory error as a machine check exception.
-- 
1.7.1
