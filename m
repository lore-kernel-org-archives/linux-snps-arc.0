From: shea@shealevy.com (Shea Levy)
Date: Wed, 28 Mar 2018 16:36:47 -0400
Subject: [PATCH v4 04/16] arc: Use generic free_initrd_mem.
In-Reply-To: <20180328203659.18692-1-shea@shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180328203659.18692-5-shea@shealevy.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Shea Levy <shea at shealevy.com>
---
 arch/arc/mm/init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index ba145065c579..7bcf23ab1756 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -229,10 +229,3 @@ void __ref free_initmem(void)
 {
 	free_initmem_default(-1);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void __init free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2
