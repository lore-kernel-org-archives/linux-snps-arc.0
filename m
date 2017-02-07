From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  7 Feb 2017 16:19:38 +0300
Subject: [PATCH] ARC: [arcompact] fix handling of unaligned access in delay
 slot
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486473578-21205-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit 9aed02feae5 ("ARC: [arcompact] handle unaligned access delay slot
corner case") was meant to fix one corner-case of unaligned access
fixup. But for some reason real implementation has an important spello
which prevents kernel to be built with enabled
CONFIG_ARC_EMUL_UNALIGNED:
--------------------------------->8--------------------------------
arch/arc/kernel/unaligned.c: In function 'misaligned_fixup':
arch/arc/kernel/unaligned.c:246:25: error: expected ';' before '~ token
   regs->ret = regs->bta ~1U;
                         ^
--------------------------------->8--------------------------------

What needs to be done - LSB bit of regs->bta has to be cleared and now
we do exactly this with "& ~1U".

While at it fix another spello in comments.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Reported-by: John Crispin <john at phrozen.org>
Cc: Felix Fietkau <nbd at nbd.name>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Igor Guryanov <guryanov at synopsys.com>
---
 arch/arc/kernel/unaligned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index 91ebe382147f..39ee23d107cc 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -241,9 +241,9 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 	if (state.fault)
 		goto fault;
 
-	/* clear any remanants of delay slot */
+	/* clear any remnants of delay slot */
 	if (delay_mode(regs)) {
-		regs->ret = regs->bta ~1U;
+		regs->ret = regs->bta & ~1U;
 		regs->status32 &= ~STATUS_DE_MASK;
 	} else {
 		regs->ret += state.instr_len;
-- 
2.7.4
