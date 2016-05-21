From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:45:52 +0200
Subject: [PATCH 0068/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114552.2608-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/mmu_context.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
index 1fd467e..b0b87f2 100644
--- a/arch/arc/include/asm/mmu_context.h
+++ b/arch/arc/include/asm/mmu_context.h
@@ -83,7 +83,7 @@ static inline void get_new_mmu_context(struct mm_struct *mm)
 		local_flush_tlb_all();
 
 		/*
-		 * Above checke for rollover of 8 bit ASID in 32 bit container.
+		 * Above check for rollover of 8 bit ASID in 32 bit container.
 		 * If the container itself wrapped around, set it to a non zero
 		 * "generation" to distinguish from no context
 		 */
-- 
2.8.2.534.g1f66975
