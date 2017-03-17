From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 17 Mar 2017 16:00:37 +0300
Subject: [PATCH] arc: Keep D$ enabled to work-around incomplete SLC flushing
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1489755637-19464-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As reported in STAR 9001165532 if D$ is disabled SLC is not flushed
correctly which leads to loses of some data that were set before the flush.
That causes unexpected behavior after the flush.

For now just keep D$ enabled, only flush-invalidate it before IOC setup.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/mm/cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index d408fa21a07c..e0e83543e777 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -997,8 +997,8 @@ noinline void __init arc_ioc_setup(void)
 {
 	unsigned int ap_sz;
 
-	/* Flush + invalidate + disable L1 dcache */
-	__dc_disable();
+	/* Flush + invalidate L1 dcache */
+	__dc_entire_op(OP_FLUSH_N_INV);
 
 	/* Flush + invalidate SLC */
 	if (read_aux_reg(ARC_REG_SLC_BCR))
-- 
2.7.4
