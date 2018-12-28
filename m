From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 28 Dec 2018 19:44:44 +0300
Subject: [PATCH] ARC: show detaled ActionPoint configuration in mumbojumbo
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181228164444.11241-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add information about ActionPointis number and supported set
of targets (minimum / full).

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  8 +++++++
 arch/arc/kernel/setup.c        | 53 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 49bfbd879caa..aa673e27add5 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -216,6 +216,14 @@ struct bcr_fp_arcv2 {
 #endif
 };
 
+struct bcr_actionpoint {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int pad:20, type:4, ver:8;
+#else
+	unsigned int ver:8, type:4, pad:20;
+#endif
+};
+
 #include <soc/arc/timers.h>
 
 struct bcr_bpu_arcompact {
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index b2cae79a25d7..c8d67f9cd40d 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -115,6 +115,47 @@ static void read_decode_ccm_bcr(struct cpuinfo_arc *cpu)
 	}
 }
 
+static bool actionpoints_exists(void)
+{
+	struct bcr_actionpoint bcr;
+
+	READ_BCR(ARC_REG_AP_BCR, bcr);
+	return !!bcr.ver;
+}
+
+static const char *actionpoints_configuration(void)
+{
+	struct bcr_actionpoint bcr;
+
+	READ_BCR(ARC_REG_AP_BCR, bcr);
+	switch (bcr.type) {
+	case 0x0:
+		return "2, full";
+	case 0x1:
+		return "4, full";
+	case 0x2:
+		return "8, full";
+	case 0x4:
+		return "2, minimum";
+	case 0x5:
+		return "4, minimum";
+	case 0x6:
+		return "8, minimum";
+
+	default:
+		return "unknown";
+	}
+}
+
+static int actionpoints_mumbojumbo(char *buf, int len)
+{
+	if (!actionpoints_exists())
+		return 0;
+
+	return scnprintf(buf, len, "ActionPoint (%s set)",
+			 actionpoints_configuration());
+}
+
 static void read_arc_build_cfg_regs(void)
 {
 	struct bcr_timer timer;
@@ -206,8 +247,7 @@ static void read_arc_build_cfg_regs(void)
 		}
 	}
 
-	READ_BCR(ARC_REG_AP_BCR, bcr);
-	cpu->extn.ap = bcr.ver ? 1 : 0;
+	cpu->extn.ap = actionpoints_exists();
 
 	READ_BCR(ARC_REG_SMART_BCR, bcr);
 	cpu->extn.smart = bcr.ver ? 1 : 0;
@@ -332,12 +372,15 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
 			       IS_AVAIL1(cpu->extn.fpu_sp, "SP "),
 			       IS_AVAIL1(cpu->extn.fpu_dp, "DP "));
 
-	if (cpu->extn.debug)
-		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s%s\n",
-			       IS_AVAIL1(cpu->extn.ap, "ActionPoint "),
+	if (cpu->extn.debug) {
+		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s",
 			       IS_AVAIL1(cpu->extn.smart, "smaRT "),
 			       IS_AVAIL1(cpu->extn.rtt, "RTT "));
 
+		n += actionpoints_mumbojumbo(buf + n, len - n);
+		n += scnprintf(buf + n, len - n, "\n");
+	}
+
 	if (cpu->dccm.sz || cpu->iccm.sz)
 		n += scnprintf(buf + n, len - n, "Extn [CCM]\t: DCCM @ %x, %d KB / ICCM: @ %x, %d KB\n",
 			       cpu->dccm.base_addr, TO_KB(cpu->dccm.sz),
-- 
2.14.5
