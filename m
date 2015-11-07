From: noamc@ezchip.com (Noam Camus)
Date: Sat, 7 Nov 2015 12:52:36 +0200
Subject: [PATCH v2 18/19] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446893557-29748-19-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Tal Zilcer <talz@ezchip.com>

In SMT system like we have the generic "sync" is not working with
HW threads. The replacement is "schd.rw" instruction that is served
as cpu barrier for HW threads.
Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 arch/arc/kernel/ctx_sw.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arc/kernel/ctx_sw.c b/arch/arc/kernel/ctx_sw.c
index 92e2e82..2a2f50e 100644
--- a/arch/arc/kernel/ctx_sw.c
+++ b/arch/arc/kernel/ctx_sw.c
@@ -61,7 +61,11 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
 		"st      sp, [r24]       \n\t"
 #endif
 
+#ifdef CONFIG_EZNPS_MTM_EXT
+		".word %5   \n\t"
+#else
 		"sync   \n\t"
+#endif
 
 		/*
 		 * setup _current_task with incoming tsk.
@@ -122,6 +126,9 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
 #ifdef CONFIG_ARC_PLAT_EZNPS
 		, "i"(CTOP_AUX_LOGIC_GLOBAL_ID)
 #endif
+#ifdef CONFIG_EZNPS_MTM_EXT
+		, "i"(CTOP_INST_SCHD_RW)
+#endif
 		: "blink"
 	);
 
-- 
1.7.1
