From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 5 Oct 2018 14:19:21 -0700
Subject: [PATCH] ARC: clone syscall to setp r25 as thread pointer
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1538774361-9306-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Per ARC TLS ABI, r25 is designated TP (thread pointer register).
However so far kernel didn't do any special treatment, like setting up
usermode r25, even for CLONE_SETTLS. We instead relied on libc runtime
to do this, in say clone libc wrapper [1]. This was deliberate to keep
kernel ABI agnostic (userspace could potentially change TP, specially
for different ARC ISA say ARCompact vs. ARCv2 with different spare
registers etc)

However userspace setting up r25, after clone syscall opens a race, if
child is not scheduled and gets a signal instead. It starts off in
userspace not in clone but in a signal handler and anything TP sepcific
there such as pthread_self() fails which showed up with uClibc
testsuite nptl/tst-kill6 [2]

Fix this by having kernel populate r25 to TP value. So this locks in
ABI, but it was not going to change anyways, and fwiw is same for both
ARCompact (arc700 core) and ARCvs (HS3x cores)

[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libc/sysdeps/linux/arc/clone.S
[2] https://github.com/wbx-github/uclibc-ng-test/blob/master/test/nptl/tst-kill6.c

Fixes: ARC STAR 9001378481
Cc: stable at vger.kernel.org
Reported-by: Nikita Sobolev <sobolev at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/process.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 4674541eba3f..c29fa8ceb2d6 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -241,6 +241,26 @@ int copy_thread(unsigned long clone_flags,
 		task_thread_info(current)->thr_ptr;
 	}
 
+
+	/*
+	 * setup usermode thread pointer #1:
+	 * when child is picked by scheduler, __switch_to() uses @c_callee to
+	 * populate usermode callee regs: this is fine even despite being in a
+	 * kernel function since special return path for child @ret_from_fork()
+	 * ensures those regs are not clobbered all the way to RTIE to usermode
+	 */
+	c_callee->r25 = task_thread_info(p)->thr_ptr;
+
+#ifdef CONFIG_ARC_CURR_IN_REG
+	/*
+	 * setup usermode thread pointer #2:
+	 *   however for this special use of r25 in kernel, __switch_to() sets
+	 *   r25 for kernel needs and only in the final return path is usermode
+	 *   r25 setup, from pt_regs->user_r25. So set that up as well
+	 */
+	c_regs->user_r25 = c_callee->r25;
+#endif
+
 	return 0;
 }
 
-- 
2.7.4
