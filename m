From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Sep 2017 11:41:22 -0700
Subject: [PATCH 2/2] ARCv2: boot log: identify HS48 cores (dual issue)
In-Reply-To: <1506710482-23790-1-git-send-email-vgupta@synopsys.com>
References: <1506710482-23790-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1506710482-23790-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  3 ++-
 arch/arc/kernel/setup.c        | 17 ++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index b71d84873f7d..b1c56d35f2a9 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -98,6 +98,7 @@
 
 /* Auxiliary registers */
 #define AUX_IDENTITY		4
+#define AUX_EXEC_CTRL		8
 #define AUX_INTR_VEC_BASE	0x25
 #define AUX_VOL			0x5e
 
@@ -269,7 +270,7 @@ struct cpuinfo_arc {
 	struct cpuinfo_arc_ccm iccm, dccm;
 	struct {
 		unsigned int swap:1, norm:1, minmax:1, barrel:1, crc:1, swape:1, pad1:2,
-			     fpu_sp:1, fpu_dp:1, pad2:6,
+			     fpu_sp:1, fpu_dp:1, dual_iss_enb:1, dual_iss_exist:1, pad2:4,
 			     debug:1, ap:1, smart:1, rtt:1, pad3:4,
 			     timer0:1, timer1:1, rtc:1, gfrc:1, pad4:4;
 	} extn;
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 228593a964f8..fb83844daeea 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -51,6 +51,7 @@ static const struct id_to_str arc_cpu_rel[] = {
 	{ 0x51, "R2.0" },
 	{ 0x52, "R2.1" },
 	{ 0x53, "R3.0" },
+	{ 0x54, "R4.0" },
 #endif
 	{ 0x00, NULL   }
 };
@@ -62,6 +63,7 @@ static const struct id_to_str arc_cpu_nm[] = {
 #else
 	{ 0x40, "ARC EM"  },
 	{ 0x50, "ARC HS38"  },
+	{ 0x54, "ARC HS48"  },
 #endif
 	{ 0x00, "Unknown"   }
 };
@@ -133,7 +135,7 @@ static void read_arc_build_cfg_regs(void)
 	}
 
 	for (tbl = &arc_cpu_nm[0]; tbl->id != 0; tbl++) {
-		if ((cpu->core.family & 0xF0) == tbl->id)
+		if ((cpu->core.family & 0xF4) == tbl->id)
 			break;
 	}
 	cpu->name = tbl->str;
@@ -192,6 +194,14 @@ static void read_arc_build_cfg_regs(void)
 		cpu->bpu.full = bpu.ft;
 		cpu->bpu.num_cache = 256 << bpu.bce;
 		cpu->bpu.num_pred = 2048 << bpu.pte;
+
+		if (cpu->core.family >= 0x54) {
+			unsigned int exec_ctrl;
+
+			READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
+			cpu->extn.dual_iss_exist = 1;
+			cpu->extn.dual_iss_enb = exec_ctrl & 1;
+		}
 	}
 
 	READ_BCR(ARC_REG_AP_BCR, bcr);
@@ -239,10 +249,11 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 		       "\nIDENTITY\t: ARCVER [%#02x] ARCNUM [%#02x] CHIPID [%#4x]\n",
 		       core->family, core->cpu_id, core->chip_id);
 
-	n += scnprintf(buf + n, len - n, "processor [%d]\t: %s %s (%s ISA) %s\n",
+	n += scnprintf(buf + n, len - n, "processor [%d]\t: %s %s (%s ISA) %s%s%s\n",
 		       cpu_id, cpu->name, cpu->details,
 		       is_isa_arcompact() ? "ARCompact" : "ARCv2",
-		       IS_AVAIL1(cpu->isa.be, "[Big-Endian]"));
+		       IS_AVAIL1(cpu->isa.be, "[Big-Endian]"),
+		       IS_AVAIL3(cpu->extn.dual_iss_exist, cpu->extn.dual_iss_enb, " Dual-Issue"));
 
 	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s%s%s\nISA Extn\t: ",
 		       IS_AVAIL1(cpu->extn.timer0, "Timer0 "),
-- 
2.7.4
