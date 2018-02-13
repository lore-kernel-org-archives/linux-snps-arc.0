From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 13 Feb 2018 22:35:04 +0300
Subject: [PATCH] ARC: Don't check presense of Timer1 in SMP builds
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180213193504.28671-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In case of SMP we use GFRC from ARconnect and Timer1 is left
untouched. Still with that check in place we're panicing if Timer1
is missing in current hardware which is quite unexpected.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index cf97f7d88934..1142d76a7e8f 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -391,8 +391,10 @@ static void arc_chk_core_config(void)
 	if (!cpu->extn.timer0)
 		panic("Timer0 is not present!\n");
 
+#ifndef CONFIG_SMP
 	if (!cpu->extn.timer1)
 		panic("Timer1 is not present!\n");
+#endif
 
 #ifdef CONFIG_ARC_HAS_DCCM
 	/*
-- 
2.11.0
