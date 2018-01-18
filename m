From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Jan 2018 16:48:31 +0300
Subject: [PATCH] ARC: Add a knob to control usage of dual-issue
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180118134831.41489-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

HS48 core starts with dual-issue enabled but in some cases like
debugging as well as benchmarking it might be useful to disable
dual-issue for a particular run.

Note:
  1. To disable dual-issue user has to change a value of a global variable
     in target's memory right before start of Linu kernel execution
     (most probably via JTAG)

  2. Disabling happens very early on boot and to get it back enabled it's
     required to restart Linux kernel. I.e. with this change we don't allow
     toggling dual-issue state in random moments of run-time

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/setup.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 9d27331fe69a..cf97f7d88934 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -31,6 +31,8 @@
 
 #define FIX_PTR(x)  __asm__ __volatile__(";" : "+r"(x))
 
+int dual_issue_enable = 1;
+
 unsigned int intr_to_DE_cnt;
 
 /* Part of U-boot ABI: see head.S */
@@ -198,6 +200,17 @@ static void read_arc_build_cfg_regs(void)
 		if (cpu->core.family >= 0x54) {
 			unsigned int exec_ctrl;
 
+			if (!dual_issue_enable) {
+				/*
+				 * Note:
+				 *   1) Reset value in AUX_EXEC_CTRL is 0
+				 *   2) Reverse logic is used,
+				 *      i.e. by default (AUX_EXEC_CTRL=0)
+				 *      dual-issue is enabled.
+				 */
+				write_aux_reg(AUX_EXEC_CTRL, 1);
+			}
+
 			READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
 			cpu->extn.dual_enb = !(exec_ctrl & 1);
 
-- 
2.11.0
