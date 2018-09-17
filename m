From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 18 Sep 2018 00:29:43 +0300
Subject: [PATCH 10/10] gcc: Fix specs generation for ARC
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180917212943.27237-11-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

GCC's built-in spec for LD is missing a space after
"--eh-frame-hdr" thus with the next option merged together they
are not understood by LD and so LD fails.

Back-port from upstream GCC, see:
https://github.com/gcc-mirror/gcc/commit/892142379c6b99fe8c3ebdfe0b79e2a435228c1d

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc              |  1 +
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 889187e..866a775 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0039-Fix-for-testsuite-failure.patch \
            file://0040-Re-introduce-spe-commandline-options.patch \
+           file://0041-ARC-fix-spec-gen.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
new file mode 100644
index 0000000..d746d79
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
@@ -0,0 +1,40 @@
+From 892142379c6b99fe8c3ebdfe0b79e2a435228c1d Mon Sep 17 00:00:00 2001
+From: claziss <claziss at 138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 17 Sep 2018 08:52:10 +0000
+Subject: [PATCH] [ARC] Update LINK_EH_SPEC linker spec.
+
+With no trailing space in LINK_EH_SPEC linker spec gets generated as:
+------------------------>8---------------------
+%{!r:--build-id} --eh-frame-hdr%{h*} ...
+------------------------>8---------------------
+
+or even worse if hash style is added:
+------------------------>8---------------------
+%{!r:--build-id} --eh-frame-hdr--hash-style=sysv %{h*} ...
+------------------------>8---------------------
+
+Now if that spec is really used by LD then it fails inevitably
+saying that it doesn't know option "--eh-frame-hdr--hash-style=sysv".
+
+2018-09-17  Alexey Brodkin  <abrodkin at synopsys.com>
+
+	* config/arc/linux.h (LINK_EH_SPEC): Add missing space.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 264361 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/config/arc/linux.h | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
+index 96d548eae341..62ebe4de0fc7 100644
+--- a/gcc/config/arc/linux.h
++++ b/gcc/config/arc/linux.h
+@@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.  If not see
+    Signalize that because we have fde-glibc, we don't need all C shared libs
+    linked against -lgcc_s.  */
+ #undef LINK_EH_SPEC
+-#define LINK_EH_SPEC "--eh-frame-hdr"
++#define LINK_EH_SPEC "--eh-frame-hdr "
+ #endif
+ 
+ #undef SUBTARGET_CPP_SPEC
-- 
1.8.3.1
