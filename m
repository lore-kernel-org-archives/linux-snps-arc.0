From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:54 +0300
Subject: [RFC 6/6] ARC: Fix several testsuite failures related to unwinding
In-Reply-To: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-7-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

1. Add BLINK clobber to syscall wrappers allowing unwinding off of
   sleeping syscalls
   (this is arguably excessive, give it is not needed except for a
   handful of slow syscalls such as read/write/nanosleep...)

2. Rework sigreturn to undo above since we don't want BLINK spilled
   on stack for this specific case

3. Add dwarf CFI psuedo-ops to various syscall generators

Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 sysdeps/arc/dl-trampoline.S                 |  9 +++++++++
 sysdeps/arc/sysdep.h                        |  2 ++
 sysdeps/unix/sysv/linux/arc/sigaction.c     |  7 ++++++-
 sysdeps/unix/sysv/linux/arc/sysdep-cancel.h |  4 ++++
 sysdeps/unix/sysv/linux/arc/sysdep.h        | 12 ++++++++----
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
index 0e781af8380e..06fd7ff9a667 100644
--- a/sysdeps/arc/dl-trampoline.S
+++ b/sysdeps/arc/dl-trampoline.S
@@ -37,11 +37,16 @@
 	st.a	r7, [sp, -4]
 	st.a	r8, [sp, -4]
 	st.a	r9, [sp, -4]
+	cfi_adjust_cfa_offset (40)
 	push_s	blink
+	cfi_adjust_cfa_offset (4)
+	cfi_rel_offset (blink, 0)
 .endm
 
 .macro RESTORE_CALLER_SAVED_BUT_R0
 	ld.ab	blink,[sp, 4]
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (blink)
 	ld.ab	r9, [sp, 4]
 	ld.ab	r8, [sp, 4]
 	ld.ab	r7, [sp, 4]
@@ -51,6 +56,7 @@
 	pop_s   r3
 	pop_s   r2
 	pop_s   r1
+	cfi_adjust_cfa_offset (-36)
 .endm
 
 ; Upon entry, PLTn, which led us here, sets up the following regs
@@ -69,4 +75,7 @@ ENTRY(_dl_runtime_resolve)
 	RESTORE_CALLER_SAVED_BUT_R0
 	j_s.d   [r0]    ; r0 has resolved function addr
 	pop_s   r0      ; restore first arg to resolved call
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (r0)
+
 END(_dl_runtime_resolve)
diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
index d57f1c0c60a4..c4495bd877c9 100644
--- a/sysdeps/arc/sysdep.h
+++ b/sysdeps/arc/sysdep.h
@@ -32,10 +32,12 @@
     .globl C_SYMBOL_NAME(name)			ASM_LINE_SEP	\
     .type C_SYMBOL_NAME(name),%function		ASM_LINE_SEP	\
   C_LABEL(name)					ASM_LINE_SEP	\
+    cfi_startproc				ASM_LINE_SEP	\
     CALL_MCOUNT
 
 #undef  END
 #define END(name)						\
+  cfi_endproc					ASM_LINE_SEP	\
   ASM_SIZE_DIRECTIVE(name)
 
 #ifdef SHARED
diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
index 2bd7b0f08ddc..e2b898039df1 100644
--- a/sysdeps/unix/sysv/linux/arc/sigaction.c
+++ b/sysdeps/unix/sysv/linux/arc/sigaction.c
@@ -26,7 +26,12 @@
  */
 static void __default_rt_sa_restorer(void)
 {
-	INTERNAL_SYSCALL_NCS(__NR_rt_sigreturn, , 0);
+	/* Don't use INTERNAL_SYSCALL_NCS as it causes blink to be spilled on stack */
+	asm volatile(
+		"mov r8, %0	\n\t"	\
+		ARC_TRAP_INSN		\
+	:
+	: "r"(__NR_rt_sigreturn));
 }
 
 #define SA_RESTORER	0x04000000
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
index db89ad033a79..b2dbb8670874 100644
--- a/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+++ b/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
@@ -83,10 +83,14 @@
 
 .macro PUSH reg
 	st.a \reg, [sp, -4]
+	cfi_adjust_cfa_offset (4)
+	cfi_rel_offset (\reg, 0)
 .endm
 
 .macro POP reg
 	ld.ab \reg, [sp, 4]
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (\reg)
 .endm
 
 #define DOCARGS_0	PUSH blink
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
index 507d06a8a575..492a709b51fd 100644
--- a/sysdeps/unix/sysv/linux/arc/sysdep.h
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
@@ -103,8 +103,12 @@
 # define SYSCALL_ERROR_HANDLER					\
 0:						ASM_LINE_SEP	\
     st.a   blink, [sp, -4]			ASM_LINE_SEP	\
+    cfi_adjust_cfa_offset (4)			ASM_LINE_SEP	\
+    cfi_rel_offset (blink, 0)			ASM_LINE_SEP	\
     CALL_ERRNO_SETTER_C				ASM_LINE_SEP	\
     ld.ab  blink, [sp, 4]			ASM_LINE_SEP	\
+    cfi_adjust_cfa_offset (-4)			ASM_LINE_SEP	\
+    cfi_restore (blink)				ASM_LINE_SEP	\
     j      [blink]
 
 # define DO_CALL(syscall_name, args)				\
@@ -137,13 +141,13 @@ hidden_proto (__syscall_error)
 	__res = INTERNAL_SYSCALL_NCS(__NR_##name, , nr_args, args);	\
 	if (__builtin_expect (INTERNAL_SYSCALL_ERROR_P ((__res), ), 0))	\
 	{								\
-		asm volatile ("st.a blink, [sp, -4] \n\t"         	\
+		asm volatile ( \
 			       CALL_ERRNO_SETTER                   	\
-			      "ld.ab blink, [sp, 4] \n\t"         	\
 			      :"+r" (__res)                 		\
 			      :                                   	\
 			      :"r1","r2","r3","r4","r5","r6",		\
-			        "r7","r8","r9","r10","r11","r12");	\
+			        "r7","r8","r9","r10","r11","r12",	\
+			        "blink");				\
 	}								\
 	__res;								\
 })
@@ -174,7 +178,7 @@ hidden_proto (__syscall_error)
 		ARC_TRAP_INSN				\
 		: "+r" (__ret)				\
 		: "r"(_sys_num) ASM_ARGS_##nr_args	\
-		: "memory");				\
+		: "memory", "blink");				\
                                                         \
 	__ret;						\
 })
-- 
2.7.4
