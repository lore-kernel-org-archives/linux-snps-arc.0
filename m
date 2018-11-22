From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 23 Nov 2018 01:38:42 +0300
Subject: [PATCH] arc: Disable LTTng
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181122223842.36893-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

LTTng depends on liburcu which is not yet ported to ARC
so disable LTTng on ARC for now.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 3 +++
 meta/recipes-devtools/gdb/gdb-common.inc                           | 1 +
 meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb                    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 33d9c09a66..762c046636 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -38,13 +38,16 @@ SYSTEMTAP_riscv64 = ""
 # lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-musl = ""
+LTTNGUST_arc = ""
 LTTNGUST_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_libc-musl = ""
+LTTNGTOOLS_arc = ""
 LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
+LTTNGMODULES_arc = ""
 LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index fa64939f26..57bc0dc773 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -4,6 +4,7 @@ SECTION = "devel"
 DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 
 LTTNGUST = "lttng-ust"
+LTTNGUST_arc = ""
 LTTNGUST_aarch64 = ""
 LTTNGUST_riscv64 = ""
 LTTNGUST_mipsarch = ""
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
index 11d7db6848..85ed3c691b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.5.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
+PACKAGECONFIG_remove_arc = "lttng-ust"
 PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-- 
2.16.2
