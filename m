From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon,  8 Apr 2019 16:04:38 +0300
Subject: [PATCH] ARC: memset: fix build with L1_CACHE_SHIFT != 6
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190408130438.11466-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In case of 'L1_CACHE_SHIFT != 6' we define dummy assembly macroses
PREALLOC_INSTR and PREFETCHW_INSTR without arguments. However
we pass arguments to them in code which cause build errors.
Fix that.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/lib/memset-archs.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index f230bb7092fd..b3373f5c88e0 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -30,10 +30,10 @@
 
 #else
 
-.macro PREALLOC_INSTR
+.macro PREALLOC_INSTR	reg, off
 .endm
 
-.macro PREFETCHW_INSTR
+.macro PREFETCHW_INSTR	reg, off
 .endm
 
 #endif
-- 
2.14.5
