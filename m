From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 16 Jan 2017 12:57:56 -0800
Subject: [PATCH 3/4] ARCv2: smp: MCIP: remove debug aid to halt all cores when
 one halts
In-Reply-To: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1484600277-32345-4-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was really usefull when doing initial bringup and also for
occassional debug of software and hardware bugs. However in the new
smp-boot regime, non masters will "self" halt even for run-on-reset
configs. This will misinteract with the debug feature as in even master
will get halted when the non masters self halt.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/mcip.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index f39142acc89e..933382e0edd0 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -101,11 +101,6 @@ static void mcip_probe_n_setup(void)
 		IS_AVAIL1(mp.gfrc, "GFRC"));
 
 	cpuinfo_arc700[0].extn.gfrc = mp.gfrc;
-
-	if (mp.dbg) {
-		__mcip_cmd_data(CMD_DEBUG_SET_SELECT, 0, 0xf);
-		__mcip_cmd_data(CMD_DEBUG_SET_MASK, 0xf, 0xf);
-	}
 }
 
 struct plat_smp_ops plat_smp_ops = {
-- 
2.7.4
