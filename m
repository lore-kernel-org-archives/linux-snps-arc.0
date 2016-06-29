From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 29 Jun 2016 20:43:58 +0300
Subject: [PATCH] ARC: typo fix in mm/ioremap.c
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467222238-26038-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 49b8abd..f52b7db6 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -49,7 +49,7 @@ EXPORT_SYMBOL(ioremap);
 /*
  * ioremap with access flags
  * Cache semantics wise it is same as ioremap - "forced" uncached.
- * However unline vanilla ioremap which bypasses ARC MMU for addresses in
+ * However unlike vanilla ioremap which bypasses ARC MMU for addresses in
  * ARC hardware uncached region, this one still goes thru the MMU as caller
  * might need finer access control (R/W/X)
  */
-- 
2.5.5
