From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 May 2019 12:32:06 -0700
Subject: [PATCH 3/5] ARCv2: entry: avoid a branch
In-Reply-To: <1558121528-30184-1-git-send-email-vgupta@synopsys.com>
References: <1558121528-30184-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558121528-30184-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/entry-arcv2.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 3209a6762960..beaf655666cb 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -100,12 +100,11 @@
 	; 2. Upon entry SP is always saved (for any inspection, unwinding etc),
 	;    but on return, restored only if U mode
 
+	lr	r9, [AUX_USER_SP]			; U mode SP
+
 	mov.nz	r9, sp
 	add.nz	r9, r9, SZ_PT_REGS - PT_sp - 4		; K mode SP
-	bnz	1f
 
-	lr	r9, [AUX_USER_SP]			; U mode SP
-1:
 	PUSH	r9					; SP (pt_regs->sp)
 
 	PUSH	fp
-- 
2.7.4
