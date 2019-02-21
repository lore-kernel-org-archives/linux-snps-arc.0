From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 21 Feb 2019 14:52:18 -0800
Subject: [PATCH] ARCv2: don't assume core 0x54 has dual issue
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1550789538-20786-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The first 0x54 core were dual issue only (HS4x). Newer releases allow
hardware to be configured as single issue (HS3x) or dual issue.

Prevent accessing a HS4x only aux register in HS3x, which otherwise
leads to illegal instruction exceptions

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  8 ++++++++
 arch/arc/kernel/setup.c        | 26 +++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index f1b86cef0905..a27eafdc8260 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -151,6 +151,14 @@ struct bcr_isa_arcv2 {
 #endif
 };
 
+struct bcr_uarch_build_arcv2 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad:8, prod:8, maj:8, min:8;
+#else
+	unsigned int min:8, maj:8, prod:8, pad:8;
+#endif
+};
+
 struct bcr_mpy {
 #ifdef CONFIG_CPU_BIG_ENDIAN
 	unsigned int pad:8, x1616:8, dsp:4, cycles:2, type:2, ver:8;
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 93d4d6639873..7b2340996cf8 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -199,13 +199,29 @@ static void read_arc_build_cfg_regs(void)
 		cpu->bpu.ret_stk = 4 << bpu.rse;
 
 		if (cpu->core.family >= 0x54) {
-			unsigned int exec_ctrl;
 
-			READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
-			cpu->extn.dual_enb = !(exec_ctrl & 1);
+			struct bcr_uarch_build_arcv2 uarch;
 
-			/* dual issue always present for this core */
-			cpu->extn.dual = 1;
+			/*
+			 * The first 0x54 core (uarch maj:min 0:1 or 0:2) was
+			 * dual issue only (HS4x). But next uarch rev (1:0)
+			 * allows it be configured for single issue (HS3x)
+			 * Ensure we fiddle with dual issue only on HS4x
+			 */
+			READ_BCR(ARC_REG_MICRO_ARCH_BCR, uarch);
+
+			if (uarch.prod == 4) {
+				unsigned int exec_ctrl;
+
+				/* dual issue hardware always present */
+				cpu->extn.dual = 1;
+
+				READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
+
+				/* dual issue hardware enabled ? */
+				cpu->extn.dual_enb = !(exec_ctrl & 1);
+
+			}
 		}
 	}
 
-- 
2.7.4
