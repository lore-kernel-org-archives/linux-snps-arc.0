From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 5 Oct 2016 13:39:22 -0700
Subject: [PATCH] ARCv2: intc: untangle SMP, MCIP and IDU
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1475699962-11711-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The IDU intc is technically part of MCIP (Multi-core IP) hence
historically was only available in a SMP hardware build (and thus only
in a SMP kernel build). Now that hardware restriction has been lifted,
so a UP kernel needs to support it.

This requires breaking mcip.c into parts which are strictly SMP
(inter-core interrupts) and IDU which in reality is just another
intc and thus has no bearing on SMP.

This change allows IDU in UP builds and with a suitable device tree, we
can have the cascaded intc system

    ARCv2 core intc <---> ARCv2 IDU intc <---> periperals

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig            | 17 +++++++++--------
 arch/arc/include/asm/mcip.h | 16 ++++++++++++++++
 arch/arc/kernel/mcip.c      | 32 ++++++++++++--------------------
 3 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index df8c8864b5ba..7b65d0e18fa0 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -186,14 +186,6 @@ if SMP
 config ARC_HAS_COH_CACHES
 	def_bool n
 
-config ARC_MCIP
-	bool "ARConnect Multicore IP (MCIP) Support "
-	depends on ISA_ARCV2
-	help
-	  This IP block enables SMP in ARC-HS38 cores.
-	  It provides for cross-core interrupts, multi-core debug
-	  hardware semaphores, shared memory,....
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
 	range 2 4096
@@ -211,6 +203,15 @@ config ARC_SMP_HALT_ON_RESET
 
 endif	#SMP
 
+config ARC_MCIP
+	bool "ARConnect Multicore IP (MCIP) Support "
+	depends on ISA_ARCV2
+	default y if SMP
+	help
+	  This IP block enables SMP in ARC-HS38 cores.
+	  It provides for cross-core interrupts, multi-core debug
+	  hardware semaphores, shared memory,....
+
 menuconfig ARC_CACHE
 	bool "Enable Cache Support"
 	default y
diff --git a/arch/arc/include/asm/mcip.h b/arch/arc/include/asm/mcip.h
index 847e3bbe387f..c8fbe4114bad 100644
--- a/arch/arc/include/asm/mcip.h
+++ b/arch/arc/include/asm/mcip.h
@@ -55,6 +55,22 @@ struct mcip_cmd {
 #define IDU_M_DISTRI_DEST		0x2
 };
 
+struct mcip_bcr {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+		unsigned int pad3:8,
+			     idu:1, llm:1, num_cores:6,
+			     iocoh:1,  gfrc:1, dbg:1, pad2:1,
+			     msg:1, sem:1, ipi:1, pad:1,
+			     ver:8;
+#else
+		unsigned int ver:8,
+			     pad:1, ipi:1, sem:1, msg:1,
+			     pad2:1, dbg:1, gfrc:1, iocoh:1,
+			     num_cores:6, llm:1, idu:1,
+			     pad3:8;
+#endif
+};
+
 /*
  * MCIP programming model
  *
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 72f9179b1a24..423d7113e664 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -15,11 +15,12 @@
 #include <asm/mcip.h>
 #include <asm/setup.h>
 
-static char smp_cpuinfo_buf[128];
-static int idu_detected;
-
 static DEFINE_RAW_SPINLOCK(mcip_lock);
 
+#ifdef CONFIG_SMP
+
+static char smp_cpuinfo_buf[128];
+
 static void mcip_setup_per_cpu(int cpu)
 {
 	smp_ipi_irq_setup(cpu, IPI_IRQ);
@@ -84,23 +85,10 @@ static void mcip_ipi_clear(int irq)
 	raw_spin_unlock_irqrestore(&mcip_lock, flags);
 }
 
+
 static void mcip_probe_n_setup(void)
 {
-	struct mcip_bcr {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		unsigned int pad3:8,
-			     idu:1, llm:1, num_cores:6,
-			     iocoh:1,  gfrc:1, dbg:1, pad2:1,
-			     msg:1, sem:1, ipi:1, pad:1,
-			     ver:8;
-#else
-		unsigned int ver:8,
-			     pad:1, ipi:1, sem:1, msg:1,
-			     pad2:1, dbg:1, gfrc:1, iocoh:1,
-			     num_cores:6, llm:1, idu:1,
-			     pad3:8;
-#endif
-	} mp;
+	struct mcip_bcr mp;
 
 	READ_BCR(ARC_REG_MCIP_BCR, mp);
 
@@ -114,7 +102,6 @@ static void mcip_probe_n_setup(void)
 		IS_AVAIL1(mp.gfrc, "GFRC"));
 
 	cpuinfo_arc700[0].extn.gfrc = mp.gfrc;
-	idu_detected = mp.idu;
 
 	if (mp.dbg) {
 		__mcip_cmd_data(CMD_DEBUG_SET_SELECT, 0, 0xf);
@@ -130,6 +117,8 @@ struct plat_smp_ops plat_smp_ops = {
 	.ipi_clear	= mcip_ipi_clear,
 };
 
+#endif
+
 /***************************************************************************
  * ARCv2 Interrupt Distribution Unit (IDU)
  *
@@ -295,8 +284,11 @@ idu_of_init(struct device_node *intc, struct device_node *parent)
 	/* Read IDU BCR to confirm nr_irqs */
 	int nr_irqs = of_irq_count(intc);
 	int i, irq;
+	struct mcip_bcr mp;
+
+	READ_BCR(ARC_REG_MCIP_BCR, mp);
 
-	if (!idu_detected)
+	if (!mp.idu)
 		panic("IDU not detected, but DeviceTree using it");
 
 	pr_info("MCIP: IDU referenced from Devicetree %d irqs\n", nr_irqs);
-- 
2.7.4
