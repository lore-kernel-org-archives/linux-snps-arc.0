From: noamc@ezchip.com (Noam Camus)
Date: Sat, 7 Nov 2015 12:52:32 +0200
Subject: [PATCH v2 14/19] ARC: [plat-eznps] Use dedicated SMP barriers
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446893557-29748-15-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

NPS device got 256 cores and each got 16 HW threads (SMT).
We use EZchip dedicated ISA to trigger HW scheduler of the
core that current HW thread belongs to.
This scheduling makes sure that data beyond barrier is available
to all HW threads in core and by that to all in device (4K).

Signed-off-by: Noam Camus <noamc at ezchip.com>
Cc: Peter Zijlstra <peterz at infradead.org>
---
 arch/arc/include/asm/barrier.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/barrier.h b/arch/arc/include/asm/barrier.h
index a720998..a559732 100644
--- a/arch/arc/include/asm/barrier.h
+++ b/arch/arc/include/asm/barrier.h
@@ -34,6 +34,7 @@
 
 #ifdef CONFIG_ISA_ARCOMPACT
 
+#ifndef CONFIG_ARC_PLAT_EZNPS
 /*
  * ARCompact based cores (ARC700) only have SYNC instruction which is super
  * heavy weight as it flushes the pipeline as well.
@@ -41,6 +42,13 @@
  */
 
 #define mb()	asm volatile("sync\n" : : : "memory")
+#else /* CONFIG_ARC_PLAT_EZNPS */
+
+#include <plat/ctop.h>
+#define mb()	asm volatile (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
+#define rmb()	asm volatile (".word %0" : : "i"(CTOP_INST_SCHD_RD) : "memory")
+#endif /* CONFIG_ARC_PLAT_EZNPS */
+
 #endif
 
 #include <asm-generic/barrier.h>
-- 
1.7.1
