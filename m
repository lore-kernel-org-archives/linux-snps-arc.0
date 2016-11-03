From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 14:31:39 -0700
Subject: [PATCH v2 08/10] ARC: move mcip.h into include/soc and adjust the
 includes
In-Reply-To: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478208701-30923-9-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Also remove the dependency on ARCv2, to increase compile coverage for
!ARCV2 builds

Acked-by: Daniel Lezcano <daniel.lezcnao at linaro.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/mcip.c                           | 2 +-
 arch/arc/kernel/time.c                           | 2 +-
 arch/arc/plat-axs10x/axs10x.c                    | 2 +-
 {arch/arc/include/asm => include/soc/arc}/mcip.h | 8 ++------
 4 files changed, 5 insertions(+), 9 deletions(-)
 rename {arch/arc/include/asm => include/soc/arc}/mcip.h (96%)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index c424d5abc318..0651e0a2e8b1 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -11,8 +11,8 @@
 #include <linux/smp.h>
 #include <linux/irq.h>
 #include <linux/spinlock.h>
+#include <soc/arc/mcip.h>
 #include <asm/irqflags-arcv2.h>
-#include <asm/mcip.h>
 #include <asm/setup.h>
 
 static DEFINE_RAW_SPINLOCK(mcip_lock);
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 9bb7e3105ca9..f0b6e6bc1e36 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -40,7 +40,7 @@
 #include <asm/irq.h>
 #include <asm/arcregs.h>
 
-#include <asm/mcip.h>
+#include <soc/arc/mcip.h>
 
 /* Timer related Aux registers */
 #define ARC_REG_TIMER0_LIMIT	0x23	/* timer 0 limit */
diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 86548701023c..38ff349d7f2a 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -21,7 +21,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/io.h>
 #include <asm/mach_desc.h>
-#include <asm/mcip.h>
+#include <soc/arc/mcip.h>
 
 #define AXS_MB_CGU		0xE0010000
 #define AXS_MB_CREG		0xE0011000
diff --git a/arch/arc/include/asm/mcip.h b/include/soc/arc/mcip.h
similarity index 96%
rename from arch/arc/include/asm/mcip.h
rename to include/soc/arc/mcip.h
index fc28d0944801..6902c2a8bd23 100644
--- a/arch/arc/include/asm/mcip.h
+++ b/include/soc/arc/mcip.h
@@ -8,10 +8,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef __ASM_MCIP_H
-#define __ASM_MCIP_H
-
-#ifdef CONFIG_ISA_ARCV2
+#ifndef __SOC_ARC_MCIP_H
+#define __SOC_ARC_MCIP_H
 
 #include <soc/arc/aux.h>
 
@@ -103,5 +101,3 @@ static inline void __mcip_cmd_data(unsigned int cmd, unsigned int param,
 }
 
 #endif
-
-#endif
-- 
2.7.4
