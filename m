From: sashal@kernel.org (Sasha Levin)
Date: Wed, 13 Mar 2019 15:10:09 -0400
Subject: [PATCH AUTOSEL 4.20 48/60] ARCv2: don't assume core 0x54 has dual
 issue
In-Reply-To: <20190313191021.158171-1-sashal@kernel.org>
References: <20190313191021.158171-1-sashal@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190313191021.158171-48-sashal@kernel.org>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit 7b2e932f633bcb7b190fc7031ce6dac75f8c3472 ]

The first release of core4 (0x54) was dual issue only (HS4x).
Newer releases allow hardware to be configured as single issue (HS3x)
or dual issue.

Prevent accessing a HS4x only aux register in HS3x, which otherwise
leads to illegal instruction exceptions

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 arch/arc/include/asm/arcregs.h |  8 ++++++++
 arch/arc/kernel/setup.c        | 26 +++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 49bfbd879caa..bdbdaef902eb 100644
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
index 80dd1a716ca7..184a5d1bf28d 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -196,13 +196,29 @@ static void read_arc_build_cfg_regs(void)
 		cpu->bpu.num_pred = 2048 << bpu.pte;
 
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
2.19.1
