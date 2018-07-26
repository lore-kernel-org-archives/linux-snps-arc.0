From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 26 Jul 2018 15:05:37 +0300
Subject: [PATCH] NET: stmmac: align DMA stuff to largest cache line length
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180726120537.4664-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As for today STMMAC_ALIGN macro (which is used to align DMA stuff)
relies on L1 line length (L1_CACHE_BYTES).
This isn't correct in case of system with several cache levels
which might have L1 cache line length smaller than L2 line. This
can lead to sharing one cache line between DMA buffer and other
data, so we can lose this data while invalidate DMA buffer before
DMA transaction.

Fix that by using SMP_CACHE_BYTES instead of L1_CACHE_BYTES for
aligning.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 60f59abab009..ef6a8d39db2f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -53,7 +53,7 @@
 #include "dwmac1000.h"
 #include "hwif.h"
 
-#define STMMAC_ALIGN(x)	L1_CACHE_ALIGN(x)
+#define	STMMAC_ALIGN(x)		__ALIGN_KERNEL(x, SMP_CACHE_BYTES)
 #define	TSO_MAX_BUFF_SIZE	(SZ_16K - 1)
 
 /* Module parameters */
-- 
2.14.4
