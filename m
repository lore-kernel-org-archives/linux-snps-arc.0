From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 15:48:15 -0700
Subject: [PATCH 8/9] ARC: timer: rename config options
In-Reply-To: <1477954096-770-1-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477954096-770-9-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig                           | 4 ++--
 arch/arc/configs/nsimosci_hs_smp_defconfig | 2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig    | 2 +-
 arch/arc/kernel/setup.c                    | 4 ++--
 arch/arc/kernel/time.c                     | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index bd204bfa29ed..b4499f97035a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -410,12 +410,12 @@ config ARC_HAS_DIV_REM
 	bool "Insn: div, divu, rem, remu"
 	default y
 
-config ARC_HAS_RTC
+config ARC_TIMER_RTC
 	bool "Local 64-bit r/o cycle counter"
 	default n
 	depends on !SMP
 
-config ARC_HAS_GFRC
+config ARC_TIMER_GFRC
 	bool "SMP synchronized 64-bit cycle counter"
 	default y
 	depends on SMP
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 6da71ba253a9..9782fe512244 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -21,7 +21,7 @@ CONFIG_MODULES=y
 CONFIG_ARC_PLAT_SIM=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-# CONFIG_ARC_HAS_GFRC is not set
+# CONFIG_ARC_TIMER_GFRC is not set
 CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 969b206d6c67..a927389d02d8 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -15,7 +15,7 @@ CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-# CONFIG_ARC_HAS_GFRC is not set
+# CONFIG_ARC_TIMER_GFRC is not set
 CONFIG_ARC_UBOOT_SUPPORT=y
 CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
 CONFIG_PREEMPT=y
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 5865bd34a7fa..4855335b956b 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -239,8 +239,8 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s%s%s\nISA Extn\t: ",
 		       IS_AVAIL1(cpu->extn.timer0, "Timer0 "),
 		       IS_AVAIL1(cpu->extn.timer1, "Timer1 "),
-		       IS_AVAIL2(cpu->extn.rtc, "RTC [UP 64-bit] ", CONFIG_ARC_HAS_RTC),
-		       IS_AVAIL2(cpu->extn.gfrc, "GFRC [SMP 64-bit] ", CONFIG_ARC_HAS_GFRC));
+		       IS_AVAIL2(cpu->extn.rtc, "RTC [UP 64-bit] ", CONFIG_ARC_TIMER_RTC),
+		       IS_AVAIL2(cpu->extn.gfrc, "GFRC [SMP 64-bit] ", CONFIG_ARC_TIMER_GFRC));
 
 	n += i = scnprintf(buf + n, len - n, "%s%s%s%s%s",
 			   IS_AVAIL2(cpu->isa.atomic, "atomic ", CONFIG_ARC_HAS_LLSC),
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index dad3a9933c4c..676b14b7a9be 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -81,7 +81,7 @@ static int noinline arc_get_timer_clk(struct device_node *node)
 
 /********** Clock Source Device *********/
 
-#ifdef CONFIG_ARC_HAS_GFRC
+#ifdef CONFIG_ARC_TIMER_GFRC
 
 static cycle_t arc_read_gfrc(struct clocksource *cs)
 {
@@ -135,7 +135,7 @@ CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
 
 #endif
 
-#ifdef CONFIG_ARC_HAS_RTC
+#ifdef CONFIG_ARC_TIMER_RTC
 
 #define AUX_RTC_CTRL	0x103
 #define AUX_RTC_LOW	0x104
-- 
2.7.4
