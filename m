From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:45:46 +0200
Subject: [PATCH 0067/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114546.2552-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/entry-compact.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index e0e1faf..14c310f 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -76,8 +76,8 @@
 	 * We need to be a bit more cautious here. What if a kernel bug in
 	 * L1 ISR, caused SP to go whaco (some small value which looks like
 	 * USER stk) and then we take L2 ISR.
-	 * Above brlo alone would treat it as a valid L1-L2 sceanrio
-	 * instead of shouting alound
+	 * Above brlo alone would treat it as a valid L1-L2 scenario
+	 * instead of shouting around
 	 * The only feasible way is to make sure this L2 happened in
 	 * L1 prelogue ONLY i.e. ilink2 is less than a pre-set marker in
 	 * L1 ISR before it switches stack
-- 
2.8.2.534.g1f66975
