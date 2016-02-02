From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 2 Feb 2016 16:28:54 +0530
Subject: [PATCH 4/9] ARC: clockevent: Prepare for DT based probe
In-Reply-To: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454410739-24444-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

 - call clocksource_probe()
 - This in turns needs of_clk_init() to be called earlier

Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Noam Camus <noamc at ezchip.com>
[vgupta: broken off from a bigger patch]
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig        | 3 ++-
 arch/arc/kernel/setup.c | 1 -
 arch/arc/kernel/time.c  | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index bb15e8062b1f..0faf954c860c 100644
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
 	# ARC Busybox based initramfs absolutely relies on DEVTMPFS for /dev
 	select DEVTMPFS if !INITRAMFS_SOURCE=""
 	select GENERIC_ATOMIC64
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 7f0a3cb300a8..8129c8e8f20b 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -438,7 +438,6 @@ void __init setup_arch(char **cmdline_p)
 
 static int __init customize_machine(void)
 {
-	of_clk_init(NULL);
 	/*
 	 * Traverses flattened DeviceTree - registering platform devices
 	 * (if any) complete with their resources
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index bdfc621d5d85..1f5a6fe03bcc 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -38,6 +38,7 @@
 #include <linux/init.h>
 #include <linux/timex.h>
 #include <linux/profile.h>
+#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <asm/irq.h>
@@ -305,6 +306,9 @@ static void __init arc_clockevent_setup()
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
