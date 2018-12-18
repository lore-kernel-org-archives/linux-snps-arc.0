From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:36 -0800
Subject: [PATCH 14/21] ARC: Enable __start as entry point vs. canonical _start
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-15-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

ARC linker scripts have defined __start as entry point so to not break
ABI for uClibc et al we allow __start for glibc as well

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                |  3 +++
 sysdeps/arc/dl-machine.h | 14 ++++++++++----
 sysdeps/arc/entry.h      |  5 +++++
 sysdeps/arc/start.S      | 14 +++++++++++---
 4 files changed, 29 insertions(+), 7 deletions(-)
 create mode 100644 sysdeps/arc/entry.h

diff --git a/ChangeLog b/ChangeLog
index 6628960c487e..86e4db890850 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -105,6 +105,9 @@
 	* sysdeps/unix/sysv/linux/arc/configure: New file.
 	* sysdeps/unix/sysv/linux/arc/configure.ac: New file.
 	* sysdeps/unix/sysv/linux/arc/shlib-versions: New file.
+	* sysdeps/arc/dl-machine.h: replace _start with __start.
+	* sysdeps/arc/start.S: likewise.
+	* sysdeps/arc/entry.h: Add ENTRY_POINT define check.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
index da1aef79152d..02727a3a4d47 100644
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
@@ -150,9 +156,9 @@ elf_machine_runtime_setup (struct link_map *l, int lazy, int profile)
 
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
@@ -182,7 +188,7 @@ _start:								\n\
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
index 119d596db07f..79e73e27d00d 100644
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
