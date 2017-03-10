From: ben@decadent.org.uk (Ben Hutchings)
Date: Fri, 10 Mar 2017 11:46:23 +0000
Subject: [PATCH 3.16 282/370] ARC: [arcompact] brown paper bag bug in
 unaligned access delay slot fixup
In-Reply-To: <lsq.1489146380.780052105@decadent.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <lsq.1489146383.162481160@decadent.org.uk>
To: linux-snps-arc@lists.infradead.org

3.16.42-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

commit a524c218bc94c705886a0e0fedeee45d1931da32 upstream.

Reported-by: Jo-Philipp Wich <jo at mein.io>
Fixes: 9aed02feae57bf7 ("ARC: [arcompact] handle unaligned access delay slot")
Cc: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Linus Torvalds <torvalds at linux-foundation.org>
Signed-off-by: Ben Hutchings <ben at decadent.org.uk>
---
 arch/arc/kernel/unaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -242,7 +242,7 @@ int misaligned_fixup(unsigned long addre
 
 	/* clear any remanants of delay slot */
 	if (delay_mode(regs)) {
-		regs->ret = regs->bta ~1U;
+		regs->ret = regs->bta & ~1U;
 		regs->status32 &= ~STATUS_DE_MASK;
 	} else {
 		regs->ret += state.instr_len;
