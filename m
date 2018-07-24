From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 24 Jul 2018 13:10:01 +0300
Subject: [PATCH 4/4] ARC: IOC: panic if both IOC and ZONE_HIGHMEM enabled
In-Reply-To: <20180724101001.31965-1-Eugeniy.Paltsev@synopsys.com>
References: <20180724101001.31965-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180724101001.31965-5-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/mm/cache.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 34935ce38631..e0b3484641c3 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1143,6 +1143,19 @@ noinline void __init arc_ioc_setup(void)
 {
 	unsigned int ioc_base, mem_sz;
 
+	/*
+	 * As for today we don't support both IOC and ZONE_HIGHMEM enabled
+	 * simultaneously. This happens because as of today IOC aperture covers
+	 * only ZONE_NORMAL (low mem) and any dma transactions outside this
+	 * region won't be HW coherent.
+	 * If we want to use both IOC and ZONE_HIGHMEM we can use
+	 * bounce_buffer to handle dma transactions to HIGHMEM.
+	 * Also it is possible to modify dma_direct cache ops or increase IOC
+	 * aperture size if we are planning to use HIGHMEM without PAE.
+	 */
+	if (IS_ENABLED(CONFIG_HIGHMEM))
+		panic("IOC and HIGHMEM can't be used simultaneously");
+
 	/* Flush + invalidate + disable L1 dcache */
 	__dc_disable();
 
-- 
2.14.4
