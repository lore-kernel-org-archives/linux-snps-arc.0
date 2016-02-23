From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Feb 2016 14:41:40 +0530
Subject: [PATCH 3/5] ARCv2: SMP: Push IPI_IRQ into IPI provider
In-Reply-To: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
References: <1456218702-11911-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456218702-11911-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/irq.h | 1 -
 arch/arc/kernel/mcip.c     | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index bc5103637326..49014f0ef36d 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -19,7 +19,6 @@
 #else
 #define TIMER0_IRQ      16
 #define TIMER1_IRQ      17
-#define IPI_IRQ         19
 #endif
 
 #include <linux/interrupt.h>
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 9e1bd03b87a6..e30d5d428330 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -15,6 +15,7 @@
 #include <asm/mcip.h>
 #include <asm/setup.h>
 
+#define IPI_IRQ		19
 #define SOFTIRQ_IRQ	21
 
 static char smp_cpuinfo_buf[128];
-- 
2.5.0
