From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 16:33:30 -0700
Subject: [PATCH v3 05/10] ARC: time: move time_init() out of the driver
In-Reply-To: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
References: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478216015-18931-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

to allow future git mv of the driver into drivers/clocksource

Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/setup.c | 11 +++++++++++
 arch/arc/kernel/time.c  |  9 ---------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 595d06900061..5865bd34a7fa 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -10,6 +10,8 @@
 #include <linux/fs.h>
 #include <linux/delay.h>
 #include <linux/root_dev.h>
+#include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/cpu.h>
@@ -449,6 +451,15 @@ void __init setup_arch(char **cmdline_p)
 	arc_unwind_init();
 }
 
+/*
+ * Called from start_kernel() - boot CPU only
+ */
+void __init time_init(void)
+{
+	of_clk_init(NULL);
+	clocksource_probe();
+}
+
 static int __init customize_machine(void)
 {
 	if (machine_desc->init_machine)
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index d3f3750a0d2d..7f06662f53e7 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -365,12 +365,3 @@ static int __init arc_of_timer_init(struct device_node *np)
 	return ret;
 }
 CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
-
-/*
- * Called from start_kernel() - boot CPU only
- */
-void __init time_init(void)
-{
-	of_clk_init(NULL);
-	clocksource_probe();
-}
-- 
2.7.4
