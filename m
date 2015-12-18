From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 18 Dec 2015 22:28:51 +0300
Subject: [PATCH] ARC: fix building for MMU v2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450466931-13355-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC700 cores with MMU v2 don't have IC_PTAG AUX register and so we only
define ARC_REG_IC_PTAG for MMU versions >= 3.

But current implementation of cache_line_loop_vX() routines assumes
availability of all of them (v2, v3 and v4) simultaneously.

And given undefined ARC_REG_IC_PTAG if CONFIG_MMU_VER=2 we're seeing
compilation problem:
---------------------------------->8-------------------------------
  CC      arch/arc/mm/cache.o
arch/arc/mm/cache.c: In function '__cache_line_loop_v3':
arch/arc/mm/cache.c:270:13: error: 'ARC_REG_IC_PTAG' undeclared (first use in this function)
   aux_tag = ARC_REG_IC_PTAG;
             ^
arch/arc/mm/cache.c:270:13: note: each undeclared identifier is reported only once for each function it appears in
scripts/Makefile.build:258: recipe for target 'arch/arc/mm/cache.o' failed
---------------------------------->8-------------------------------

The simples fix is to have ARC_REG_IC_PTAG defined regardless MMU
version being used.

We don't use it in cache_line_loop_v2() anyways so who cares.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/cache.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index abf06e8..210ef3e 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -62,9 +62,7 @@ extern int ioc_exists;
 #define ARC_REG_IC_IVIC		0x10
 #define ARC_REG_IC_CTRL		0x11
 #define ARC_REG_IC_IVIL		0x19
-#if defined(CONFIG_ARC_MMU_V3) || defined(CONFIG_ARC_MMU_V4)
 #define ARC_REG_IC_PTAG		0x1E
-#endif
 #define ARC_REG_IC_PTAG_HI	0x1F
 
 /* Bit val in IC_CTRL */
-- 
2.4.3
