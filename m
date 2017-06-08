From: noamca@mellanox.com (Noam Camus)
Date: Thu,  8 Jun 2017 18:20:35 +0300
Subject: [PATCH 11/11] ARC: [plat-eznps] avoid toggling of DPC register
In-Reply-To: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
References: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496935235-46507-12-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Elad Kanfi <eladkan@mellanox.com>

HW bug description: in case of HW thread context switch
the dpc configuration of the exiting thread is dragged
one cycle into the next thread.
In order to avoid the consequences of this bug, the DPC register
is set to an initial value, and not changed afterwards.

Signed-off-by: Elad Kanfi <eladkan at mellanox.com>
Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 arch/arc/plat-eznps/mtm.c               |   12 ++++++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index 7729d3d..0c7d110 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -39,6 +39,7 @@
 #define CTOP_AUX_LOGIC_CORE_ID			(CTOP_AUX_BASE + 0x018)
 #define CTOP_AUX_MT_CTRL			(CTOP_AUX_BASE + 0x020)
 #define CTOP_AUX_HW_COMPLY			(CTOP_AUX_BASE + 0x024)
+#define CTOP_AUX_DPC				(CTOP_AUX_BASE + 0x02C)
 #define CTOP_AUX_LPC				(CTOP_AUX_BASE + 0x030)
 #define CTOP_AUX_EFLAGS				(CTOP_AUX_BASE + 0x080)
 #define CTOP_AUX_IACK				(CTOP_AUX_BASE + 0x088)
diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c
index f77335a..3c7dec9 100644
--- a/arch/arc/plat-eznps/mtm.c
+++ b/arch/arc/plat-eznps/mtm.c
@@ -101,6 +101,18 @@ void mtm_enable_core(unsigned int cpu)
 	int i;
 	struct nps_host_reg_aux_mt_ctrl mt_ctrl;
 	struct nps_host_reg_mtm_cfg mtm_cfg;
+	struct nps_host_reg_aux_dpc dpc;
+
+	/*
+	 * Initializing dpc register in each CPU.
+	 * Overwriting the init value of the DPC
+	 * register so that CMEM and FMT virtual address
+	 * spaces are accessible, and Data Plane HW
+	 * facilities are enabled.
+	 */
+	dpc.ien = 1;
+	dpc.men = 1;
+	write_aux_reg(CTOP_AUX_DPC, dpc.value);
 
 	if (NPS_CPU_TO_THREAD_NUM(cpu) != 0)
 		return;
-- 
1.7.1
