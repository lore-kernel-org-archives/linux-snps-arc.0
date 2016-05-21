From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:58 +0200
Subject: [PATCH 0077/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114658.3240-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 004b7f0..6cb3736 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -34,7 +34,7 @@
  *  -ViXS were still seeing crashes when using insmod to load drivers.
  *   It turned out that the code to change Execute permssions for TLB entries
  *   of user was not guarded for interrupts (mod_tlb_permission)
- *   This was cauing TLB entries to be overwritten on unrelated indexes
+ *   This was causing TLB entries to be overwritten on unrelated indexes
  *
  * Vineetg: July 15th 2008: Bug #94183
  *  -Exception happens in Delay slot of a JMP, and before user space resumes,
-- 
2.8.2.534.g1f66975
