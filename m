From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Sep 2019 14:32:03 -0700
Subject: [PATCH 2/6] ARCv2: mm: TLB Miss optim: Use double world load/stores
 LDD/STD
In-Reply-To: <20190916213207.12792-1-vgupta@synopsys.com>
References: <20190916213207.12792-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190916213207.12792-3-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/tlbex.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index d6fbdeda400a..110c72536e8b 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -122,17 +122,27 @@ ex_saved_reg1:
 #else	/* ARCv2 */
 
 .macro TLBMISS_FREEUP_REGS
+#ifdef CONFIG_ARC_HAS_LL64
+	std   r0, [sp, -16]
+	std   r2, [sp, -8]
+#else
 	PUSH  r0
 	PUSH  r1
 	PUSH  r2
 	PUSH  r3
+#endif
 .endm
 
 .macro TLBMISS_RESTORE_REGS
+#ifdef CONFIG_ARC_HAS_LL64
+	ldd   r0, [sp, -16]
+	ldd   r2, [sp, -8]
+#else
 	POP   r3
 	POP   r2
 	POP   r1
 	POP   r0
+#endif
 .endm
 
 #endif
-- 
2.20.1
