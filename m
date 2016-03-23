From: evgeny.voevodin@intel.com (Evgeny Voevodin)
Date: Wed, 23 Mar 2016 12:26:52 +0300
Subject: [PATCH] ARCv2: Additional trace IRQs to support locking correctness
 validator
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458725212-21215-1-git-send-email-evgeny.voevodin@intel.com>
To: linux-snps-arc@lists.infradead.org

Flags should be saved in the same format in which clri instruction saves
them since they are passed directly to seti instruction over
arch_local_save_flags/arch_local_irq_restore calls.
Trace of all clri/seti assembly calls is added to support locking
correctness validator properly.
With this patch it is possible to use locking correctness framework which
did stop itself due to incomplete support. Locking tests are also became
available and work propely.

Signed-off-by: Evgeny Voevodin <evgeny.voevodin at intel.com>
---
 arch/arc/include/asm/irqflags-arcv2.h | 31 ++++++++++++++++++++++++++++++-
 arch/arc/kernel/entry-arcv2.S         | 14 +++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
index 37c2f75..bb17044 100644
--- a/arch/arc/include/asm/irqflags-arcv2.h
+++ b/arch/arc/include/asm/irqflags-arcv2.h
@@ -15,8 +15,13 @@
 #define STATUS_AD_BIT	19   /* Disable Align chk: core supports non-aligned */
 #define STATUS_IE_BIT	31
 
+/* status32 Bits stored on clri instruction */
+#define CLRI_STATUS_IE_BIT	4
+
 #define STATUS_AD_MASK		(1<<STATUS_AD_BIT)
 #define STATUS_IE_MASK		(1<<STATUS_IE_BIT)
+#define CLRI_STATUS_E_MASK	(0xF)
+#define CLRI_STATUS_IE_MASK	(1<<CLRI_STATUS_IE_BIT)
 
 #define AUX_USER_SP		0x00D
 #define AUX_IRQ_CTRL		0x00E
@@ -100,6 +105,9 @@ static inline long arch_local_save_flags(void)
 	:
 	: "memory");
 
+	temp = (1 << 5) |
+		((!!(temp & STATUS_IE_MASK)) << CLRI_STATUS_IE_BIT) |
+		(temp & CLRI_STATUS_E_MASK);
 	return temp;
 }
 
@@ -108,7 +116,7 @@ static inline long arch_local_save_flags(void)
  */
 static inline int arch_irqs_disabled_flags(unsigned long flags)
 {
-	return !(flags & (STATUS_IE_MASK));
+	return !(flags & (CLRI_STATUS_IE_MASK));
 }
 
 static inline int arch_irqs_disabled(void)
@@ -128,11 +136,32 @@ static inline void arc_softirq_clear(int irq)
 
 #else
 
+#ifdef CONFIG_TRACE_IRQFLAGS
+
+.macro TRACE_ASM_IRQ_DISABLE
+	bl	trace_hardirqs_off
+.endm
+
+.macro TRACE_ASM_IRQ_ENABLE
+	bl	trace_hardirqs_on
+.endm
+
+#else
+
+.macro TRACE_ASM_IRQ_DISABLE
+.endm
+
+.macro TRACE_ASM_IRQ_ENABLE
+.endm
+
+#endif
 .macro IRQ_DISABLE  scratch
 	clri
+	TRACE_ASM_IRQ_DISABLE
 .endm
 
 .macro IRQ_ENABLE  scratch
+	TRACE_ASM_IRQ_ENABLE
 	seti
 .endm
 
diff --git a/arch/arc/kernel/entry-arcv2.S b/arch/arc/kernel/entry-arcv2.S
index c126460..24d9431 100644
--- a/arch/arc/kernel/entry-arcv2.S
+++ b/arch/arc/kernel/entry-arcv2.S
@@ -69,8 +69,11 @@ ENTRY(handle_interrupt)
 
 	clri		; To make status32.IE agree with CPU internal state
 
-	lr  r0, [ICAUSE]
+#ifdef CONFIG_TRACE_IRQFLAGS
+	TRACE_ASM_IRQ_DISABLE
+#endif
 
+	lr  r0, [ICAUSE]
 	mov   blink, ret_from_exception
 
 	b.d  arch_do_IRQ
@@ -173,6 +176,15 @@ END(EV_TLBProtV)
 	lr	r10, [AUX_IRQ_ACT]
 
 	bmsk	r11, r10, 15	; AUX_IRQ_ACT.ACTIVE
+#ifdef CONFIG_TRACE_IRQFLAGS
+	push r0
+	push r10
+	push r11
+	TRACE_ASM_IRQ_ENABLE
+	pop r11
+	pop r10
+	pop r0
+#endif
 	breq	r11, 0, .Lexcept_ret	; No intr active, ret from Exception
 
 ;####### Return from Intr #######
-- 
1.8.5.4


--------------------------------------------------------------------
Joint Stock Company Intel A/O
Registered legal address: Krylatsky Hills Business Park,
17 Krylatskaya Str., Bldg 4, Moscow 121614,
Russian Federation

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
