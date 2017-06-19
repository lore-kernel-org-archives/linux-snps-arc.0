From: w@1wt.eu (Willy Tarreau)
Date: Mon, 19 Jun 2017 20:30:40 +0200
Subject: [PATCH 3.10 141/268] ARC: [arcompact] brown paper bag bug in
 unaligned access delay slot fixup
In-Reply-To: <1497897167-14556-1-git-send-email-w@1wt.eu>
References: <1497897167-14556-1-git-send-email-w@1wt.eu>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497897167-14556-142-git-send-email-w@1wt.eu>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

commit a524c218bc94c705886a0e0fedeee45d1931da32 upstream.

Reported-by: Jo-Philipp Wich <jo at mein.io>
Fixes: 9aed02feae57bf7 ("ARC: [arcompact] handle unaligned access delay slot")
Cc: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Linus Torvalds <torvalds at linux-foundation.org>
Signed-off-by: Willy Tarreau <w at 1wt.eu>
---
 arch/arc/kernel/unaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index b13b422..e6b365d 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -230,7 +230,7 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 
 	/* clear any remanants of delay slot */
 	if (delay_mode(regs)) {
-		regs->ret = regs->bta ~1U;
+		regs->ret = regs->bta & ~1U;
 		regs->status32 &= ~STATUS_DE_MASK;
 	} else {
 		regs->ret += state.instr_len;
-- 
2.8.0.rc2.1.gbe9624a
