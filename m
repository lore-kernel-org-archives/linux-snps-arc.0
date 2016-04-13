From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 13 Apr 2016 17:10:03 +0530
Subject: [PATCH v4 3/5] ARC: irq: export some IRQs again
In-Reply-To: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1460547605-26184-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This will be needed for switching ti lineaser irq domain as
irq_create_mapping() called by intr code, needs the IRQ numbers as well
in addition to existing usage in mcip.c

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h | 6 ++++++
 arch/arc/kernel/mcip.c     | 3 ---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index a6ac89dc228f..c0fa0d2de400 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -12,6 +12,12 @@
 #define NR_CPU_IRQS	32  /* number of interrupt lines of ARC770 CPU */
 #define NR_IRQS		128 /* allow some CPU external IRQ handling */
 
+/* Platform Independent IRQs */
+#ifdef CONFIG_ISA_ARCV2
+#define IPI_IRQ		19
+#define SOFTIRQ_IRQ	21
+#endif
+
 #include <linux/interrupt.h>
 #include <asm-generic/irq.h>
 
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 262d9c3771e6..72f9179b1a24 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -15,9 +15,6 @@
 #include <asm/mcip.h>
 #include <asm/setup.h>
 
-#define IPI_IRQ		19
-#define SOFTIRQ_IRQ	21
-
 static char smp_cpuinfo_buf[128];
 static int idu_detected;
 
-- 
2.5.0
