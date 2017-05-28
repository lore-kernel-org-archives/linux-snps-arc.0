From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:52:08 +0300
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an exception
In-Reply-To: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-12-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

This commit adds the configuration CONFIG_EZNPS_MEM_ERROR.
If set, it will cause the kernel to handle user memory error
as a machine check exception.
It is required in order to align the NPS simulator memory
error handling to the one of the NPS400 real chip behavior.
We override weak symbole of mem_service to achieve that.

Signed-off-by: Elad Kanfi <eladkan at mellanox.com>
Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/plat-eznps/Kconfig |   11 +++++++++++
 arch/arc/plat-eznps/entry.S |   14 ++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)

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
diff --git a/arch/arc/plat-eznps/entry.S b/arch/arc/plat-eznps/entry.S
index 328261c..03e2892 100644
--- a/arch/arc/plat-eznps/entry.S
+++ b/arch/arc/plat-eznps/entry.S
@@ -68,3 +68,17 @@ ENTRY(res_service)
 
 	j	stext
 END(res_service)
+
+#if defined(CONFIG_EZNPS_MEM_ERROR)
+ENTRY(mem_service)
+	; SW workaround to cover up on a difference between
+	; NPS real chip and simulator behaviors.
+	; NPS real chip will activate a machine check exception
+	; in case of memory error, while the simulator will
+	; trigger a level 2 interrupt. Therefor this code section
+	; should be reached only in simulation mode.
+	; DEAD END: display Regs and HALT
+
+	j EV_MachineCheck
+END(mem_service)
+#endif
-- 
1.7.1
