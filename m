From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 17:56:07 +0530
Subject: [PATCH v2 4/9] ARC: clockevent: Prepare for DT based probe
In-Reply-To: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457439972-20285-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

 - call clocksource_probe()
 - This in turns needs of_clk_init() to be called earlier

Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Noam Camus <noamc at ezchip.com>
[vgupta: broken off from a bigger patch]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
Changes v1 -> v2
 - Rebased on 4.5-rc6
 - Removed now not relevant header from setup.c

v1:
 - http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000448.html

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig        | 3 ++-
 arch/arc/kernel/setup.c | 2 --
 arch/arc/kernel/time.c  | 5 +++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 8a188bc1786a..74689dfde0ae 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -10,8 +10,9 @@ config ARC
 	def_bool y
 	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
 	select BUILDTIME_EXTABLE_SORT
-	select COMMON_CLK
+	select CLKSRC_OF
 	select CLONE_BACKWARDS
+	select COMMON_CLK
 	select GENERIC_ATOMIC64
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_FIND_FIRST_BIT
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index cdc821df1809..2dad49c71c09 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -13,7 +13,6 @@
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/cpu.h>
-#include <linux/clk-provider.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/cache.h>
@@ -459,7 +458,6 @@ void __init setup_arch(char **cmdline_p)
 
 static int __init customize_machine(void)
 {
-	of_clk_init(NULL);
 	/*
 	 * Traverses flattened DeviceTree - registering platform devices
 	 * (if any) complete with their resources
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index e97be743d47b..848353a27ac8 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -34,6 +34,8 @@
 #include <linux/kernel.h>
 #include <linux/time.h>
 #include <linux/init.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -301,6 +303,9 @@ static void __init arc_clockevent_setup(void)
  */
 void __init time_init(void)
 {
+	of_clk_init(NULL);
+	clocksource_probe();
+
 	/*
 	 * sets up the timekeeping free-flowing counter which also returns
 	 * whether the counter is usable as clocksource
-- 
2.5.0
