From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 30 Jan 2019 19:32:43 +0300
Subject: [PATCH v2 4/5] ARCv2: LIB: MEMCPY: fixed and optimised routine
In-Reply-To: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
References: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190130163244.10870-5-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Optimise code to use efficient unaligned memory access which is
available on ARCv2. This allows us to really simplify memcpy code
and speed up the code one and a half times (in case of unaligned
source or destination).

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/lib/Makefile                 |  8 +++++-
 arch/arc/lib/memcpy-archs-unaligned.S | 47 +++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 arch/arc/lib/memcpy-archs-unaligned.S

diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
index b1656d156097..f7537b466b23 100644
--- a/arch/arc/lib/Makefile
+++ b/arch/arc/lib/Makefile
@@ -8,4 +8,10 @@
 lib-y	:= strchr-700.o strcpy-700.o strlen.o memcmp.o
 
 lib-$(CONFIG_ISA_ARCOMPACT)	+= memcpy-700.o memset.o strcmp.o
-lib-$(CONFIG_ISA_ARCV2)		+= memcpy-archs.o memset-archs.o strcmp-archs.o
+lib-$(CONFIG_ISA_ARCV2)		+= memset-archs.o strcmp-archs.o
+
+ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
+lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs-unaligned.o
+else
+lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
+endif
diff --git a/arch/arc/lib/memcpy-archs-unaligned.S b/arch/arc/lib/memcpy-archs-unaligned.S
new file mode 100644
index 000000000000..28993a73fdde
--- /dev/null
+++ b/arch/arc/lib/memcpy-archs-unaligned.S
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * ARCv2 memcpy implementation optimized for unaligned memory access using.
+ *
+ * Copyright (C) 2019 Synopsys
+ * Author: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
+ */
+
+#include <linux/linkage.h>
+
+#ifdef CONFIG_ARC_HAS_LL64
+# define LOADX(DST,RX)		ldd.ab	DST, [RX, 8]
+# define STOREX(SRC,RX)		std.ab	SRC, [RX, 8]
+# define ZOLSHFT		5
+# define ZOLAND			0x1F
+#else
+# define LOADX(DST,RX)		ld.ab	DST, [RX, 4]
+# define STOREX(SRC,RX)		st.ab	SRC, [RX, 4]
+# define ZOLSHFT		4
+# define ZOLAND			0xF
+#endif
+
+ENTRY_CFI(memcpy)
+	mov	r3, r0		; don;t clobber ret val
+
+	lsr.f	lp_count, r2, ZOLSHFT
+	lpnz	@.Lcopy32_64bytes
+	;; LOOP START
+	LOADX	(r6, r1)
+	LOADX	(r8, r1)
+	LOADX	(r10, r1)
+	LOADX	(r4, r1)
+	STOREX	(r6, r3)
+	STOREX	(r8, r3)
+	STOREX	(r10, r3)
+	STOREX	(r4, r3)
+.Lcopy32_64bytes:
+
+	and.f	lp_count, r2, ZOLAND ;Last remaining 31 bytes
+	lpnz	@.Lcopyremainingbytes
+	;; LOOP START
+	ldb.ab	r5, [r1, 1]
+	stb.ab	r5, [r3, 1]
+.Lcopyremainingbytes:
+
+	j	[blink]
+END_CFI(memcpy)
-- 
2.14.5
