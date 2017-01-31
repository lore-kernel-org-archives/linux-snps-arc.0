From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue, 31 Jan 2017 14:45:22 +0300
Subject: [PATCH v2 2/4] ARCv2: IRQ: Remove option for setting number of
 interrupts
In-Reply-To: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485863124-26426-3-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

When you set a value of ARC_NUMBER_OF_INTERRUPTS option
it affects only a size of the interrupts table but macros
for number of virtual interrupts (NR_IRQS) and for number
of hardware interrupts (NR_CPU_IRQS) remain unchanged.
Moreover usage of ARC_NUMBER_OF_INTERRUPTS is bad for
portability since it is not possible to change size
of the interrupts table after linkage.

This patch makes these changes in IRQ subsystem:

  * NR_CPU_IRQS defines a maximum number of hardware interrupts.
  * Remove ARC_NUMBER_OF_INTERRUPTS option and create interrupts
    table for all possible hardware interrupts.
  * Increase a maximum number of virtual IRQs to 512. ARCv2 can
    support 240 interrupts in the core interrupts controllers
    and 128 interrupts in IDU. Thus 512 virtual IRQs must be
    enough for most configurations of boards.

Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
---
 arch/arc/Kconfig              | 11 -----------
 arch/arc/include/asm/irq.h    | 28 +++++++++++++++++++++++++---
 arch/arc/kernel/entry-arcv2.S |  3 ++-
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 283099c..ba15cb8 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -412,17 +412,6 @@ config ARC_HAS_DIV_REM
 	bool "Insn: div, divu, rem, remu"
 	default y
 
-config ARC_NUMBER_OF_INTERRUPTS
-	int "Number of interrupts"
-	range 8 240
-	default 32
-	help
-	  This defines the number of interrupts on the ARCv2HS core.
-	  It affects the size of vector table.
-	  The initial 8 IRQs are fixed (Timer, ICI etc) and although configurable
-	  in hardware, it keep things simple for Linux to assume they are always
-	  present.
-
 endif	# ISA_ARCV2
 
 endmenu   # "ARC CPU Configuration"
diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
index c0fa0d2..d28499a 100644
--- a/arch/arc/include/asm/irq.h
+++ b/arch/arc/include/asm/irq.h
@@ -9,18 +9,40 @@
 #ifndef __ASM_ARC_IRQ_H
 #define __ASM_ARC_IRQ_H
 
-#define NR_CPU_IRQS	32  /* number of interrupt lines of ARC770 CPU */
-#define NR_IRQS		128 /* allow some CPU external IRQ handling */
+#ifdef CONFIG_ISA_ARCV2
+
+/*
+ * A maximum number of supported interrupts in the core interrupt controller.
+ * This number is not equal to the maximum interrupt number (256) because
+ * first 16 lines are reserved for exceptions and are not configurable.
+ */
+#define NR_CPU_IRQS	240
+
+/*
+ * ARCv2 can support 240 interrupts in the core interrupts controllers and
+ * 128 interrupts in IDU. Thus 512 virtual IRQs must be enough for most
+ * configurations of boards.
+ */
+#define NR_IRQS		512
 
 /* Platform Independent IRQs */
-#ifdef CONFIG_ISA_ARCV2
 #define IPI_IRQ		19
 #define SOFTIRQ_IRQ	21
+
+#else
+
+#define NR_CPU_IRQS	32  /* number of interrupt lines of ARC770 CPU */
+#define NR_IRQS		128 /* allow some CPU external IRQ handling */
+
 #endif
 
+#ifndef __ASSEMBLY__
+
 #include <linux/interrupt.h>
 #include <asm-generic/irq.h>
 
 extern void arc_init_IRQ(void);
 
 #endif
+
+#endif
diff --git a/arch/arc/kernel/entry-arcv2.S b/arch/arc/kernel/entry-arcv2.S
index 0b6388a..f22101e 100644
--- a/arch/arc/kernel/entry-arcv2.S
+++ b/arch/arc/kernel/entry-arcv2.S
@@ -13,6 +13,7 @@
 #include <asm/errno.h>
 #include <asm/arcregs.h>
 #include <asm/irqflags.h>
+#include <asm/irq.h>
 
 	.cpu HS
 
@@ -52,7 +53,7 @@ VECTOR	handle_interrupt	; unused
 VECTOR	handle_interrupt	; (23) unused
 # End of fixed IRQs
 
-.rept CONFIG_ARC_NUMBER_OF_INTERRUPTS - 8
+.rept NR_CPU_IRQS - 8
 	VECTOR	handle_interrupt
 .endr
 
-- 
2.7.4
