From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 16 Apr 2019 20:10:19 +0300
Subject: [PATCH 1/3] ARC: cache: declare cache-related defines via
 ARC_MAX_CACHE_SHIFT
In-Reply-To: <20190416171021.20049-1-Eugeniy.Paltsev@synopsys.com>
References: <20190416171021.20049-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190416171021.20049-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

 * Declare all cache-related defines where we need maximum cache
line size (like SMP_CACHE_BYTES, ARCH_DMA_MINALIGN, etc...) via
one common ARC_MAX_CACHE_SHIFT define.

 * Move all cache-related defines outside '#ifdef __ASSEMBLY__'
guard to make them visible from ASM code.

This is prerequisite for autodetecting cache line size in runtime.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/cache.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index 2ad77fb43639..f1642634aab0 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -9,6 +9,12 @@
 #ifndef __ARC_ASM_CACHE_H
 #define __ARC_ASM_CACHE_H
 
+/* Largest line length for either L1 or L2 is 128 bytes (2^7) */
+#define ARC_MAX_CACHE_SHIFT	7
+#define ARC_MAX_CACHE_BYTES	(1 << (ARC_MAX_CACHE_SHIFT))
+#define SMP_CACHE_BYTES		ARC_MAX_CACHE_BYTES
+#define ARCH_DMA_MINALIGN	ARC_MAX_CACHE_BYTES
+
 /* In case $$ not config, setup a dummy number for rest of kernel */
 #ifndef CONFIG_ARC_CACHE_LINE_SHIFT
 #define L1_CACHE_SHIFT		6
@@ -47,10 +53,7 @@
 	: "r"(data), "r"(ptr));		\
 })
 
-/* Largest line length for either L1 or L2 is 128 bytes */
-#define SMP_CACHE_BYTES		128
-#define cache_line_size()	SMP_CACHE_BYTES
-#define ARCH_DMA_MINALIGN	SMP_CACHE_BYTES
+#define cache_line_size()	ARC_MAX_CACHE_BYTES
 
 /*
  * Make sure slab-allocated buffers are 64-bit aligned when atomic64_t uses
-- 
2.14.5
