From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 14 Sep 2016 20:40:38 +0300
Subject: [PATCH] dmaengine: dmatest: Restore "memcpy" as default mode
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473874838-13744-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Commit 0d4cb44da6ca0e8 ("dmaengine: dmatest: Add support for
scatter-gather DMA mode") changes default "dmatest" behavior by
changing default mode from "memcpy" to "scatter-gather".
Now "memcpy" gets back as default mode.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/dma/dmatest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 53e9728..cf76fc6 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -56,10 +56,10 @@ module_param(sg_buffers, uint, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(sg_buffers,
 		"Number of scatter gather buffers (default: 1)");
 
-static unsigned int dmatest = 1;
+static unsigned int dmatest;
 module_param(dmatest, uint, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(dmatest,
-		"dmatest 0-memcpy 1-slave_sg (default: 1)");
+		"dmatest 0-memcpy 1-slave_sg (default: 0)");
 
 static unsigned int xor_sources = 3;
 module_param(xor_sources, uint, S_IRUGO | S_IWUSR);
-- 
2.5.5
