From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 30 Jul 2018 19:26:35 +0300
Subject: [PATCH v2 3/4] ARC: IOC: panic if both IOC and ZONE_HIGHMEM enabled
In-Reply-To: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180730162636.3556-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
Changes v1->v2:
 * None.

 arch/arc/mm/cache.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index dac12afbb93a..389602cf1594 100644
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
