From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  7 Apr 2017 23:08:04 +0300
Subject: [PATCH] ARCv2: SLC: Make sure busy bit is set properly on SLC flushing
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1491595684-23700-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As reported in STAR 9001165532, an SLC control reg read (for checking
busy state) right after SLC invalidate command may incorrectly return
NOT busy causing software to NOT spin-wait while operation is underway.
(and for some reason this only happens if L1 cache is also disabled - as
required by IOC programming model)

Suggested workaround is to do an additional Control Reg read, which
ensures the 2nd read gets the right status.

Same fix made in Linux kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c70c473396cbdec1168a6eff60e13029c0916854

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/lib/cache.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arc/lib/cache.c b/arch/arc/lib/cache.c
index b6ec83112cd8..f1436bf19992 100644
--- a/arch/arc/lib/cache.c
+++ b/arch/arc/lib/cache.c
@@ -59,10 +59,16 @@ static unsigned int __before_slc_op(const int op)
 
 static void __after_slc_op(const int op, unsigned int reg)
 {
-	if (op & OP_FLUSH)	/* flush / flush-n-inv both wait */
+	if (op & OP_FLUSH) {	/* flush / flush-n-inv both wait */
+		/*
+		 * Make sure "busy" bit reports correct status,
+		 * see STAR 9001165532
+		 */
+		read_aux_reg(ARC_AUX_SLC_CTRL);
 		while (read_aux_reg(ARC_AUX_SLC_CTRL) &
 		       DC_CTRL_FLUSH_STATUS)
 			;
+	}
 
 	/* Switch back to default Invalidate mode */
 	if (op == OP_INV)
-- 
2.7.4
