From: ldv@altlinux.org (Dmitry V. Levin)
Date: Sat, 10 Nov 2018 02:54:26 +0300
Subject: [PATCH 06/13 v3] arc: define syscall_get_arch()
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075013A59253C@us01wembx1.internal.synopsys.com>
References: <20181109031605.GF21511@altlinux.org>
 <e729da9ed78b6b62463a27d3012ac63c7b66be08.camel@synopsys.com>
 <CALCETrUzfOcLYDUW6s1Ra2xduDCQSbscKBw=vApCP2HNmfDmMw@mail.gmail.com>
 <456a69c6e01a6ab5b1af6d459a249388f8b4c1f5.camel@synopsys.com>
 <C6CF3942-3307-431F-B76C-B550BB48F472@amacapital.net>
 <215d66fd9a197b631973c9ff75943b4c1216b899.camel@synopsys.com>
 <CALCETrXCcBBTzcL_yz3agNhby1huZSn2UGtJ9Soo=8n8_rj1Tg@mail.gmail.com>
 <20181109233342.GC2710@altlinux.org>
 <C2D7FE5348E1B147BCA15975FBA23075013A59253C@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181109235426.GD2710@altlinux.org>
To: linux-snps-arc@lists.infradead.org

syscall_get_arch() is required to be implemented on all architectures
that use tracehook_report_syscall_entry() in order to extend
the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
---
v3: replaced #ifdefs with IS_ENABLED,
    made LE as default, added BE suffixes variants
v2: defined AUDIT_ARCH_ARCOMPACT, AUDIT_ARCH_ARCOMPACTLE, AUDIT_ARCH_ARCV2,
    and AUDIT_ARCH_ARCV2LE instead of AUDIT_ARCH_ARC,
    updated syscall_get_arch() implementation accordingly.

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
