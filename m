From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Jan 2017 12:57:54 -0800
Subject: [PATCH 1/4] ARC: smp-boot: waiting API for run-from-reset need not
 jump to entry point
In-Reply-To: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484600277-32345-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

For run-on-reset SMP configs, non master cores call a routine which
waits until Master gives it a "go" signal (currently using a shared
mem flag). The same routine then jumps off the well known entry point of
all non Master cores i.e. @first_lines_of_secondary

This patch moves the last part out waiting routine into one single
place in early boot code.

This is better in terms of absraction (the wait codes only waits) and
returns, leaving out the "start off to" part.

Moreover this makes way for alternate implementation of wait (using
hardware assist) without having to duplicate the jump part.

In terms of implementation this requires some restructuring of the early
boot code in head.S as Master now jumps to BSS setup explicitly,
vs. falling thru into it before.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/head.S | 14 +++++++-------
 arch/arc/kernel/smp.c  |  6 ++++--
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 689dd867fdff..8b90d25a15cc 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -71,14 +71,14 @@ ENTRY(stext)
 	GET_CPU_ID  r5
 	cmp	r5, 0
 	mov.nz	r0, r5
-#ifdef CONFIG_ARC_SMP_HALT_ON_RESET
-	; Non-Master can proceed as system would be booted sufficiently
-	jnz	first_lines_of_secondary
-#else
+	bz	.Lmaster_proceed
+
 	; Non-Masters wait for Master to boot enough and bring them up
-	jnz	arc_platform_smp_wait_to_boot
-#endif
-	; Master falls thru
+	; when they resume, tail-call to entry point
+	mov	blink, @first_lines_of_secondary
+	j	arc_platform_smp_wait_to_boot
+
+.Lmaster_proceed:
 #endif
 
 	; Clear BSS before updating any globals
diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 88674d972c9d..44a0d21ed342 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -98,14 +98,16 @@ static void arc_default_smp_cpu_kick(int cpu, unsigned long pc)
 
 void arc_platform_smp_wait_to_boot(int cpu)
 {
+	/* for halt-on-reset, we've waited already */
+	if (IS_ENABLED(CONFIG_ARC_SMP_HALT_ON_RESET))
+		return;
+
 	while (wake_flag != cpu)
 		;
 
 	wake_flag = 0;
-	__asm__ __volatile__("j @first_lines_of_secondary	\n");
 }
 
-
 const char *arc_platform_smp_cpuinfo(void)
 {
 	return plat_smp_ops.info ? : "";
-- 
2.7.4
