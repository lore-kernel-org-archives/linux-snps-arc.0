From: noamca@mellanox.com (Noam Camus)
Date: Thu, 15 Jun 2017 11:43:59 +0300
Subject: [PATCH v3 09/11] ARC: [plat-eznps] Save/Restore extra auxiliary
 registers
In-Reply-To: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497516241-16446-10-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

thread_struct got new field for data plane of eznps platform.
This field got place for data plane auxiliary registers and for
any extra registers that might be changed in kernel code.

We save EFLAGS, and GPA1 auxiliary registers since they may be
changed by the new task while using atomic operations e.g. cmpxchg.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/arcregs.h   |    7 +++++++
 arch/arc/include/asm/processor.h |    3 +++
 arch/arc/include/asm/switch_to.h |   11 +++++++++++
 arch/arc/plat-eznps/Makefile     |    2 +-
 arch/arc/plat-eznps/ctop.c       |   33 +++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 arch/arc/plat-eznps/ctop.c

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index ba8e802..9437d42 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -123,6 +123,13 @@
 #define PAGES_TO_MB(n_pages)	(PAGES_TO_KB(n_pages) >> 10)
 
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+struct eznps_dp {
+	unsigned int eflags;
+	unsigned int gpa1;
+};
+#endif
+
 /*
  ***************************************************************
  * Build Configuration Registers, with encoded hardware config
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index fd7bdfa..130bb55 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -38,6 +38,9 @@ struct thread_struct {
 #ifdef CONFIG_ARC_FPU_SAVE_RESTORE
 	struct arc_fpu fpu;
 #endif
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	struct eznps_dp dp;
+#endif
 };
 
 #define INIT_THREAD  {                          \
diff --git a/arch/arc/include/asm/switch_to.h b/arch/arc/include/asm/switch_to.h
index 1b171ab..4c53080 100644
--- a/arch/arc/include/asm/switch_to.h
+++ b/arch/arc/include/asm/switch_to.h
@@ -26,13 +26,24 @@
 
 #endif /* !CONFIG_ARC_FPU_SAVE_RESTORE */
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+extern void dp_save_restore(struct task_struct *p, struct task_struct *n);
+#define ARC_DP_PREV(p, n)      dp_save_restore(p, n)
+#define ARC_DP_NEXT(t)
+#else
+#define ARC_DP_PREV(p, n)
+#define ARC_DP_NEXT(n)
+#endif /* !CONFIG_ARC_PLAT_EZNPS */
+
 struct task_struct *__switch_to(struct task_struct *p, struct task_struct *n);
 
 #define switch_to(prev, next, last)	\
 do {					\
+	ARC_DP_PREV(prev, next);	\
 	ARC_FPU_PREV(prev, next);	\
 	last = __switch_to(prev, next);\
 	ARC_FPU_NEXT(next);		\
+	ARC_DP_NEXT(next);		\
 	mb();				\
 } while (0)
 
diff --git a/arch/arc/plat-eznps/Makefile b/arch/arc/plat-eznps/Makefile
index 21091b1..8d43717 100644
--- a/arch/arc/plat-eznps/Makefile
+++ b/arch/arc/plat-eznps/Makefile
@@ -2,6 +2,6 @@
 # Makefile for the linux kernel.
 #
 
-obj-y := entry.o platform.o
+obj-y := entry.o platform.o ctop.o
 obj-$(CONFIG_SMP) += smp.o
 obj-$(CONFIG_EZNPS_MTM_EXT) += mtm.o
diff --git a/arch/arc/plat-eznps/ctop.c b/arch/arc/plat-eznps/ctop.c
new file mode 100644
index 0000000..8b13a08
--- /dev/null
+++ b/arch/arc/plat-eznps/ctop.c
@@ -0,0 +1,33 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/sched.h>
+#include <asm/arcregs.h>
+#include <plat/ctop.h>
+
+void dp_save_restore(struct task_struct *prev, struct task_struct *next)
+{
+	struct eznps_dp *prev_task_dp = &prev->thread.dp;
+	struct eznps_dp *next_task_dp = &next->thread.dp;
+
+	/* Here we save all Data Plane related auxiliary registers */
+	prev_task_dp->eflags = read_aux_reg(CTOP_AUX_EFLAGS);
+	write_aux_reg(CTOP_AUX_EFLAGS, next_task_dp->eflags);
+
+	prev_task_dp->gpa1 = read_aux_reg(CTOP_AUX_GPA1);
+	write_aux_reg(CTOP_AUX_GPA1, next_task_dp->gpa1);
+}
+
-- 
1.7.1
