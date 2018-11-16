From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 16 Nov 2018 13:44:27 +0300
Subject: [PATCH 3/3] ARC: show detaled SmaRT configuration in mumbojumbo
In-Reply-To: <20181116104427.25264-1-Eugeniy.Paltsev@synopsys.com>
References: <20181116104427.25264-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181116104427.25264-4-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add information about SmaRT entries number and SmaRT SW support.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/setup.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index c5641e6ffc2a..20fe3fcf8306 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -210,8 +210,7 @@ static void read_arc_build_cfg_regs(void)
 	READ_BCR(ARC_REG_AP_BCR, bcr);
 	cpu->extn.ap = bcr.ver ? 1 : 0;
 
-	READ_BCR(ARC_REG_SMART_BCR, bcr);
-	cpu->extn.smart = bcr.ver ? 1 : 0;
+	cpu->extn.smart = smart_exist() ? 1 : 0;
 
 	READ_BCR(ARC_REG_RTT_BCR, bcr);
 	cpu->extn.rtt = bcr.ver ? 1 : 0;
@@ -333,12 +332,20 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
 			       IS_AVAIL1(cpu->extn.fpu_sp, "SP "),
 			       IS_AVAIL1(cpu->extn.fpu_dp, "DP "));
 
-	if (cpu->extn.debug)
-		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s%s\n",
+	if (cpu->extn.debug) {
+		n += scnprintf(buf + n, len - n, "DEBUG\t\t: %s%s",
 			       IS_AVAIL1(cpu->extn.ap, "ActionPoint "),
-			       IS_AVAIL1(cpu->extn.smart, "smaRT "),
 			       IS_AVAIL1(cpu->extn.rtt, "RTT "));
 
+		if (smart_supported())
+			n += scnprintf(buf + n, len - n, "SmaRT (%u entries)\n",
+				       smart_stack_size());
+		else if (smart_exist())
+			n += scnprintf(buf + n, len - n, "SmaRT (outdated)\n");
+		else
+			n += scnprintf(buf + n, len - n, "\n");
+	}
+
 	if (cpu->dccm.sz || cpu->iccm.sz)
 		n += scnprintf(buf + n, len - n, "Extn [CCM]\t: DCCM @ %x, %d KB / ICCM: @ %x, %d KB\n",
 			       cpu->dccm.base_addr, TO_KB(cpu->dccm.sz),
-- 
2.14.5
