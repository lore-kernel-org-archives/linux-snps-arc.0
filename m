From: noamc@ezchip.com (Noam Camus)
Date: Tue, 1 Dec 2015 15:03:03 +0200
Subject: [PATCH v3 16/18] ARC: [plat-eznps] Use dedicated cpu_relax()
In-Reply-To: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448974985-11487-17-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Tal Zilcer <talz@ezchip.com>

Since the CTOP is SMT hardware multi-threaded, we need to hint
the HW that now will be a very good time to do a hardware
thread context switching. This is done by issuing the schd.rw
instruction (binary coded here so as to not require specific
revision of GCC to build the kernel).
sched.rw means that Thread becomes eligible for execution by
the threads scheduler after all pending read/write
transactions were completed.

Implementing cpu_relax_lowlatency() with barrier()
Since with current semantics of cpu_relax() it may take a
while till yielded CPU will get back.

Signed-off-by: Noam Camus <noamc at ezchip.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/processor.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index 41142ab..974b878 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -57,9 +57,18 @@ struct task_struct;
  * A lot of busy-wait loops in SMP are based off of non-volatile data otherwise
  * get optimised away by gcc
  */
+#ifndef CONFIG_EZNPS_MTM_EXT
 #define cpu_relax()	__asm__ __volatile__ ("" : : : "memory")
+#else
+#define cpu_relax()     \
+	__asm__ __volatile__ (".word %0" : : "i"(CTOP_INST_SCHD_RW) : "memory")
+#endif
 
+#ifndef CONFIG_EZNPS_MTM_EXT
 #define cpu_relax_lowlatency() cpu_relax()
+#else
+#define cpu_relax_lowlatency() barrier()
+#endif
 
 #define copy_segments(tsk, mm)      do { } while (0)
 #define release_segments(mm)        do { } while (0)
-- 
1.7.1
