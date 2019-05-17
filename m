From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 May 2019 12:32:08 -0700
Subject: [PATCH 5/5] ARC: entry: EV_Trap expects r10 (vs. r9) to have
 exception cause
In-Reply-To: <1558121528-30184-1-git-send-email-vgupta@synopsys.com>
References: <1558121528-30184-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558121528-30184-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

avoids 1 MOV instruction in light of double load/store code

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/entry-arcv2.h   | 3 +--
 arch/arc/include/asm/entry-compact.h | 4 ++--
 arch/arc/kernel/entry.S              | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 0733752ce7fe..f5ae394ebe06 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -95,9 +95,8 @@
 	lr	r10, [ecr]
 	lr	r11, [erbta]
 	ST2	r10, r11, PT_event
-	mov	r9, r10
 
-	; OUTPUT: r9 has ECR
+	; OUTPUT: r10 has ECR expected by EV_Trap
 .endm
 
 /*------------------------------------------------------------------------
diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 29f3988c9424..98aff149b344 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -198,8 +198,8 @@
 	PUSHAX  CTOP_AUX_EFLAGS
 #endif
 
-	lr	r9, [ecr]
-	st      r9, [sp, PT_event]    /* EV_Trap expects r9 to have ECR */
+	lr	r10, [ecr]
+	st      r10, [sp, PT_event]    /* EV_Trap expects r10 to have ECR */
 .endm
 
 /*--------------------------------------------------------------
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 85d9ea4a0acc..730b83ccfbc1 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -235,8 +235,8 @@ ENTRY(EV_Trap)
 	EXCEPTION_PROLOGUE
 
 	;============ TRAP 1   :breakpoints
-	; Check ECR for trap with arg (PROLOGUE ensures r9 has ECR)
-	bmsk.f 0, r9, 7
+	; Check ECR for trap with arg (PROLOGUE ensures r10 has ECR)
+	bmsk.f 0, r10, 7
 	bnz    trap_with_param
 
 	;============ TRAP  (no param): syscall top level
-- 
2.7.4
