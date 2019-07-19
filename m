From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 19 Jul 2019 21:46:00 +0300
Subject: [PATCH] ARC: fix typo in setup_dma_ops log message
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190719184600.23188-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/mm/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 0bf1468c35a3..e9cd0a1733bf 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -158,6 +158,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	if (is_isa_arcv2() && ioc_enable && coherent)
 		dev->dma_coherent = true;
 
-	dev_info(dev, "use %sncoherent DMA ops\n",
+	dev_info(dev, "use %scoherent DMA ops\n",
 		 dev->dma_coherent ? "" : "non");
 }
-- 
2.21.0
