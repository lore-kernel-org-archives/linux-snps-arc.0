From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:52 -0800
Subject: [PATCH v2 12/15] ARC: Build Infrastructure
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-13-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                  | 13 +++++++++++++
 sysdeps/arc/Implies                        |  4 ++++
 sysdeps/arc/Makefile                       | 25 +++++++++++++++++++++++++
 sysdeps/arc/Versions                       |  6 ++++++
 sysdeps/arc/configure                      | 14 ++++++++++++++
 sysdeps/arc/configure.ac                   | 11 +++++++++++
 sysdeps/arc/nptl/Makefile                  | 22 ++++++++++++++++++++++
 sysdeps/arc/preconfigure                   | 14 ++++++++++++++
 sysdeps/unix/sysv/linux/arc/Implies        |  3 +++
 sysdeps/unix/sysv/linux/arc/Makefile       | 20 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/Versions       | 16 ++++++++++++++++
 sysdeps/unix/sysv/linux/arc/configure      |  4 ++++
 sysdeps/unix/sysv/linux/arc/configure.ac   |  4 ++++
 sysdeps/unix/sysv/linux/arc/shlib-versions |  2 ++
 14 files changed, 158 insertions(+)
 create mode 100644 sysdeps/arc/Implies
 create mode 100644 sysdeps/arc/Makefile
 create mode 100644 sysdeps/arc/Versions
 create mode 100644 sysdeps/arc/configure
 create mode 100644 sysdeps/arc/configure.ac
 create mode 100644 sysdeps/arc/nptl/Makefile
 create mode 100644 sysdeps/arc/preconfigure
 create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
 create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
 create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions

diff --git a/ChangeLog b/ChangeLog
index 3fb8c7c14cae..d8ecb7d233c5 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -86,6 +86,19 @@
 	* sysdeps/unix/sysv/linux/arc/libutil.abilist: New file.
 	* sysdeps/unix/sysv/linux/arc/localplt.data: New file.
 	* sysdeps/unix/sysv/linux/syscall-names.list: Update for ARC.
+	* sysdeps/arc/Implies: New file.
+	* sysdeps/arc/Makefile: New file.
+	* sysdeps/arc/Versions: New file.
+	* sysdeps/arc/configure: New file.
+	* sysdeps/arc/configure.ac: New file.
+	* sysdeps/arc/nptl/Makefile: New file.
+	* sysdeps/arc/preconfigure: New file.
+	* sysdeps/unix/sysv/linux/arc/Implies: New file.
+	* sysdeps/unix/sysv/linux/arc/Makefile: New file.
+	* sysdeps/unix/sysv/linux/arc/Versions: New file.
+	* sysdeps/unix/sysv/linux/arc/configure: New file.
+	* sysdeps/unix/sysv/linux/arc/configure.ac: New file.
+	* sysdeps/unix/sysv/linux/arc/shlib-versions: New file.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/sysdeps/arc/Implies b/sysdeps/arc/Implies
new file mode 100644
index 000000000000..a0f0b00cfac2
--- /dev/null
+++ b/sysdeps/arc/Implies
@@ -0,0 +1,4 @@
+init_array
+wordsize-32
+ieee754/flt-32
+ieee754/dbl-64
diff --git a/sysdeps/arc/Makefile b/sysdeps/arc/Makefile
new file mode 100644
index 000000000000..8d2fbe00c5e1
--- /dev/null
+++ b/sysdeps/arc/Makefile
@@ -0,0 +1,25 @@
+# ARC Makefile
+# Copyright (C) 1993-2019 Free Software Foundation, Inc.
+# This file is part of the GNU C Library.
+
+# The GNU C Library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+
+# The GNU C Library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+
+# You should have received a copy of the GNU Lesser General Public
+# License along with the GNU C Library.  If not, see
+# <http://www.gnu.org/licenses/>.
+
+# We don't support long doubles as a distinct type.  We don't need to set
+# this variable; it's here mostly for documentational purposes.
+long-double-fcts = no
+
+ifeq ($(subdir),debug)
+CFLAGS-backtrace.c += -funwind-tables
+endif
diff --git a/sysdeps/arc/Versions b/sysdeps/arc/Versions
new file mode 100644
index 000000000000..a41ad34f953d
--- /dev/null
+++ b/sysdeps/arc/Versions
@@ -0,0 +1,6 @@
+libc {
+  GLIBC_2.29 {
+    __syscall_error;
+    __mcount;
+  }
+}
diff --git a/sysdeps/arc/configure b/sysdeps/arc/configure
new file mode 100644
index 000000000000..52e286da2ebb
--- /dev/null
+++ b/sysdeps/arc/configure
@@ -0,0 +1,14 @@
+# This file is generated from configure.ac by Autoconf.  DO NOT EDIT!
+ # Local configure fragment for sysdeps/arc.
+
+$as_echo "#define PI_STATIC_AND_HIDDEN 1" >>confdefs.h
+
+libc_cv_have_sdata_section=no
+
+# For ARC, historically ; was used for comments and not newline
+# Later # also got added to comment list, but ; couldn't be switched to
+# canonical newline as there's lots of code out there which will break
+libc_cv_asm_line_sep='`'
+cat >>confdefs.h <<_ACEOF
+#define ASM_LINE_SEP $libc_cv_asm_line_sep
+_ACEOF
diff --git a/sysdeps/arc/configure.ac b/sysdeps/arc/configure.ac
new file mode 100644
index 000000000000..1074d312f033
--- /dev/null
+++ b/sysdeps/arc/configure.ac
@@ -0,0 +1,11 @@
+GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+# Local configure fragment for sysdeps/arc.
+
+AC_DEFINE(PI_STATIC_AND_HIDDEN)
+libc_cv_have_sdata_section=no
+
+# For ARC, historically ; was used for comments and not newline
+# Later # also got added to comment list, but ; couldn't be switched to
+# canonical newline as there's lots of code out there which will break
+libc_cv_asm_line_sep='`'
+AC_DEFINE_UNQUOTED(ASM_LINE_SEP, $libc_cv_asm_line_sep)
diff --git a/sysdeps/arc/nptl/Makefile b/sysdeps/arc/nptl/Makefile
new file mode 100644
index 000000000000..3c33c9cc1128
--- /dev/null
+++ b/sysdeps/arc/nptl/Makefile
@@ -0,0 +1,22 @@
+# NPTL makefile fragment for ARC.
+# Copyright (C) 2005-2019 Free Software Foundation, Inc.
+#
+# This file is part of the GNU C Library.
+#
+# The GNU C Library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# The GNU C Library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with the GNU C Library.  If not, see
+# <http://www.gnu.org/licenses/>.
+
+ifeq ($(subdir),csu)
+gen-as-const-headers += tcb-offsets.sym
+endif
diff --git a/sysdeps/arc/preconfigure b/sysdeps/arc/preconfigure
new file mode 100644
index 000000000000..1152a179c4aa
--- /dev/null
+++ b/sysdeps/arc/preconfigure
@@ -0,0 +1,14 @@
+case "$machine" in
+arc*)
+	base_machine=arc
+	machine=arc
+	;;
+esac
+
+gccfloat=`$CC $CFLAGS $CPPFLAGS -E -dM -xc /dev/null | grep __ARC_FPU_| wc -l`
+if test "$gccfloat" != "0"; then
+	echo "glibc being configured for double precision floating point"
+	with_fp_cond=1
+else
+	with_fp_cond=0
+fi
diff --git a/sysdeps/unix/sysv/linux/arc/Implies b/sysdeps/unix/sysv/linux/arc/Implies
new file mode 100644
index 000000000000..7f739a0340b6
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Implies
@@ -0,0 +1,3 @@
+arc/nptl
+unix/sysv/linux/generic/wordsize-32
+unix/sysv/linux/generic
diff --git a/sysdeps/unix/sysv/linux/arc/Makefile b/sysdeps/unix/sysv/linux/arc/Makefile
new file mode 100644
index 000000000000..a6c6dfc6ec64
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Makefile
@@ -0,0 +1,20 @@
+ifeq ($(subdir),stdlib)
+gen-as-const-headers += ucontext_i.sym
+endif
+
+ifeq ($(subdir),signal)
+sysdep_routines += sigrestorer
+endif
+
+ifeq ($(subdir),misc)
+# MIPS/Tile-style cacheflush routine
+sysdep_headers += sys/cachectl.h
+sysdep_routines += cacheflush
+endif
+
+ifeq ($(subdir),elf)
+ifeq ($(build-shared),yes)
+# This is needed for DSO loading from static binaries.
+sysdep-dl-routines += dl-static
+endif
+endif
diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
new file mode 100644
index 000000000000..3d12161f7fe2
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Versions
@@ -0,0 +1,16 @@
+ld {
+  GLIBC_PRIVATE {
+    # used for loading by static libraries
+    _dl_var_init;
+  }
+}
+libc {
+  GLIBC_2.29 {
+    _flush_cache;
+    cacheflush;
+  }
+  GLIBC_PRIVATE {
+    # A copy of sigaction lives in libpthread, and needs these.
+    __default_rt_sa_restorer;
+  }
+}
diff --git a/sysdeps/unix/sysv/linux/arc/configure b/sysdeps/unix/sysv/linux/arc/configure
new file mode 100644
index 000000000000..f74fa7cb0259
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/configure
@@ -0,0 +1,4 @@
+# This file is generated from configure.in by Autoconf.  DO NOT EDIT!
+ # Local configure fragment for sysdeps/unix/sysv/linux/arc.
+
+arch_minimum_kernel=3.9.0
diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
new file mode 100644
index 000000000000..a9528032d32a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/configure.ac
@@ -0,0 +1,4 @@
+GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+# Local configure fragment for sysdeps/unix/sysv/linux/arc.
+
+arch_minimum_kernel=3.9.0
diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
new file mode 100644
index 000000000000..e527acd77892
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
@@ -0,0 +1,2 @@
+DEFAULT                 GLIBC_2.29
+ld=ld-linux-arc.so.2
-- 
2.7.4
