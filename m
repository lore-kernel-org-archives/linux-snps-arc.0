From: jslaby@suse.cz (Jiri Slaby)
Date: Thu, 16 Feb 2017 11:32:37 +0100
Subject: [patch added to 3.12-stable] ARC: [arcompact] brown paper bag bug in
 unaligned access delay slot fixup
In-Reply-To: <20170216103248.19251-1-jslaby@suse.cz>
References: <20170216103248.19251-1-jslaby@suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170216103248.19251-61-jslaby@suse.cz>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

This patch has been added to the 3.12 stable tree. If you have any
objections, please let us know.

===============

commit a524c218bc94c705886a0e0fedeee45d1931da32 upstream.

Reported-by: Jo-Philipp Wich <jo at mein.io>
Fixes: 9aed02feae57bf7 ("ARC: [arcompact] handle unaligned access delay slot")
Cc: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Linus Torvalds <torvalds at linux-foundation.org>
Signed-off-by: Jiri Slaby <jslaby at suse.cz>
---
 arch/arc/kernel/unaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index dbde997d16c6..2cc82b6ec23d 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -242,7 +242,7 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 
 	/* clear any remanants of delay slot */
 	if (delay_mode(regs)) {
-		regs->ret = regs->bta ~1U;
+		regs->ret = regs->bta & ~1U;
 		regs->status32 &= ~STATUS_DE_MASK;
 	} else {
 		regs->ret += state.instr_len;
-- 
2.11.1
