From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  7 Jul 2017 12:25:14 +0300
Subject: [PATCH] ARCv2: SLC: Make sure busy bit is set properly for region ops
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499419514-13171-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

c70c473396cb "ARCv2: SLC: Make sure busy bit is set properly on SLC flushing"
fixes problem for entire SLC operation where the problem was initially
caught. But given a nature of the issue it is perfectly possible for
busy bit to be read incorrectly even when region operation was started.

So extending initial fix for regional operation as well.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: stable at vger.kernel.org
---
 arch/arc/mm/cache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index bdb5227241cf..08427d572850 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -697,6 +697,8 @@ noinline void slc_op(phys_addr_t paddr, unsigned long sz, const int op)
 	write_aux_reg(ARC_REG_SLC_RGN_END, (paddr + sz + l2_line_sz - 1));
 	write_aux_reg(ARC_REG_SLC_RGN_START, paddr);
 
+	/* Make sure "busy" bit reports correct stataus, see STAR 9001165532 */
+	read_aux_reg(ARC_REG_SLC_CTRL);
 	while (read_aux_reg(ARC_REG_SLC_CTRL) & SLC_CTRL_BUSY);
 
 	spin_unlock_irqrestore(&lock, flags);
-- 
2.7.5
