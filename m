From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Nov 2016 13:38:48 -0800
Subject: [PATCH v4 4/8] ARC: timer: Build gfrc,
 rtc under same option (64-bit timers)
In-Reply-To: <1478900332-24279-1-git-send-email-vgupta@synopsys.com>
References: <1478900332-24279-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478900332-24279-5-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The original distinction was done as they were developed at different
times and primarily because they are specific to UP (RTC) and SMP (GFRC).

But given that driver handles that at runtime, (i.e. not allowing
RTC as clocksource in SMP), we can simplify things a bit.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/Kconfig                           | 10 ++--------
 arch/arc/configs/nsimosci_hs_smp_defconfig |  2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig    |  2 +-
 arch/arc/kernel/setup.c                    |  6 +++---
 arch/arc/kernel/time.c                     |  6 +-----
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index bd204bfa29ed..bde3e558d8bc 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -410,15 +410,9 @@ config ARC_HAS_DIV_REM
 	bool "Insn: div, divu, rem, remu"
 	default y
 
-config ARC_HAS_RTC
-	bool "Local 64-bit r/o cycle counter"
-	default n
-	depends on !SMP
-
-config ARC_HAS_GFRC
-	bool "SMP synchronized 64-bit cycle counter"
+config ARC_TIMERS_64BIT
+	bool "64-bit r/o cycle counters RTC (up) and GFRC (smp)"
 	default y
-	depends on SMP
 
 config ARC_NUMBER_OF_INTERRUPTS
 	int "Number of interrupts"
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 6da71ba253a9..155add7761ed 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -21,7 +21,7 @@ CONFIG_MODULES=y
 CONFIG_ARC_PLAT_SIM=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-# CONFIG_ARC_HAS_GFRC is not set
+# CONFIG_ARC_TIMERS_64BIT is not set
 CONFIG_ARC_BUILTIN_DTB_NAME="nsimosci_hs_idu"
 CONFIG_PREEMPT=y
 # CONFIG_COMPACTION is not set
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index 969b206d6c67..573028f19de7 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -15,7 +15,7 @@ CONFIG_ARC_PLAT_AXS10X=y
 CONFIG_AXS103=y
 CONFIG_ISA_ARCV2=y
 CONFIG_SMP=y
-# CONFIG_ARC_HAS_GFRC is not set
+# CONFIG_ARC_TIMERS_64BIT is not set
 CONFIG_ARC_UBOOT_SUPPORT=y
 CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
 CONFIG_PREEMPT=y
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 1be9d5c81037..3093fa898a23 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -236,11 +236,11 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 		       is_isa_arcompact() ? "ARCompact" : "ARCv2",
 		       IS_AVAIL1(cpu->isa.be, "[Big-Endian]"));
 
-	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s\nISA Extn\t: ",
+	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s%s%s\nISA Extn\t: ",
 		       IS_AVAIL1(cpu->extn.timer0, "Timer0 "),
 		       IS_AVAIL1(cpu->extn.timer1, "Timer1 "),
-		       IS_AVAIL2(cpu->extn.rtc, "Local-64-bit-Ctr ",
-				 CONFIG_ARC_HAS_RTC));
+		       IS_AVAIL2(cpu->extn.rtc, "RTC [UP 64-bit] ", CONFIG_ARC_TIMERS_64BIT),
+		       IS_AVAIL2(cpu->extn.gfrc, "GFRC [SMP 64-bit] ", CONFIG_ARC_TIMERS_64BIT));
 
 	n += i = scnprintf(buf + n, len - n, "%s%s%s%s%s",
 			   IS_AVAIL2(cpu->isa.atomic, "atomic ", CONFIG_ARC_HAS_LLSC),
diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index 7f06662f53e7..417d32e031d3 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -81,7 +81,7 @@ static int noinline arc_get_timer_clk(struct device_node *node)
 
 /********** Clock Source Device *********/
 
-#ifdef CONFIG_ARC_HAS_GFRC
+#ifdef CONFIG_ARC_TIMERS_64BIT
 
 static cycle_t arc_read_gfrc(struct clocksource *cs)
 {
@@ -128,10 +128,6 @@ static int __init arc_cs_setup_gfrc(struct device_node *node)
 }
 CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
 
-#endif
-
-#ifdef CONFIG_ARC_HAS_RTC
-
 #define AUX_RTC_CTRL	0x103
 #define AUX_RTC_LOW	0x104
 #define AUX_RTC_HIGH	0x105
-- 
2.7.4
