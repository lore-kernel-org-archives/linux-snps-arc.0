From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:45:59 +0200
Subject: [PATCH 0069/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114559.2665-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 034bbdc..858f98e 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -47,7 +47,7 @@
  * Page Tables are purely for Linux VM's consumption and the bits below are
  * suited to that (uniqueness). Hence some are not implemented in the TLB and
  * some have different value in TLB.
- * e.g. MMU v2: K_READ bit is 8 and so is GLOBAL (possible becoz they live in
+ * e.g. MMU v2: K_READ bit is 8 and so is GLOBAL (possible because they live in
  *      seperate PD0 and PD1, which combined forms a translation entry)
  *      while for PTE perspective, they are 8 and 9 respectively
  * with MMU v3: Most bits (except SHARED) represent the exact hardware pos
-- 
2.8.2.534.g1f66975
