From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 10 Aug 2016 10:19:34 -0700
Subject: [PATCH] ARC: Elide redundant setup of DMA callbacks
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1470849574-11615-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For resources shared by all cores such as SLC and IOC, only the master
core needs to do any setups / enabling / disabling etc.

Cc: <stable at vger.kernel.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/cache.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 5a294b2c3cb3..0b10efe3a6a7 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -921,6 +921,15 @@ void arc_cache_init(void)
 
 	printk(arc_cache_mumbojumbo(0, str, sizeof(str)));
 
+	/*
+	 * Only master CPU needs to execute rest of function:
+	 *  - Assume SMP so all cores will have same cache config so
+	 *    any geomtry checks will be same for all
+	 *  - IOC setup / dma callbacks only need to be setup once
+	 */
+	if (cpu)
+		return;
+
 	if (IS_ENABLED(CONFIG_ARC_HAS_ICACHE)) {
 		struct cpuinfo_arc_cache *ic = &cpuinfo_arc700[cpu].icache;
 
-- 
2.7.4
