From: ldv@altlinux.org (Dmitry V. Levin)
Date: Tue, 20 Nov 2018 03:15:49 +0300
Subject: [PATCH v2 07/15] arc: define syscall_get_arch()
In-Reply-To: <20181120001128.GA11300@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181120001549.GG11387@altlinux.org>
To: linux-snps-arc@lists.infradead.org

syscall_get_arch() is required to be implemented on all architectures
in order to extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO
request.

Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
Acked-by: Vineet Gupta <vgupta at synopsys.com>
---
v2: added Acked-by to [PATCH 06/13 v3]

 arch/arc/include/asm/syscall.h | 10 ++++++++++
 include/uapi/linux/audit.h     |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
index 29de09804306..10b2e7523bc8 100644
--- a/arch/arc/include/asm/syscall.h
+++ b/arch/arc/include/asm/syscall.h
@@ -9,6 +9,7 @@
 #ifndef _ASM_ARC_SYSCALL_H
 #define _ASM_ARC_SYSCALL_H  1
 
+#include <uapi/linux/audit.h>
 #include <linux/err.h>
 #include <linux/sched.h>
 #include <asm/unistd.h>
@@ -68,4 +69,13 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+static inline int syscall_get_arch(void)
+{
+	return IS_ENABLED(CONFIG_ISA_ARCOMPACT)
+		? (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)
+			? AUDIT_ARCH_ARCOMPACTBE : AUDIT_ARCH_ARCOMPACT)
+		: (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)
+			? AUDIT_ARCH_ARCV2BE : AUDIT_ARCH_ARCV2);
+}
+
 #endif
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 818ae690ab79..bedf3bf54c3a 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -375,6 +375,10 @@ enum {
 
 #define AUDIT_ARCH_AARCH64	(EM_AARCH64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_ALPHA	(EM_ALPHA|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_ARCOMPACT	(EM_ARCOMPACT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_ARCOMPACTBE	(EM_ARCOMPACT)
+#define AUDIT_ARCH_ARCV2	(EM_ARCV2|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_ARCV2BE	(EM_ARCV2)
 #define AUDIT_ARCH_ARM		(EM_ARM|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_ARMEB	(EM_ARM)
 #define AUDIT_ARCH_CRIS		(EM_CRIS|__AUDIT_ARCH_LE)
-- 
ldv
