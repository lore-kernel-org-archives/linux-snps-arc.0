From: liavr@mellanox.com (Liav Rehana)
Date: Tue, 16 Aug 2016 10:55:35 +0300
Subject: [PATCH] ARC: Change ld.as instruction to regular ld.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471334135-21801-1-git-send-email-liavr@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Liav Rehana <liavr@mellanox.com>

The instruction ld.as takes as operands a base address and an offset,
and doesn't access the sum of these two, but the sum of the base
address and a shifted version of the offset.
This isn't what we want in that case, since it causes a bug during
the push and pop of r25, since his actual offset is given during
resume_user_mode_begin.
Thus, the use of ld solves this problem.

Signed-off-by: Liav Rehana <liavr at mellanox.com>
---
 arch/arc/include/asm/entry.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/entry.h b/arch/arc/include/asm/entry.h
index 337ab6d..9d8f85d 100644
--- a/arch/arc/include/asm/entry.h
+++ b/arch/arc/include/asm/entry.h
@@ -138,7 +138,7 @@
 
 #ifdef CONFIG_ARC_CURR_IN_REG
 	; Retrieve orig r25 and save it with rest of callee_regs
-	ld.as   r12, [r12, PT_user_r25]
+	ld	r12, [r12, PT_user_r25]
 	PUSH	r12
 #else
 	PUSH	r25
@@ -194,7 +194,7 @@
 
 	; SP is back to start of pt_regs
 #ifdef CONFIG_ARC_CURR_IN_REG
-	st.as   r12, [sp, PT_user_r25]
+	st	r12, [sp, PT_user_r25]
 #endif
 .endm
 
-- 
1.7.1
