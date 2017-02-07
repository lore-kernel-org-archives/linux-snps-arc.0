From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 7 Feb 2017 09:44:58 -0800
Subject: [PATCH] ARC: [arcompact] brown paper bag bug in unaligned access
 delay slot fixup
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486489498-9221-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Reported-by: Jo-Philipp Wich <jo at mein.io>
Fixes: 9aed02feae57bf7 ("ARC: [arcompact] handle unaligned access delay slot")
Cc: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Cc: stable at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/unaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index 91ebe382147f..5f69c3bd59bb 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -243,7 +243,7 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 
 	/* clear any remanants of delay slot */
 	if (delay_mode(regs)) {
-		regs->ret = regs->bta ~1U;
+		regs->ret = regs->bta & ~1U;
 		regs->status32 &= ~STATUS_DE_MASK;
 	} else {
 		regs->ret += state.instr_len;
-- 
2.7.4
