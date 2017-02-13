From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon, 13 Feb 2017 05:04:46 -0800
Subject: [PATCH 4.4 01/20] ARC: [arcompact] brown paper bag bug in unaligned
 access delay slot fixup
In-Reply-To: <20170213130403.531813333@linuxfoundation.org>
References: <20170213130403.531813333@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170213130403.588875111@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

commit a524c218bc94c705886a0e0fedeee45d1931da32 upstream.

Reported-by: Jo-Philipp Wich <jo at mein.io>
Fixes: 9aed02feae57bf7 ("ARC: [arcompact] handle unaligned access delay slot")
Cc: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Linus Torvalds <torvalds at linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 arch/arc/kernel/unaligned.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -243,7 +243,7 @@ int misaligned_fixup(unsigned long addre
 
 	/* clear any remanants of delay slot */
 	if (delay_mode(regs)) {
-		regs->ret = regs->bta ~1U;
+		regs->ret = regs->bta & ~1U;
 		regs->status32 &= ~STATUS_DE_MASK;
 	} else {
 		regs->ret += state.instr_len;
