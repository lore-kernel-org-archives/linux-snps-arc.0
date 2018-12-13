From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 13 Dec 2018 18:42:57 +0300
Subject: [PATCH] ARC: fix __ffs return value to avoid build warnings
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181213154257.23033-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Change __ffs return value from 'int' to 'unsigned long' as it
is done in other implementations (like asm-generic, x86, etc...)
to avoid build-time warnings in places where type is strictly
checked.

As __ffs may return values in [0-31] interval changing return
type to unsigned is valid.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
index 8da87feec59a..99e6d8948f4a 100644
--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -340,7 +340,7 @@ static inline __attribute__ ((const)) int __fls(unsigned long x)
 /*
  * __ffs: Similar to ffs, but zero based (0-31)
  */
-static inline __attribute__ ((const)) int __ffs(unsigned long word)
+static inline __attribute__ ((const)) unsigned long __ffs(unsigned long word)
 {
 	if (!word)
 		return word;
@@ -400,9 +400,9 @@ static inline __attribute__ ((const)) int ffs(unsigned long x)
 /*
  * __ffs: Similar to ffs, but zero based (0-31)
  */
-static inline __attribute__ ((const)) int __ffs(unsigned long x)
+static inline __attribute__ ((const)) unsigned long __ffs(unsigned long x)
 {
-	int n;
+	unsigned long n;
 
 	asm volatile(
 	"	ffs.f	%0, %1		\n"  /* 0:31; 31(Z) if src 0 */
-- 
2.14.5
