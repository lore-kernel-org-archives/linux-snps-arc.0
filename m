From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Sep 2017 11:41:21 -0700
Subject: [PATCH 1/2] ARC: boot log: decontaminate ARCv2 ISA_CONFIG register
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1506710482-23790-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARCv2 ISA_CONFIG and ARC700_BUILD build config registers are not
compatible. cpuinfo_arc had isa info placeholder which was mashup of bits
form both.

Untangle this by defining it off of ARCv2 ISA info and it is fine even
for ARC700 since former is a super set of latter (ARC700 buildonly has 2
bits for atomics and stack check).

At runtime, we treat ARCv2 ISA info as a generic palceholder but
populate it correctly depending on ARC700 or HS.

This paves way for adding more HS specific bits in isa info which was
colliding with the extra bits for arc700.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  8 ++++----
 arch/arc/kernel/setup.c        | 15 +++++++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index ba8e802dba80..b71d84873f7d 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -135,12 +135,12 @@ struct bcr_identity {
 #endif
 };
 
-struct bcr_isa {
+struct bcr_isa_arcv2 {
 #ifdef CONFIG_CPU_BIG_ENDIAN
 	unsigned int div_rem:4, pad2:4, ldd:1, unalign:1, atomic:1, be:1,
-		     pad1:11, atomic1:1, ver:8;
+		     pad1:12, ver:8;
 #else
-	unsigned int ver:8, atomic1:1, pad1:11, be:1, atomic:1, unalign:1,
+	unsigned int ver:8, pad1:12, be:1, atomic:1, unalign:1,
 		     ldd:1, pad2:4, div_rem:4;
 #endif
 };
@@ -263,7 +263,7 @@ struct cpuinfo_arc {
 	struct cpuinfo_arc_mmu mmu;
 	struct cpuinfo_arc_bpu bpu;
 	struct bcr_identity core;
-	struct bcr_isa isa;
+	struct bcr_isa_arcv2 isa;
 	const char *details, *name;
 	unsigned int vec_base;
 	struct cpuinfo_arc_ccm iccm, dccm;
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 877cec8f5ea2..228593a964f8 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -119,11 +119,11 @@ static void read_arc_build_cfg_regs(void)
 	struct bcr_generic bcr;
 	struct cpuinfo_arc *cpu = &cpuinfo_arc700[smp_processor_id()];
 	const struct id_to_str *tbl;
+	struct bcr_isa_arcv2 isa;
 
 	FIX_PTR(cpu);
 
 	READ_BCR(AUX_IDENTITY, cpu->core);
-	READ_BCR(ARC_REG_ISA_CFG_BCR, cpu->isa);
 
 	for (tbl = &arc_cpu_rel[0]; tbl->id != 0; tbl++) {
 		if (cpu->core.family == tbl->id) {
@@ -205,18 +205,25 @@ static void read_arc_build_cfg_regs(void)
 
 	cpu->extn.debug = cpu->extn.ap | cpu->extn.smart | cpu->extn.rtt;
 
+	READ_BCR(ARC_REG_ISA_CFG_BCR, isa);
+
 	/* some hacks for lack of feature BCR info in old ARC700 cores */
 	if (is_isa_arcompact()) {
-		if (!cpu->isa.ver)	/* ISA BCR absent, use Kconfig info */
+		if (!isa.ver)	/* ISA BCR absent, use Kconfig info */
 			cpu->isa.atomic = IS_ENABLED(CONFIG_ARC_HAS_LLSC);
-		else
-			cpu->isa.atomic = cpu->isa.atomic1;
+		else {
+			/* ARC700_BUILD only has 2 bits of isa info */
+			struct bcr_generic bcr = *(struct bcr_generic *)&isa;
+			cpu->isa.atomic = bcr.info & 1;
+		}
 
 		cpu->isa.be = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
 
 		 /* there's no direct way to distinguish 750 vs. 770 */
 		if (unlikely(cpu->core.family < 0x34 || cpu->mmu.ver < 3))
 			cpu->name = "ARC750";
+	} else {
+		cpu->isa = isa;
 	}
 }
 
-- 
2.7.4
