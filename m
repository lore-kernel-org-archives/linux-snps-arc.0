From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Jun 2019 13:28:58 -0700
Subject: [PATCH] ARCv2: entry: simplify return to Delay Slot via interrupt
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1559939338-27673-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit 4255b07f2c9c43540 ("ARCv2: STAR 9000793984: Handle return
from intr to Delay Slot") involved a complex 2 staged trampoline.

Apparently this can be greatly simplified by returning from pure
kernel mode (vs interrupt) so drop to pute kernel mdoe and execute the
normal exception return path.

Note that after commit 4de0e52867d83105767 ("ARCv2: STAR 9000814690:
Really Re-enable interrupts to avoid deadlocks") the pur einterrupt
return path is rarely exercised for normal interrupts so this return to
delay slot via interrupt becomes extreemely hard to hit (and test),
so my local test setup had that revert to validate this fix.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/entry-arcv2.S | 55 +++++++------------------------------------
 1 file changed, 8 insertions(+), 47 deletions(-)

diff --git a/arch/arc/kernel/entry-arcv2.S b/arch/arc/kernel/entry-arcv2.S
index 6cbf0ee8a20a..5dc2bb525765 100644
--- a/arch/arc/kernel/entry-arcv2.S
+++ b/arch/arc/kernel/entry-arcv2.S
@@ -82,7 +82,7 @@ ENTRY(handle_interrupt)
 	#
 	# Note this disable is only for consistent book-keeping as further interrupts
 	# will be disabled anyways even w/o this. Hardware tracks active interrupts
-	# seperately in AUX_IRQ_ACTIVE.active and will not take new interrupts
+	# seperately in AUX_IRQ_ACT.active and will not take new interrupts
 	# unless this one returns (or higher prio becomes pending in 2-prio scheme)
 
 	IRQ_DISABLE
@@ -203,7 +203,7 @@ restore_regs:
 	ld	r0, [sp, PT_status32]	; U/K mode at time of entry
 	lr	r10, [AUX_IRQ_ACT]
 
-	bmsk	r11, r10, 15	; AUX_IRQ_ACT.ACTIVE
+	bmsk	r11, r10, 15		; extract AUX_IRQ_ACT.active
 	breq	r11, 0, .Lexcept_ret	; No intr active, ret from Exception
 
 ;####### Return from Intr #######
@@ -247,8 +247,8 @@ debug_marker_syscall:
 ;
 ; IRQ RTIE won't reliably restore DE bit and/or BTA, needs workaround
 ;
-; Solution is return from Intr w/o any delay slot quirks into a kernel trampoline
-; and from pure kernel mode return to delay slot which handles DS bit/BTA correctly
+; Solution is to drop out of interrupt context into pure kernel mode
+; and return from pure kernel mode which does right things for delay slot
 
 .Lintr_ret_to_delay_slot:
 debug_marker_ds:
@@ -257,48 +257,9 @@ debug_marker_ds:
 	add	r2, r2, 1
 	st	r2, [@intr_to_DE_cnt]
 
-	ld	r2, [sp, PT_ret]
-	ld	r3, [sp, PT_status32]
-
-	; STAT32 for Int return created from scratch
-	; (No delay dlot, disable Further intr in trampoline)
-
-	bic  	r0, r3, STATUS_U_MASK|STATUS_DE_MASK|STATUS_IE_MASK|STATUS_L_MASK
-	st	r0, [sp, PT_status32]
-
-	mov	r1, .Lintr_ret_to_delay_slot_2
-	st	r1, [sp, PT_ret]
-
-	; Orig exception PC/STAT32 safekept @orig_r0 and @event stack slots
-	st	r2, [sp, 0]
-	st	r3, [sp, 4]
-
-	b	.Lisr_ret_fast_path
-
-.Lintr_ret_to_delay_slot_2:
-	; Trampoline to restore orig exception PC/STAT32/BTA/AUX_USER_SP
-	sub	sp, sp, SZ_PT_REGS
-	st	r9, [sp, -4]
-
-	ld	r9, [sp, 0]
-	sr	r9, [eret]
-
-	ld	r9, [sp, 4]
-	sr	r9, [erstatus]
-
-	; restore AUX_USER_SP if returning to U mode
-	bbit0	r9, STATUS_U_BIT, 1f
-	ld	r9, [sp, PT_sp]
-	sr	r9, [AUX_USER_SP]
-
-1:
-	ld	r9, [sp, 8]
-	sr	r9, [erbta]
-
-	ld	r9, [sp, -4]
-	add	sp, sp, SZ_PT_REGS
-
-	; return from pure kernel mode to delay slot
-	rtie
+	; drop out of interrupt context (clear AUX_IRQ_ACT.active)
+	bmskn	r11, r10, 15
+	sr	r11, [AUX_IRQ_ACT]
+	b	.Lexcept_ret
 
 END(ret_from_exception)
-- 
2.7.4
