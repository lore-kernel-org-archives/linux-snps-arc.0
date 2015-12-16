From: noamc@ezchip.com (Noam Camus)
Date: Wed, 16 Dec 2015 03:10:22 +0200
Subject: [PATCH v4 03/19] ARC: [plat-eznps] define IPI_IRQ
In-Reply-To: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450228238-4499-4-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

We add IPI irq definition to be used later by any
irqchip such NPS400 IC.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/irq.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index 4fd7d62..c5f8f0f 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -16,7 +16,11 @@
 #ifdef CONFIG_ISA_ARCOMPACT
 #define TIMER0_IRQ      3
 #define TIMER1_IRQ      4
+#if defined(CONFIG_SMP) && defined(CONFIG_ARC_PLAT_EZNPS)
+#define IPI_IRQ         5
+#else
 #define IPI_IRQ		(NR_CPU_IRQS-1) /* dummy to enable SMP build for up hardware */
+#endif
 #else
 #define TIMER0_IRQ      16
 #define TIMER1_IRQ      17
-- 
1.7.1
