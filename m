From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Dec 2015 18:41:05 +0530
Subject: [PATCH] sched/fair: [cosmetic] match ifdef/endif CONFIG_NO_HZ_COMMON
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449580265-8532-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Spotted this when debuggign something completely different and trying to
unravel CONFIG_NO_HZ{,_COMMON,,_IDLE}

It seems we can clean up the legacy CONFIG_NO_HZ option, but first
remove it's proliferation.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f04fda8f669c..0995a3dccd58 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4408,7 +4408,7 @@ void update_cpu_load_nohz(void)
 	}
 	raw_spin_unlock(&this_rq->lock);
 }
-#endif /* CONFIG_NO_HZ */
+#endif /* CONFIG_NO_HZ_COMMON */
 
 /*
  * Called from scheduler_tick()
-- 
1.9.1
