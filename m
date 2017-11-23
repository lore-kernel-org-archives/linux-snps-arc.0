From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 23 Nov 2017 13:21:55 +0300
Subject: [PATCH] ARC: Reverse logic of enabled dual-issue detection
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171123102155.40447-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As per PRM bit #0 ("D") in EXEC_CTRL enables dual-issue if set to 0,
otherwise if set to 1 all instructions are executed one at a time,
i.e. dual-issue is disabled.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index fb83844daeea..3411b2da164c 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -200,7 +200,7 @@ static void read_arc_build_cfg_regs(void)
 
 			READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
 			cpu->extn.dual_iss_exist = 1;
-			cpu->extn.dual_iss_enb = exec_ctrl & 1;
+			cpu->extn.dual_iss_enb = !(exec_ctrl & 1);
 		}
 	}
 
-- 
2.11.0
