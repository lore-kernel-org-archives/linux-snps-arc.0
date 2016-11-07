From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 7 Nov 2016 10:50:35 -0800
Subject: [PATCH] ARC: tweak semantics of userspace cmpxchg assist
In-Reply-To: <b40add73-bd5f-9cf3-7c60-d5cfa9bfeb7e@synopsys.com>
References: <b40add73-bd5f-9cf3-7c60-d5cfa9bfeb7e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478544635-5525-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The original code only used to return errno to indicate if cmpxchg
succeeded. It was not returning the "previous" value which typical cmpxhg
callers are interested in to build their slowpaths or retry loops.
Given user preemption in syscall return path etc, it is not wise to
check this in userspace afterwards, but should what kernel actually
observed in the syscall.

So change the syscall interface to always return the previous value and
additionally set Z flag to indicate whether operation succeeded or not
(just like ARM implementation when they used ot have this syscall)
The flag approach avoids having to put_user errno and specially when
the use case for this syscall cares mostly about the "previous" value.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/arcregs.h |  2 ++
 arch/arc/kernel/process.c      | 20 +++++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 7f3f9f63708c..1bd24ec3e350 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -43,12 +43,14 @@
 #define STATUS_AE_BIT		5	/* Exception active */
 #define STATUS_DE_BIT		6	/* PC is in delay slot */
 #define STATUS_U_BIT		7	/* User/Kernel mode */
+#define STATUS_Z_BIT            11
 #define STATUS_L_BIT		12	/* Loop inhibit */
 
 /* These masks correspond to the status word(STATUS_32) bits */
 #define STATUS_AE_MASK		(1<<STATUS_AE_BIT)
 #define STATUS_DE_MASK		(1<<STATUS_DE_BIT)
 #define STATUS_U_MASK		(1<<STATUS_U_BIT)
+#define STATUS_Z_MASK		(1<<STATUS_Z_BIT)
 #define STATUS_L_MASK		(1<<STATUS_L_BIT)
 
 /*
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 59aa43cb146e..a41a79a4f4fe 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -43,8 +43,8 @@ SYSCALL_DEFINE0(arc_gettls)
 
 SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
 {
-	int uval;
-	int ret;
+	struct pt_regs *regs = current_pt_regs();
+	int uval = -EFAULT;
 
 	/*
 	 * This is only for old cores lacking LLOCK/SCOND, which by defintion
@@ -54,24 +54,26 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
 	 */
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_SMP));
 
+	/* Z indicates to userspace if operation succeded */
+	regs->status32 &= ~STATUS_Z_MASK;
+
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
 		return -EFAULT;
 
 	preempt_disable();
 
-	ret = __get_user(uval, uaddr);
-	if (ret)
+	if (__get_user(uval, uaddr))
 		goto done;
 
-	if (uval != expected)
-		ret = -EAGAIN;
-	else
-		ret = __put_user(new, uaddr);
+	if (uval == expected) {
+		if (!__put_user(new, uaddr))
+			regs->status32 |= STATUS_Z_MASK;
+	}
 
 done:
 	preempt_enable();
 
-	return ret;
+	return uval;
 }
 
 void arch_cpu_idle(void)
-- 
2.7.4
