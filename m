From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:39 -0800
Subject: [PATCH 17/21] ARC: testsuite fix: stdlib/tst-makecontext
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-18-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Terminate the unwinding by telling unwinder to fetch return address
(BLINK) from r15 which has been set apriori to 0.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                 | 2 ++
 sysdeps/unix/sysv/linux/arc/makecontext.c | 1 +
 sysdeps/unix/sysv/linux/arc/setcontext.S  | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index d3a979a9236b..39ff298b0091 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -110,6 +110,8 @@
 	* sysdeps/arc/entry.h: Add ENTRY_POINT define check.
 	* sysdeps/arc/crti.S: add .hidden annotations.
 	* sysdeps/unix/sysv/linux/arc/ipc_priv.h: New file.
+	* sysdeps/unix/sysv/linux/arc/makecontext.c: clear r15.
+	* sysdeps/unix/sysv/linux/arc/setcontext.S: set blink from r15.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/unix/sysv/linux/arc/makecontext.c b/sysdeps/unix/sysv/linux/arc/makecontext.c
index 7018bed9d64a..8d233f83da7e 100644
--- a/sysdeps/unix/sysv/linux/arc/makecontext.c
+++ b/sysdeps/unix/sysv/linux/arc/makecontext.c
@@ -45,6 +45,7 @@ __makecontext (ucontext_t *ucp, void (*func) (void), int argc, ...)
    */
   ucp->uc_mcontext.callee.r13 = (unsigned long) func;
   ucp->uc_mcontext.callee.r14 = (unsigned long) ucp->uc_link;
+  ucp->uc_mcontext.callee.r15 = 0;
 
   r = &ucp->uc_mcontext.scratch.r0;
 
diff --git a/sysdeps/unix/sysv/linux/arc/setcontext.S b/sysdeps/unix/sysv/linux/arc/setcontext.S
index 3f503c661d95..6ec2ec0ddc79 100644
--- a/sysdeps/unix/sysv/linux/arc/setcontext.S
+++ b/sysdeps/unix/sysv/linux/arc/setcontext.S
@@ -79,6 +79,8 @@ weak_alias(__setcontext, setcontext)
 
 ENTRY(__startcontext)
 
+	cfi_register (blink, r15)
+
         /* call user @func, loaded in r13 by setcontext() */
         jl   [r13]
 
-- 
2.7.4
