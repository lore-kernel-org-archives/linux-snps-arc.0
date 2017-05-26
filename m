From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 26 May 2017 18:38:16 +0300
Subject: [PATCH] arc: Set IO-coherency aperture base to LINUX_LINK_BASE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495813096-22668-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Most of the time we indeed use the one and only LINUX_LINK_BASE
set to 0x8000_0000. But there might be good reasons to move
the kernel to another location like 0x9z etc.

And we want IOC aperture to cover entire area used by the kernel,
so let's make its base matching link base.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/mm/cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index ba5931113e5f..54b7cc042e04 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1007,8 +1007,8 @@ noinline void __init arc_ioc_setup(void)
 	if (read_aux_reg(ARC_REG_SLC_BCR))
 		slc_entire_op(OP_FLUSH_N_INV);
 
-	/* IOC Aperture start: TDB: handle non default CONFIG_LINUX_LINK_BASE */
-	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, 0x80000);
+	/* IOC Aperture start */
+	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, CONFIG_LINUX_LINK_BASE >> 12);
 
 	/*
 	 * IOC Aperture size:
-- 
2.7.4
