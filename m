From: sashal@kernel.org (Sasha Levin)
Date: Tue,  3 Sep 2019 12:23:21 -0400
Subject: [PATCH AUTOSEL 4.19 049/167] ARC: show_regs: lockdep: re-enable
 preemption
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190903162519.7136-49-sashal@kernel.org>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit f731a8e89f8c78985707c626680f3e24c7a60772 ]

signal handling core calls show_regs() with preemption disabled which
on ARC takes mmap_sem for mm/vma access, causing lockdep splat.

| [ARCLinux]# ./segv-null-ptr
| potentially unexpected fatal signal 11.
| BUG: sleeping function called from invalid context at kernel/fork.c:1011
| in_atomic(): 1, irqs_disabled(): 0, pid: 70, name: segv-null-ptr
| no locks held by segv-null-ptr/70.
| CPU: 0 PID: 70 Comm: segv-null-ptr Not tainted 4.18.0+ #69
|
| Stack Trace:
|  arc_unwind_core+0xcc/0x100
|  ___might_sleep+0x17a/0x190
|  mmput+0x16/0xb8
|  show_regs+0x52/0x310
|  get_signal+0x5ee/0x610
|  do_signal+0x2c/0x218
|  resume_user_mode_begin+0x90/0xd8

Workaround by re-enabling preemption temporarily.

Note that the preemption disabling in core code around show_regs()
was introduced by commit 3a9f84d354ce ("signals, debug: fix BUG: using
smp_processor_id() in preemptible code in print_fatal_signal()")

to silence a differnt lockdep seen on x86 bakc in 2009.

Cc: <stable at vger.kernel.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 arch/arc/kernel/troubleshoot.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index 5c6663321e873..215f515442e03 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -179,6 +179,12 @@ void show_regs(struct pt_regs *regs)
 	struct task_struct *tsk = current;
 	struct callee_regs *cregs;
 
+	/*
+	 * generic code calls us with preemption disabled, but some calls
+	 * here could sleep, so re-enable to avoid lockdep splat
+	 */
+	preempt_enable();
+
 	print_task_path_n_nm(tsk);
 	show_regs_print_info(KERN_INFO);
 
@@ -221,6 +227,8 @@ void show_regs(struct pt_regs *regs)
 	cregs = (struct callee_regs *)current->thread.callee_reg;
 	if (cregs)
 		show_callee_regs(cregs);
+
+	preempt_disable();
 }
 
 void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
-- 
2.20.1
