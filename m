From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 05:34:19 +0300
Subject: [PATCH 09/10] ARC: [plat-eznps] use schd.wft instruction instead of
 sleep at idle task
In-Reply-To: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495679660-9598-10-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

When HW threads are active we want CPU to enter idle state only
for the calling HW thread and not to put on sleep all HW threads
sharing this core. For this need the NPS400 got dedicated instruction
so only calling thread is entring sleep and all other are still awake
and can execute instructions.

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/kernel/process.c               |    7 +++++++
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 2a018de..d3c39e4 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -82,10 +82,17 @@
 void arch_cpu_idle(void)
 {
 	/* sleep, but enable all interrupts before committing */
+#if !defined(CONFIG_EZNPS_MTM_EXT)
 	__asm__ __volatile__(
 		"sleep %0	\n"
 		:
 		:"I"(ISA_SLEEP_ARG)); /* can't be "r" has to be embedded const */
+#else
+	__asm__ __volatile__(
+		".word %0	\n"
+		:
+		:"i"(CTOP_INST_HWSCHD_WFT_IE12));
+#endif
 }
 
 asmlinkage void ret_from_fork(void);
diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index ee2e32d..7729d3d 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -46,6 +46,7 @@
 #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
 
 /* EZchip core instructions */
+#define CTOP_INST_HWSCHD_WFT_IE12		0x3E6F7344
 #define CTOP_INST_HWSCHD_OFF_R4			0x3C6F00BF
 #define CTOP_INST_HWSCHD_RESTORE_R4		0x3E6F7103
 #define CTOP_INST_SCHD_RW			0x3E6F7004
-- 
1.7.1
