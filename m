From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 30 Jan 2019 19:32:44 +0300
Subject: [PATCH v2 5/5] ARC: boot log: print unaligned memory access details
In-Reply-To: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
References: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190130163244.10870-6-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This now prints both HW feature status (exists, enabled / disabled)
and SW status (used / not used).

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/setup.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index feb90093e6b1..e465cae3f661 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -270,10 +270,17 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
 #ifdef __ARC_UNALIGNED__
 	ua = 1;
 #endif
-	n += i = scnprintf(buf + n, len - n, "%s%s%s%s%s%s",
+	n += i = scnprintf(buf + n, len - n, "%s%s%s%s",
 			   IS_AVAIL2(cpu->isa.atomic, "atomic ", CONFIG_ARC_HAS_LLSC),
-			   IS_AVAIL2(cpu->isa.ldd, "ll64 ", CONFIG_ARC_HAS_LL64),
-			   IS_AVAIL1(cpu->isa.unalign, "unalign "), IS_USED_RUN(ua));
+			   IS_AVAIL2(cpu->isa.ldd, "ll64 ", CONFIG_ARC_HAS_LL64));
+
+	if (cpu->isa.unalign) {
+		i += scnprintf(buf + n, len - n, "unalign (%s, %s)",
+			       IS_ENABLED(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS) ?
+					  "enabled" : "disabled",
+			       ua ? "used" : "not used");
+		n += i;
+	}
 
 	if (i)
 		n += scnprintf(buf + n, len - n, "\n\t\t: ");
-- 
2.14.5
