From: noamc@ezchip.com (Noam Camus)
Date: Wed, 16 Dec 2015 03:10:29 +0200
Subject: [PATCH v4 10/19] ARC: Add clock from device tree to time_init()
In-Reply-To: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1450228238-4499-11-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

External clock source can be used if included by one of
DTS file of a chosen platform.
Clocksource may be depend on some clk from DTS as the
real source of this clock.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/time.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index dfad287..8b9acf3 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -29,6 +29,8 @@
  * which however is currently broken
  */
 
+#include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -38,7 +40,6 @@
 #include <linux/init.h>
 #include <linux/timex.h>
 #include <linux/profile.h>
-#include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <asm/irq.h>
 #include <asm/arcregs.h>
@@ -283,6 +284,13 @@ void __init time_init(void)
 		 */
 		clocksource_register_hz(&arc_counter, arc_get_core_freq());
 
+#ifdef CONFIG_COMMON_CLK
+	of_clk_init(NULL);
+#endif
+#ifdef CONFIG_CLKSRC_OF
+	clocksource_probe();
+#endif
+
 	/* sets up the periodic event timer */
 	arc_local_timer_setup();
 }
-- 
1.7.1
