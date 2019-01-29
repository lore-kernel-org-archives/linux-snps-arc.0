From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 29 Jan 2019 13:49:40 +0300
Subject: [PATCH 3/5] ARCv2: Enable unaligned access in early ASM code
In-Reply-To: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
References: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190129104942.31705-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Even though we do enable AD bit in arc_init_IRQ() we need to do
it in early ASM code otherwise we may face unaligned data until
we reach arc_init_IRQ() because GCC starting from v8.1.0 actively
generates unaligned data as it assumes that:
 * ARCv2 always has support of unaliged data
 * This support is turned on in runtime

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/head.S       | 14 ++++++++++++++
 arch/arc/kernel/intc-arcv2.c |  2 --
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 8b90d25a15cc..ffe3d384fca5 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -17,6 +17,9 @@
 #include <asm/entry.h>
 #include <asm/arcregs.h>
 #include <asm/cache.h>
+#ifdef CONFIG_ISA_ARCV2
+#include <asm/irqflags-arcv2.h>
+#endif
 
 .macro CPU_EARLY_SETUP
 
@@ -47,6 +50,17 @@
 	sr	r5, [ARC_REG_DC_CTRL]
 
 1:
+
+	; Enable / disable HW handling of unaligned access in the CPU.
+#ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
+	kflag	STATUS_AD_MASK
+#else
+	; Handling of unaligned access is disabled by default but we disable it
+	; manually in case of any bootloader enabled it earlier.
+	lr	r5, [ARC_REG_STATUS32]
+	bclr	r5, r5, STATUS_AD_BIT
+	kflag	r5
+#endif
 .endm
 
 	.section .init.text, "ax", at progbits
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 84b1c7157d1b..6359896da1ea 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -93,8 +93,6 @@ void arc_init_IRQ(void)
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
 	tmp = read_aux_reg(ARC_REG_STATUS32);
-	if (IS_ENABLED(ARC_USE_UNALIGNED_MEM_ACCESS))
-		tmp |= STATUS_AD_MASK;
 	tmp |= ARCV2_IRQ_DEF_PRIO << 1;
 	tmp &= ~STATUS_IE_MASK;
 	asm volatile("kflag %0	\n"::"r"(tmp));
-- 
2.14.5
