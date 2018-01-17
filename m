From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 17 Jan 2018 16:39:17 +0300
Subject: [PATCH v2] ARC: ARCv2: CACHE: fix slc_entire_op: flush only instead
 of flush-n-inv
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180117133917.30649-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As for today slc_entire_op with OP_FLUSH command flush and invalidate
SLC entry instead of flush only. Fix that.

NOTE:
As for today we use slc_entire_op only with OP_FLUSH_N_INV command,
so it is kinda preventiv fix.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
V1 patch is for u-boot (with u-boot AUX registers name), mistakenly sent it
to linux.

 arch/arc/mm/cache.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 55c3de2..5cb647c 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -787,7 +787,10 @@ noinline static void slc_entire_op(const int op)
 
 	write_aux_reg(r, ctrl);
 
-	write_aux_reg(ARC_REG_SLC_INVALIDATE, 1);
+	if (op & OP_INV)	/* Inv or flush-n-inv use same cmd reg */
+		write_aux_reg(ARC_REG_SLC_INVALIDATE, 0x1);
+	else
+		write_aux_reg(ARC_REG_SLC_FLUSH, 0x1);
 
 	/* Make sure "busy" bit reports correct stataus, see STAR 9001165532 */
 	read_aux_reg(r);
-- 
2.9.3
