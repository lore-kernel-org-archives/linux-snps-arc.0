From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Jan 2019 18:16:48 +0300
Subject: [PATCH 1/2] ARCv2: LIB: memeset: fix doing prefetchw outside of buffer
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190114151649.32726-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Current ARCv2 memeset implementation may call 'prefetchw'
instruction for address which lies outside of memset area.
So we got one modified (dirty) cache line outside of memset
area. This may lead to data corruption if this area is used
for DMA IO.

Another issue is that current ARCv2 memeset implementation
may call 'prealloc' instruction for L1 cache line which
doesn't fully belongs to memeset area in case of 128B L1 D$
line length. That leads to data corruption.

Fix prefetchw/prealloc instructions using in case of 64B L1 data
cache line (default case) and don't use prefetch* instructions
for other possible L1 data cache line lengths (32B and 128B).

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/lib/memset-archs.S | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index 62ad4bcb841a..c7717832336f 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -7,11 +7,32 @@
  */
 
 #include <linux/linkage.h>
+#include <asm/cache.h>
 
 #undef PREALLOC_NOT_AVAIL
 
+/*
+ * The memset implementation below is optimized to use prefetchw and prealloc
+ * instruction in case of CPU with 64B L1 data cache line (L1_CACHE_SHIFT == 6)
+ * If you want to implement optimized memset for other possible L1 data cache
+ * line lengths (32B and 128B) you should rewrite code carefully checking
+ * we don't call any prefetchw/prealloc instruction for L1 cache lines which
+ * don't belongs to memset area.
+ */
+#if L1_CACHE_SHIFT!=6
+# define PREALLOC_INSTR(...)
+# define PREFETCHW_INSTR(...)
+#else  /* L1_CACHE_SHIFT!=6 */
+# define PREFETCHW_INSTR(...)	prefetchw __VA_ARGS__
+# ifdef PREALLOC_NOT_AVAIL
+#  define PREALLOC_INSTR(...)	prefetchw __VA_ARGS__
+# else
+#  define PREALLOC_INSTR(...)	prealloc __VA_ARGS__
+# endif
+#endif /* L1_CACHE_SHIFT!=6 */
+
 ENTRY_CFI(memset)
-	prefetchw [r0]		; Prefetch the write location
+	PREFETCHW_INSTR([r0])	; Prefetch the first write location
 	mov.f	0, r2
 ;;; if size is zero
 	jz.d	[blink]
@@ -48,11 +69,7 @@ ENTRY_CFI(memset)
 
 	lpnz	@.Lset64bytes
 	;; LOOP START
-#ifdef PREALLOC_NOT_AVAIL
-	prefetchw [r3, 64]	;Prefetch the next write location
-#else
-	prealloc  [r3, 64]
-#endif
+	PREALLOC_INSTR([r3, 64]) ;Prefetch the next write location
 #ifdef CONFIG_ARC_HAS_LL64
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
@@ -85,7 +102,6 @@ ENTRY_CFI(memset)
 	lsr.f	lp_count, r2, 5 ;Last remaining  max 124 bytes
 	lpnz	.Lset32bytes
 	;; LOOP START
-	prefetchw   [r3, 32]	;Prefetch the next write location
 #ifdef CONFIG_ARC_HAS_LL64
 	std.ab	r4, [r3, 8]
 	std.ab	r4, [r3, 8]
-- 
2.14.5
