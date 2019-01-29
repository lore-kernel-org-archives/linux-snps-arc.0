From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 29 Jan 2019 13:49:39 +0300
Subject: [PATCH 2/5] ARCv2: introduce unaligned access under a Kconfig option
In-Reply-To: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
References: <20190129104942.31705-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190129104942.31705-3-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As of today we enable unaligned access unconditionally on ARCv2.
Lets move it under Kconfig option so we can disable it in case of
using HW configuration which lacks of it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/Kconfig                      | 8 ++++++++
 arch/arc/include/asm/irqflags-arcv2.h | 4 ++++
 arch/arc/kernel/intc-arcv2.c          | 4 +++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 376366a7db81..37c8aeefa3a5 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -387,6 +387,14 @@ config ARC_HAS_SWAPE
 
 if ISA_ARCV2
 
+config ARC_USE_UNALIGNED_MEM_ACCESS
+	bool "Handle unaligned access in HW and use it"
+	default y
+	help
+	  The ARC HS architecture supports unaligned memory access
+	  which is disabled by default. Enable unaligned access in
+	  hardware and use it in software.
+
 config ARC_HAS_LL64
 	bool "Insn: 64bit LDD/STD"
 	help
diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
index 8a4f77ea3238..9b911e2c6b31 100644
--- a/arch/arc/include/asm/irqflags-arcv2.h
+++ b/arch/arc/include/asm/irqflags-arcv2.h
@@ -44,8 +44,12 @@
 #define ARCV2_IRQ_DEF_PRIO	1
 
 /* seed value for status register */
+#ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
 #define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | STATUS_AD_MASK | \
 					(ARCV2_IRQ_DEF_PRIO << 1))
+#else
+#define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | (ARCV2_IRQ_DEF_PRIO << 1))
+#endif /* CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS */
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 067ea362fb3e..84b1c7157d1b 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -93,7 +93,9 @@ void arc_init_IRQ(void)
 
 	/* setup status32, don't enable intr yet as kernel doesn't want */
 	tmp = read_aux_reg(ARC_REG_STATUS32);
-	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
+	if (IS_ENABLED(ARC_USE_UNALIGNED_MEM_ACCESS))
+		tmp |= STATUS_AD_MASK;
+	tmp |= ARCV2_IRQ_DEF_PRIO << 1;
 	tmp &= ~STATUS_IE_MASK;
 	asm volatile("kflag %0	\n"::"r"(tmp));
 }
-- 
2.14.5
