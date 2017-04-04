From: noamca@mellanox.com (Noam Camus)
Date: Tue,  4 Apr 2017 11:00:41 +0300
Subject: [PATCH] ARC: Fix build for missing ATOMIC_INIT definition
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1491292841-14051-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Make ATOMIC_INIT available for all ARC platforms (including plat-eznps)

Signed-off-by: Noam Camus <noamca at mellanox.com>
---
 arch/arc/include/asm/atomic.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index b65930a..54b54da 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -17,10 +17,11 @@
 #include <asm/barrier.h>
 #include <asm/smp.h>
 
+#define ATOMIC_INIT(i)	{ (i) }
+
 #ifndef CONFIG_ARC_PLAT_EZNPS
 
 #define atomic_read(v)  READ_ONCE((v)->counter)
-#define ATOMIC_INIT(i)	{ (i) }
 
 #ifdef CONFIG_ARC_HAS_LLSC
 
-- 
1.7.1
