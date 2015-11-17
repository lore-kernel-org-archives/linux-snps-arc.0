From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 19:18:00 +0530
Subject: [PATCH] ARC: remove SYNC from __switch_to()
In-Reply-To: <20151102092654.GM17308@twins.programming.kicks-ass.net>
References: <20151102092654.GM17308@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1447768080-16825-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

SYNC in __switch_to() is a historic relic and not needed at all.

 - In UP context it is obviously useless, why would we want to stall
   the core for all updates to stack memory of t0 to complete before
   loading kernel mode callee registers from t1 stack's memory.

 - In SMP, there could be potential race in which outgoing task could
   be concurrently picked for running on a different core, thus writes
   to stack here need to be visible before the reads from stack on
   other core. Peter confirmed that generic schedular already has needed
   barriers (by way of rq lock) so there is no need for additional arch
   barrier.

This came up when Noam was tryign to replace this SYNC with EZChip
specific hardware thread scheduling instruction for their platform support.

Link: http://lkml.kernel.org/r/20151102092654.GM17308 at twins.programming.kicks-ass.net
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: linux-kernel at vger.kernel.org
Cc: Noam Camus <noamc at ezchip.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/ctx_sw.c     | 2 --
 arch/arc/kernel/ctx_sw_asm.S | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/arch/arc/kernel/ctx_sw.c b/arch/arc/kernel/ctx_sw.c
index c14a5bea0c76..5d446df2c413 100644
--- a/arch/arc/kernel/ctx_sw.c
+++ b/arch/arc/kernel/ctx_sw.c
@@ -58,8 +58,6 @@ __switch_to(struct task_struct *prev_task, struct task_struct *next_task)
 		"st      sp, [r24]       \n\t"
 #endif
 
-		"sync   \n\t"
-
 		/*
 		 * setup _current_task with incoming tsk.
 		 * optionally, set r25 to that as well
diff --git a/arch/arc/kernel/ctx_sw_asm.S b/arch/arc/kernel/ctx_sw_asm.S
index e248594097e7..e6890b1f8650 100644
--- a/arch/arc/kernel/ctx_sw_asm.S
+++ b/arch/arc/kernel/ctx_sw_asm.S
@@ -44,9 +44,6 @@ __switch_to:
 	* don't need to do anything special to return it
 	*/
 
-	/* hardware memory barrier */
-	sync
-
 	/*
 	 * switch to new task, contained in r1
 	 * Temp reg r3 is required to get the ptr to store val
-- 
1.9.1
