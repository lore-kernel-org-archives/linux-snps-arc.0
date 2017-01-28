From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Sat, 28 Jan 2017 03:01:38 +0300
Subject: [PATCH 1/6] ARCv2: IRQ: Move structures for core intc to the header
In-Reply-To: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485561703-20921-2-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Also add new macro ARC_REG_STATUS32 for the address of STATUS32
auxiliary register. It is better to use it instead of magic numbers.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/include/asm/arcregs.h | 26 ++++++++++++++++++++++++++
 arch/arc/kernel/intc-arcv2.c   | 23 +++--------------------
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index f659942..bc1f7bf 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -38,6 +38,9 @@
 #define ARC_REG_CLUSTER_BCR	0xcf
 #define ARC_REG_AUX_ICCM	0x208	/* ICCM Base Addr (ARCv2) */
 
+/* Common for ARCompact and ARCv2 status register */
+#define ARC_REG_STATUS32	0x0A
+
 /* status32 Bits Positions */
 #define STATUS_AE_BIT		5	/* Exception active */
 #define STATUS_DE_BIT		6	/* PC is in delay slot */
@@ -233,6 +236,29 @@ struct bcr_generic {
 #endif
 };
 
+struct bcr_irq_arcv2 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad:3, firq:1, prio:4, exts:8, irqs:8, ver:8;
+#else
+	unsigned int ver:8, irqs:8, exts:8, prio:4, firq:1, pad:3;
+#endif
+};
+
+/*
+ ***********************************************
+ * Control registers for configuration of CPU
+ */
+
+struct aux_irq_ctrl_arcv2 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int res3:18, save_idx_regs:1, res2:1, save_u_to_u:1,
+		     save_lp_regs:1, save_blink:1, res:4, save_nr_gpr_pairs:5;
+#else
+	unsigned int save_nr_gpr_pairs:5, res:4, save_blink:1, save_lp_regs:1,
+		     save_u_to_u:1, res2:1, save_idx_regs:1, res3:18;
+#endif
+};
+
 /*
  *******************************************************************
  * Generic structures to hold build configuration used at runtime
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index ecef0fb..2f31bb1 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -24,25 +24,8 @@ void arc_init_IRQ(void)
 {
 	unsigned int tmp, irq_prio;
 
-	struct irq_build {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		unsigned int pad:3, firq:1, prio:4, exts:8, irqs:8, ver:8;
-#else
-		unsigned int ver:8, irqs:8, exts:8, prio:4, firq:1, pad:3;
-#endif
-	} irq_bcr;
-
-	struct aux_irq_ctrl {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		unsigned int res3:18, save_idx_regs:1, res2:1,
-			     save_u_to_u:1, save_lp_regs:1, save_blink:1,
-			     res:4, save_nr_gpr_pairs:5;
-#else
-		unsigned int save_nr_gpr_pairs:5, res:4,
-			     save_blink:1, save_lp_regs:1, save_u_to_u:1,
-			     res2:1, save_idx_regs:1, res3:18;
-#endif
-	} ictrl;
+	struct bcr_irq_arcv2 irq_bcr;
+	struct aux_irq_ctrl_arcv2 ictrl;
 
 	*(unsigned int *)&ictrl = 0;
 
@@ -69,7 +52,7 @@ void arc_init_IRQ(void)
 		irq_bcr.firq ? " FIRQ (not used)":"");
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
-	tmp = read_aux_reg(0xa);
+	tmp = read_aux_reg(ARC_REG_STATUS32);
 	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
 	tmp &= ~STATUS_IE_MASK;
 	asm volatile("kflag %0	\n"::"r"(tmp));
-- 
2.7.4
