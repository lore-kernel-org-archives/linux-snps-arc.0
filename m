From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:53 +0300
Subject: [RFC 5/6] ARC: Enable __start as entry point vs. canonical _start
In-Reply-To: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-6-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC linker scripts have defined __start as entry point so to not break
ABI for uClibc et al we allow __start for glibc as well

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 sysdeps/arc/dl-machine.h | 14 ++++++++++----
 sysdeps/arc/entry.h      |  5 +++++
 sysdeps/arc/start.S      | 14 +++++++++++---
 3 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 sysdeps/arc/entry.h

diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
index 3f985702649d..7f9220339e4c 100644
--- a/sysdeps/arc/dl-machine.h
+++ b/sysdeps/arc/dl-machine.h
@@ -21,6 +21,12 @@
 
 #define ELF_MACHINE_NAME "arc"
 
+#include <entry.h>
+
+#ifndef ENTRY_POINT
+#error ENTRY_POINT needs to be defined for ARC
+#endif
+
 #include <string.h>
 #include <link.h>
 #include <dl-tls.h>
@@ -149,9 +155,9 @@ elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
 
 #define RTLD_START asm ("\
 .text								\n\
-.globl _start							\n\
-.type _start, @function						\n\
-_start:								\n\
+.globl __start							\n\
+.type __start, @function					\n\
+__start:							\n\
 	; (1). bootstrap ld.so					\n\
 	bl.d    _dl_start                                       \n\
 	mov_s   r0, sp          ; pass ptr to aux vector tbl    \n\
@@ -181,7 +187,7 @@ _start:								\n\
 	add     r0, pcl, _dl_fini at pcl				\n\
 	j	[r13]						\n\
 								\n\
-	.size  _start,.-_start                                  \n\
+	.size  __start,.-__start                                \n\
 	.previous                                               \n\
 ");
 
diff --git a/sysdeps/arc/entry.h b/sysdeps/arc/entry.h
new file mode 100644
index 000000000000..adb01d981afd
--- /dev/null
+++ b/sysdeps/arc/entry.h
@@ -0,0 +1,5 @@
+#ifndef __ASSEMBLY__
+extern void __start (void) attribute_hidden;
+#endif
+
+#define ENTRY_POINT __start
diff --git a/sysdeps/arc/start.S b/sysdeps/arc/start.S
index 911f7cd3b056..5bdceee3923d 100644
--- a/sysdeps/arc/start.S
+++ b/sysdeps/arc/start.S
@@ -34,7 +34,14 @@
    <http://www.gnu.org/licenses/>.  */
 
 
+#define __ASSEMBLY__ 1
+#include <entry.h>
+#ifndef ENTRY_POINT
+#error ENTRY_POINT needs to be defined for ARC
+#endif
+
 /* When we enter this piece of code, the program stack looks like this:
+
         argc            argument counter (integer)
         argv[0]         program name (pointer)
         argv[1...N]     program args (pointers)
@@ -45,9 +52,9 @@
 */
 	.text
 	.align 4
-	.global _start
-	.type _start, at function
-_start:
+	.global __start
+	.type __start, at function
+__start:
 	mov	fp, 0
 	ld_s	r1, [sp]	; argc
 
@@ -71,6 +78,7 @@ _start:
 
 	/* Should never get here....  */
 	flag    1
+	.size  __start,.-__start
 
 /* Define a symbol for the first piece of initialized data.  */
 	.data
-- 
2.7.4
