From: liavr@mellanox.com (Liav Rehana)
Date: Wed, 17 Aug 2016 09:23:57 +0300
Subject: [PATCH] ARC: Change ld.as instruction to regular ld.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471415037-14544-1-git-send-email-liavr@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Liav Rehana <liavr@mellanox.com>

User mode callee regs are explicitly collected before signal delivery
or breakpoint trap. r25 is special for kernel as it serves as task
pointer, so user mode value is clobbered very early. It is saved in
pt_regs where generally only scratch (caller saved) res are saved.
The code to access the corresponding pt_regs location had a subtle bug
as it was using load/store with scaling of offset, whereas the offset
was already byte wise correct. So fix this by replacing LD.AS with a
standard LD

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
