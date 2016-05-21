From: andrea.gelmini@gelma.net (Andrea Gelmini)
Date: Sat, 21 May 2016 13:46:14 +0200
Subject: [PATCH 0071/1529] Fix typo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160521114614.2765-1-andrea.gelmini@gelma.net>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Andrea Gelmini <andrea.gelmini at gelma.net>
---
 arch/arc/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
index 9913804..89fdd1b 100644
--- a/arch/arc/include/asm/smp.h
+++ b/arch/arc/include/asm/smp.h
@@ -86,7 +86,7 @@ static inline const char *arc_platform_smp_cpuinfo(void)
  * (1) These insn were introduced only in 4.10 release. So for older released
  *	support needed.
  *
- * (2) In a SMP setup, the LLOCK/SCOND atomiticity across CPUs needs to be
+ * (2) In a SMP setup, the LLOCK/SCOND atomicity across CPUs needs to be
  *	gaurantted by the platform (not something which core handles).
  *	Assuming a platform won't, SMP Linux needs to use spinlocks + local IRQ
  *	disabling for atomicity.
-- 
2.8.2.534.g1f66975
