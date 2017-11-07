From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Nov 2017 14:13:04 -0800
Subject: [PATCH 4/4] ARCv2: entry: Reduce perf intr return path
In-Reply-To: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In the more likely case of returning to kernel from perf interrupt, do a
fast path returning w/o bothering about CONFIG_PREEMPT etc

However, if returning to user space, need do go thru the usual gyrations,
as check for pending signals is an absolute must.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/entry-arcv2.h |  2 ++
 arch/arc/kernel/entry-arcv2.S      | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 257a68f3c2fe..8b49b327b1f9 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -58,6 +58,8 @@
 /*------------------------------------------------------------------------*/
 .macro INTERRUPT_EPILOGUE	called_from
 
+	; Assumes STATUS32.Z bit set if return to K
+
 .ifnc \called_from, exception
 	add	sp, sp, 12	; skip BTA/ECR/orig_r0 placeholderss
 .endif
diff --git a/arch/arc/kernel/entry-arcv2.S b/arch/arc/kernel/entry-arcv2.S
index cc558a25b8fa..9ca1d146426b 100644
--- a/arch/arc/kernel/entry-arcv2.S
+++ b/arch/arc/kernel/entry-arcv2.S
@@ -51,7 +51,7 @@ VECTOR	handle_interrupt	; (16) Timer0
 VECTOR	handle_interrupt	; unused (Timer1)
 VECTOR	handle_interrupt	; unused (WDT)
 VECTOR	handle_interrupt	; (19) Inter core Interrupt (IPI)
-VECTOR	handle_interrupt	; (20) perf Interrupt
+VECTOR	handle_interrupt_pct	; (20) perf Interrupt
 VECTOR	handle_interrupt	; (21) Software Triggered Intr (Self IPI)
 VECTOR	handle_interrupt	; unused
 VECTOR	handle_interrupt	; (23) unused
@@ -97,6 +97,26 @@ ENTRY(handle_interrupt)
 
 END(handle_interrupt)
 
+ENTRY(handle_interrupt_pct)
+
+	INTERRUPT_PROLOGUE  irq
+
+	IRQ_DISABLE
+
+	lr	r0, [ICAUSE]
+
+	bl.d	arch_do_IRQ
+	mov	r1, sp
+
+	ld	r0, [sp, PT_status32]   ; returning to User/Kernel Mode
+	btst	r0, STATUS_U_BIT
+	bnz	resume_user_mode_begin
+
+	clri
+	b	.Lisr_ret_fast_path_to_k
+
+END(handle_interrupt_pct)
+
 ;################### Non TLB Exception Handling #############################
 
 ENTRY(EV_SWI)
@@ -224,6 +244,7 @@ debug_marker_l1:
 	bset.nz	r11, r11, AUX_IRQ_ACT_BIT_U	; NZ means U
 	sr	r11, [AUX_IRQ_ACT]
 
+.Lisr_ret_fast_path_to_k:
 	INTERRUPT_EPILOGUE  irq
 	rtie
 
-- 
2.7.4
