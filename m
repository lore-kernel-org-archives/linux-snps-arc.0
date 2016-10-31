From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 15:48:12 -0700
Subject: [PATCH 5/9] ARC: breakout aux handling into a seperate header
In-Reply-To: <1477954096-770-1-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477954096-770-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC timers use aux registers for programming and this paves way for
moving ARC timer drivers into drivers/clocksource

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h | 85 +-----------------------------------------
 arch/arc/include/asm/mcip.h    |  2 +-
 include/soc/arc/aux.h          | 52 ++++++++++++++++++++++++++
 include/soc/nps/common.h       |  4 +-
 4 files changed, 56 insertions(+), 87 deletions(-)
 create mode 100644 include/soc/arc/aux.h

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 7f3f9f63708c..ccf5dc96713b 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -110,90 +110,7 @@
 
 #ifndef __ASSEMBLY__
 
-/*
- ******************************************************************
- *      Inline ASM macros to read/write AUX Regs
- *      Essentially invocation of lr/sr insns from "C"
- */
-
-#if 1
-
-#define read_aux_reg(reg)	__builtin_arc_lr(reg)
-
-/* gcc builtin sr needs reg param to be long immediate */
-#define write_aux_reg(reg_immed, val)		\
-		__builtin_arc_sr((unsigned int)(val), reg_immed)
-
-#else
-
-#define read_aux_reg(reg)		\
-({					\
-	unsigned int __ret;		\
-	__asm__ __volatile__(		\
-	"	lr    %0, [%1]"		\
-	: "=r"(__ret)			\
-	: "i"(reg));			\
-	__ret;				\
-})
-
-/*
- * Aux Reg address is specified as long immediate by caller
- * e.g.
- *    write_aux_reg(0x69, some_val);
- * This generates tightest code.
- */
-#define write_aux_reg(reg_imm, val)	\
-({					\
-	__asm__ __volatile__(		\
-	"	sr   %0, [%1]	\n"	\
-	:				\
-	: "ir"(val), "i"(reg_imm));	\
-})
-
-/*
- * Aux Reg address is specified in a variable
- *  * e.g.
- *      reg_num = 0x69
- *      write_aux_reg2(reg_num, some_val);
- * This has to generate glue code to load the reg num from
- *  memory to a reg hence not recommended.
- */
-#define write_aux_reg2(reg_in_var, val)		\
-({						\
-	unsigned int tmp;			\
-						\
-	__asm__ __volatile__(			\
-	"	ld   %0, [%2]	\n\t"		\
-	"	sr   %1, [%0]	\n\t"		\
-	: "=&r"(tmp)				\
-	: "r"(val), "memory"(&reg_in_var));	\
-})
-
-#endif
-
-#define READ_BCR(reg, into)				\
-{							\
-	unsigned int tmp;				\
-	tmp = read_aux_reg(reg);			\
-	if (sizeof(tmp) == sizeof(into)) {		\
-		into = *((typeof(into) *)&tmp);		\
-	} else {					\
-		extern void bogus_undefined(void);	\
-		bogus_undefined();			\
-	}						\
-}
-
-#define WRITE_AUX(reg, into)				\
-{							\
-	unsigned int tmp;				\
-	if (sizeof(tmp) == sizeof(into)) {		\
-		tmp = (*(unsigned int *)&(into));	\
-		write_aux_reg(reg, tmp);		\
-	} else  {					\
-		extern void bogus_undefined(void);	\
-		bogus_undefined();			\
-	}						\
-}
+#include <soc/arc/aux.h>
 
 /* Helpers */
 #define TO_KB(bytes)		((bytes) >> 10)
diff --git a/arch/arc/include/asm/mcip.h b/arch/arc/include/asm/mcip.h
index c8fbe4114bad..fc28d0944801 100644
--- a/arch/arc/include/asm/mcip.h
+++ b/arch/arc/include/asm/mcip.h
@@ -13,7 +13,7 @@
 
 #ifdef CONFIG_ISA_ARCV2
 
-#include <asm/arcregs.h>
+#include <soc/arc/aux.h>
 
 #define ARC_REG_MCIP_BCR	0x0d0
 #define ARC_REG_MCIP_CMD	0x600
diff --git a/include/soc/arc/aux.h b/include/soc/arc/aux.h
new file mode 100644
index 000000000000..8c41c096a51b
--- /dev/null
+++ b/include/soc/arc/aux.h
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2016-2017 Synopsys, Inc. (www.synopsys.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __SOC_ARC_AUX_H__
+#define __SOC_ARC_AUX_H__
+
+#ifdef CONFIG_ARC
+
+#define read_aux_reg(r)		__builtin_arc_lr(r)
+
+/* gcc builtin sr needs reg param to be long immediate */
+#define write_aux_reg(r, v)	__builtin_arc_sr((unsigned int)(v), r)
+
+#else
+
+#define read_aux_reg(r)		0
+#define write_aux_reg(r, v)
+
+#endif
+
+#define READ_BCR(reg, into)				\
+{							\
+	unsigned int tmp;				\
+	tmp = read_aux_reg(reg);			\
+	if (sizeof(tmp) == sizeof(into)) {		\
+		into = *((typeof(into) *)&tmp);		\
+	} else {					\
+		extern void bogus_undefined(void);	\
+		bogus_undefined();			\
+	}						\
+}
+
+#define WRITE_AUX(reg, into)				\
+{							\
+	unsigned int tmp;				\
+	if (sizeof(tmp) == sizeof(into)) {		\
+		tmp = (*(unsigned int *)&(into));	\
+		write_aux_reg(reg, tmp);		\
+	} else  {					\
+		extern void bogus_undefined(void);	\
+		bogus_undefined();			\
+	}						\
+}
+
+
+#endif
diff --git a/include/soc/nps/common.h b/include/soc/nps/common.h
index 9b1d43d671a3..b7ba05b3993f 100644
--- a/include/soc/nps/common.h
+++ b/include/soc/nps/common.h
@@ -47,6 +47,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <soc/arc/aux.h>
+
 /* In order to increase compilation test coverage */
 #ifdef CONFIG_ARC
 static inline void nps_ack_gic(void)
@@ -59,8 +61,6 @@ static inline void nps_ack_gic(void)
 }
 #else
 static inline void nps_ack_gic(void) { }
-#define write_aux_reg(r, v)
-#define read_aux_reg(r) 0
 #endif
 
 /* CPU global ID */
-- 
2.7.4
