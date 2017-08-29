From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Tue, 29 Aug 2017 10:14:20 +0100
Subject: [PATCH] arc: Show fault information passed to show_kernel_fault_diag()
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <aa1a840470a895c0eae5e53054af43f27360d019.1503998005.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Currently we pass a string argument to show_kernel_fault_diag() which
describes the reason for the fault. This is not being used so just
add a pr_info() which outputs the fault information.

With this change we get from:
--------------------------
Path: /bin/busybox
CPU: 0 PID: 92 Comm: modprobe Not tainted 4.12.0-rc6 #30
task: 9a254780 task.stack: 9a212000

[ECR   ]: 0x00200400 => Other Fatal Err
--------------------------
to:
--------------------------
Machine Check Exception
Path: /bin/busybox
CPU: 0 PID: 92 Comm: modprobe Not tainted 4.12.0-rc6 #37
task: 9a240780 task.stack: 9a226000

[ECR   ]: 0x00200400 => Other Fatal Err
--------------------------

Which can help debugging.

Signed-off-by: Jose Abreu <joabreu at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
---
 arch/arc/kernel/troubleshoot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index f9caf79..03f0654 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -233,6 +233,9 @@ void show_kernel_fault_diag(const char *str, struct pt_regs *regs,
 {
 	current->thread.fault_address = address;
 
+	/* Show fault description */
+	pr_info("\n%s\n", str);
+
 	/* Caller and Callee regs */
 	show_regs(regs);
 
-- 
1.9.1
