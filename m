From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue,  4 Dec 2018 14:56:53 +0300
Subject: [PATCH] gdb: Remove long ago upstreamed patch
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181204115653.28369-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This fix was upstreamed a long ago, see [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=37ce4055fe907b9edd25498dcda7a133dbd19784

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.inc              |  1 -
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  | 29 ----------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.inc b/meta/recipes-devtools/gdb/gdb-8.2.inc
index dfb0059123..7e0809de72 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
 SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
-           file://0001-include-sys-types.h-for-mode_t.patch \
            file://0002-make-man-install-relative-to-DESTDIR.patch \
            file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
            file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
deleted file mode 100644
index 2c8783e192..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6ae0fb9b49047cef338262e30273f63139fd1261 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem at gmail.com>
-Date: Tue, 19 Jan 2016 18:18:52 -0800
-Subject: [PATCH 01/11] include sys/types.h for mode_t
-
-mode_t is used in target.h, so we need to include sys/types.h to get the
-defintion
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem at gmail.com>
----
- gdb/gdbserver/target.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index fce54e05ad..278cee78a8 100644
---- a/gdb/gdbserver/target.h
-+++ b/gdb/gdbserver/target.h
-@@ -29,6 +29,7 @@
- #include "mem-break.h"
- #include "btrace-common.h"
- #include <vector>
-+#include <sys/types.h>
- 
- struct emit_ops;
- struct buffer;
--- 
-2.18.0
-
-- 
2.16.2
