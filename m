From: jeffmerkey@gmail.com (Jeffrey Merkey)
Date: Thu, 28 Jan 2016 12:46:44 -0700
Subject: [PATCH 11/31] Add debugger entry points for ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454010404-28845-1-git-send-email-jeffmerkey@gmail.com>
To: linux-snps-arc@lists.infradead.org

This patch series adds an export which can be set by system debuggers to
direct the hard lockup and soft lockup detector to trigger a breakpoint
exception and enter a debugger if one is active.  It is assumed that if
someone sets this variable, then an breakpoint handler of some sort will
be actively loaded or registered via the notify die handler chain.

This addition is extremely useful for debugging hard and soft lockups
real time and quickly from a console debugger.

Signed-off-by: Jeffrey Merkey <jeffmerkey at gmail.com>
---
 arch/arc/include/asm/kdebug.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arc/include/asm/kdebug.h b/arch/arc/include/asm/kdebug.h
index 3fbe6c4..f476ed7 100644
--- a/arch/arc/include/asm/kdebug.h
+++ b/arch/arc/include/asm/kdebug.h
@@ -16,4 +16,8 @@ enum die_val {
 	DIE_OOPS
 };
 
+static inline void arch_breakpoint(void)
+{
+	__asm__ __volatile__ ("trap_s	0x4\n");
+}
 #endif
-- 
1.8.3.1
