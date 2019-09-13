From: christophe.leroy@c-s.fr (Christophe Leroy)
Date: Fri, 13 Sep 2019 06:23:49 +0000 (UTC)
Subject: [PATCH] mm/pgtable/debug: Fix test validating architecture page table
 helpers
In-Reply-To: <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
To: linux-snps-arc@lists.infradead.org

Fix build failure on powerpc.

Fix preemption imbalance.

Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
---
 mm/arch_pgtable_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
index 8b4a92756ad8..f2b3c9ec35fa 100644
--- a/mm/arch_pgtable_test.c
+++ b/mm/arch_pgtable_test.c
@@ -24,6 +24,7 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 #include <linux/sched/mm.h>
+#include <linux/highmem.h>
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
 
@@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
 	p4d_clear_tests(p4dp);
 	pgd_clear_tests(mm, pgdp);
 
+	pte_unmap(ptep);
+
 	pmd_populate_tests(mm, pmdp, saved_ptep);
 	pud_populate_tests(mm, pudp, saved_pmdp);
 	p4d_populate_tests(mm, p4dp, saved_pudp);
-- 
2.13.3
