From: jslaby@suse.cz (Jiri Slaby)
Date: Mon,  6 Mar 2017 10:11:02 +0100
Subject: [PATCH 3.12 038/113] ARC: [arcompact] brown paper bag bug in
 unaligned access delay slot fixup
In-Reply-To: <f2eabff3e55665a6e2cc3819ad3f407c151b8a7d.1488791430.git.jslaby@suse.cz>
References: <f2eabff3e55665a6e2cc3819ad3f407c151b8a7d.1488791430.git.jslaby@suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ad432fe7be0442b4d3479b93cee5c15a0d888318.1488791430.git.jslaby@suse.cz>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

3.12-stable review patch.  If anyone has any objections, please let me know.

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
2.12.0
