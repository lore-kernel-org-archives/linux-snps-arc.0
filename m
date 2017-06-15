From: noamca@mellanox.com (Noam Camus)
Date: Thu, 15 Jun 2017 11:44:00 +0300
Subject: [PATCH v3 10/11] ARC: [plat-eznps] handle dedicated AUX registers
In-Reply-To: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497516241-16446-11-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Liav Rehana <liavr@mellanox.com>

Preserve eflags and gpa1 auxiliaries during exception
Registers used by compare exchange instructions.
GPA1 is used for compare value, and EFLAGS got bit reflects
atomic operation response.

EFLAGS is zeroed for each new user task so it won't get its
parent value.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/include/asm/entry-compact.h |   24 ++++++++++++++++++++++++
 arch/arc/include/asm/ptrace.h        |    5 +++++
 arch/arc/kernel/process.c            |    4 ++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 14c310f..9e4458a 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -192,6 +192,12 @@
 	PUSHAX	lp_start
 	PUSHAX	erbta
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	.word CTOP_INST_SCHD_RW
+	PUSHAX  CTOP_AUX_GPA1
+	PUSHAX  CTOP_AUX_EFLAGS
+#endif
+`
 	lr	r9, [ecr]
 	st      r9, [sp, PT_event]    /* EV_Trap expects r9 to have ECR */
 .endm
@@ -208,6 +214,12 @@
  * by hardware and that is not good.
  *-------------------------------------------------------------*/
 .macro EXCEPTION_EPILOGUE
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	.word CTOP_INST_SCHD_RW
+	POPAX   CTOP_AUX_EFLAGS
+	POPAX   CTOP_AUX_GPA1
+#endif
+
 	POPAX	erbta
 	POPAX	lp_start
 	POPAX	lp_end
@@ -265,6 +277,12 @@
 	PUSHAX	lp_end
 	PUSHAX	lp_start
 	PUSHAX	bta_l\LVL\()
+
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	.word CTOP_INST_SCHD_RW
+	PUSHAX  CTOP_AUX_GPA1
+	PUSHAX  CTOP_AUX_EFLAGS
+#endif
 .endm
 
 /*--------------------------------------------------------------
@@ -277,6 +295,12 @@
  * by hardware and that is not good.
  *-------------------------------------------------------------*/
 .macro INTERRUPT_EPILOGUE  LVL
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	.word CTOP_INST_SCHD_RW
+	POPAX   CTOP_AUX_EFLAGS
+	POPAX   CTOP_AUX_GPA1
+#endif
+
 	POPAX	bta_l\LVL\()
 	POPAX	lp_start
 	POPAX	lp_end
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index 5297faa..5a8cb22 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -19,6 +19,11 @@
 #ifdef CONFIG_ISA_ARCOMPACT
 struct pt_regs {
 
+#ifdef CONFIG_ARC_PLAT_EZNPS
+	unsigned long eflags;	/* Extended FLAGS */
+	unsigned long gpa1;	/* General Purpose Aux */
+#endif
+
 	/* Real registers */
 	unsigned long bta;	/* bta_l1, bta_l2, erbta */
 
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 5c631a1..5ac3b54 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -234,6 +234,10 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long usp)
 	 */
 	regs->status32 = STATUS_U_MASK | STATUS_L_MASK | ISA_INIT_STATUS_BITS;
 
+#ifdef CONFIG_EZNPS_MTM_EXT
+	regs->eflags = 0;
+#endif
+
 	/* bogus seed values for debugging */
 	regs->lp_start = 0x10;
 	regs->lp_end = 0x80;
-- 
1.7.1
