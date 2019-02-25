From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 25 Feb 2019 14:49:09 -0800
Subject: [PATCH 2/2] ARC: boot log: cut down on verbosity
In-Reply-To: <1551134949-23676-1-git-send-email-vgupta@synopsys.com>
References: <1551134949-23676-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1551134949-23676-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The syscall ABI has long been fixed, so need to call that out now.

There's no need to print the real fine details such as norm, barrel
shifter etc. Those are given in a Linux enabled hardware config.
Now there's just 1 line for all optional "instruction" related features

|
| ISA Extn	: atomic ll64 unalign mpy[opt 9] div_rem

vs. 2 before

|
|ISA Extn	: atomic ll64 unalign
|		: mpy[opt 9] div_rem norm barrel-shift swap minmax swape

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  9 -----
 arch/arc/kernel/setup.c        | 84 ++++++++++++++++--------------------------
 2 files changed, 32 insertions(+), 61 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 36e5d124f5ae..a7d4be87b2f0 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -168,14 +168,6 @@ struct bcr_mpy {
 #endif
 };
 
-struct bcr_extn_xymem {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	unsigned int ram_org:2, num_banks:4, bank_sz:4, ver:8;
-#else
-	unsigned int ver:8, bank_sz:4, num_banks:4, ram_org:2;
-#endif
-};
-
 struct bcr_iccm_arcompact {
 #ifdef CONFIG_CPU_BIG_ENDIAN
 	unsigned int base:16, pad:5, sz:3, ver:8;
@@ -323,7 +315,6 @@ struct cpuinfo_arc {
 			     timer0:1, timer1:1, rtc:1, gfrc:1, pad4:4;
 	} extn;
 	struct bcr_mpy extn_mpy;
-	struct bcr_extn_xymem extn_xymem;
 };
 
 extern struct cpuinfo_arc cpuinfo_arc700[];
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 6bd466892915..15da43d2e416 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -188,16 +188,6 @@ static void read_arc_build_cfg_regs(void)
 
 	READ_BCR(ARC_REG_MUL_BCR, cpu->extn_mpy);
 
-	cpu->extn.norm = read_aux_reg(ARC_REG_NORM_BCR) > 1 ? 1 : 0; /* 2,3 */
-	cpu->extn.barrel = read_aux_reg(ARC_REG_BARREL_BCR) > 1 ? 1 : 0; /* 2,3 */
-	cpu->extn.swap = read_aux_reg(ARC_REG_SWAP_BCR) ? 1 : 0;        /* 1,3 */
-	cpu->extn.crc = read_aux_reg(ARC_REG_CRC_BCR) ? 1 : 0;
-	cpu->extn.minmax = read_aux_reg(ARC_REG_MIXMAX_BCR) > 1 ? 1 : 0; /* 2 */
-	cpu->extn.swape = (cpu->core.family >= 0x34) ? 1 :
-				IS_ENABLED(CONFIG_ARC_HAS_SWAPE);
-
-	READ_BCR(ARC_REG_XY_MEM_BCR, cpu->extn_xymem);
-
 	/* Read CCM BCRs for boot reporting even if not enabled in Kconfig */
 	read_decode_ccm_bcr(cpu);
 
@@ -282,6 +272,7 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 {
 	struct cpuinfo_arc *cpu = &cpuinfo_arc700[cpu_id];
 	struct bcr_identity *core = &cpu->core;
+	char mpy_opt[16];
 	int n = 0;
 
 	FIX_PTR(cpu);
@@ -302,10 +293,27 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 		       IS_AVAIL2(cpu->extn.rtc, "RTC [UP 64-bit] ", CONFIG_ARC_TIMERS_64BIT),
 		       IS_AVAIL2(cpu->extn.gfrc, "GFRC [SMP 64-bit] ", CONFIG_ARC_TIMERS_64BIT));
 
-	n += scnprintf(buf + n, len - n, "%s%s%s%s%s%s",
+	if (cpu->extn_mpy.ver) {
+		if (is_isa_arcompact()) {
+			scnprintf(mpy_opt, 16, "mpy");
+		} else {
+
+			int opt = 2;	/* stock MPY/MPYH */
+
+			if (cpu->extn_mpy.dsp)	/* OPT 7-9 */
+				opt = cpu->extn_mpy.dsp + 6;
+
+			scnprintf(mpy_opt, 16, "mpy[opt %d] ", opt);
+		}
+	}
+
+	n += scnprintf(buf + n, len - n, "%s%s%s%s%s%s%s%s\n",
 		       IS_AVAIL2(cpu->isa.atomic, "atomic ", CONFIG_ARC_HAS_LLSC),
 		       IS_AVAIL2(cpu->isa.ldd, "ll64 ", CONFIG_ARC_HAS_LL64),
-		       IS_AVAIL2(cpu->isa.unalign, "unalign ", CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS));
+		       IS_AVAIL2(cpu->isa.unalign, "unalign ", CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS),
+		       IS_AVAIL1(cpu->extn_mpy.ver, mpy_opt),
+		       IS_AVAIL1(cpu->isa.div_rem, "div_rem "));
+
 
 #if defined(__ARC_UNALIGNED__) && !defined(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS)
 	/*
@@ -318,52 +326,29 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 	BUILD_BUG_ON_MSG(1, "gcc doesn't support -mno-unaligned-access");
 #endif
 
-	n += scnprintf(buf + n, len - n, "\n\t\t: ");
-
-	if (cpu->extn_mpy.ver) {
-		if (cpu->extn_mpy.ver <= 0x2) {	/* ARCompact */
-			n += scnprintf(buf + n, len - n, "mpy ");
-		} else {
-			int opt = 2;	/* stock MPY/MPYH */
-
-			if (cpu->extn_mpy.dsp)	/* OPT 7-9 */
-				opt = cpu->extn_mpy.dsp + 6;
-
-			n += scnprintf(buf + n, len - n, "mpy[opt %d] ", opt);
-		}
-	}
-
-	n += scnprintf(buf + n, len - n, "%s%s%s%s%s%s%s%s\n",
-		       IS_AVAIL1(cpu->isa.div_rem, "div_rem "),
-		       IS_AVAIL1(cpu->extn.norm, "norm "),
-		       IS_AVAIL1(cpu->extn.barrel, "barrel-shift "),
-		       IS_AVAIL1(cpu->extn.swap, "swap "),
-		       IS_AVAIL1(cpu->extn.minmax, "minmax "),
-		       IS_AVAIL1(cpu->extn.crc, "crc "),
-		       IS_AVAIL2(cpu->extn.swape, "swape", CONFIG_ARC_HAS_SWAPE));
-
-	if (cpu->bpu.ver)
+	if (cpu->bpu.ver) {
 		n += scnprintf(buf + n, len - n,
 			      "BPU\t\t: %s%s match, cache:%d, Predict Table:%d Return stk: %d",
 			      IS_AVAIL1(cpu->bpu.full, "full"),
 			      IS_AVAIL1(!cpu->bpu.full, "partial"),
 			      cpu->bpu.num_cache, cpu->bpu.num_pred, cpu->bpu.ret_stk);
 
-	if (is_isa_arcv2()) {
-		struct bcr_lpb lpb;
+		if (is_isa_arcv2()) {
+			struct bcr_lpb lpb;
 
-		READ_BCR(ARC_REG_LPB_BUILD, lpb);
-		if (lpb.ver) {
-			unsigned int ctl;
-			ctl = read_aux_reg(ARC_REG_LPB_CTRL);
+			READ_BCR(ARC_REG_LPB_BUILD, lpb);
+			if (lpb.ver) {
+				unsigned int ctl;
+				ctl = read_aux_reg(ARC_REG_LPB_CTRL);
 
-			n += scnprintf(buf + n, len - n, " Loop Buffer:%d %s",
-				lpb.entries,
-				IS_DISABLED_RUN(!ctl));
+				n += scnprintf(buf + n, len - n, " Loop Buffer:%d %s",
+					       lpb.entries,
+					       IS_DISABLED_RUN(!ctl));
+			}
 		}
+		n += scnprintf(buf + n, len - n, "\n");
 	}
 
-	n += scnprintf(buf + n, len - n, "\n");
 	return buf;
 }
 
@@ -416,11 +401,6 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
 		}
 	}
 
-	n += scnprintf(buf + n, len - n, "OS ABI [v%d]\t: %s\n",
-			EF_ARC_OSABI_CURRENT >> 8,
-			EF_ARC_OSABI_CURRENT == EF_ARC_OSABI_V3 ?
-			"no-legacy-syscalls" : "64-bit data any register aligned");
-
 	return buf;
 }
 
-- 
2.7.4
