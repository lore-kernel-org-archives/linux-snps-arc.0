From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 20 Sep 2018 23:42:27 +0300
Subject: [PATCH v2 4/9] nspr: Add ARC support
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180920204232.10583-5-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Antoine Tenart <antoine.tenart@bootlin.com>

[Alexey: Rebased on top of other patches like RiscV, NIOS2 etc]

Signed-off-by: Antoine Tenart <antoine.tenart at bootlin.com>
Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

Changes v1 -> v2:

 * Added upstream status

 .../nspr/nspr/0004-Add-ARC-support.patch           | 88 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.19.bb             |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch

diff --git a/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch b/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
new file mode 100644
index 0000000000..9d686017df
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
@@ -0,0 +1,88 @@
+From 6cb5b0be8837222a1e01745f2cf57cd0e593186d Mon Sep 17 00:00:00 2001
+From: Antoine Tenart <antoine.tenart at free-electrons.com>
+Date: Mon, 23 Oct 2017 10:28:20 +0200
+Subject: [PATCH] Add ARC support
+
+[Alexey: Rebased on top of other patches like RiscV, NIOS2 etc].
+
+Signed-off-by: Antoine Tenart <antoine.tenart at bootlin.com>
+Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
+
+Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1492378 ]
+---
+ pr/include/md/_linux.cfg | 45 ++++++++++++++++++++++++++++++++++++++++
+ pr/include/md/_linux.h   |  2 ++
+ 2 files changed, 47 insertions(+)
+
+diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
+index fec8525378dc..5f4fa0eac783 100644
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -1157,6 +1157,51 @@
+ #define PR_BYTES_PER_WORD_LOG2  3
+ #define PR_BYTES_PER_DWORD_LOG2 3
+ 
++#elif defined(__arc__)
++
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
+index 8e04fad479a1..628b1217e9c8 100644
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
+@@ -63,6 +63,8 @@
+ #define _PR_SI_ARCHITECTURE "riscv32"
+ #elif defined(__riscv) && (__riscv_xlen == 64)
+ #define _PR_SI_ARCHITECTURE "riscv64"
++#elif defined(__arc__)
++#define _PR_SI_ARCHITECTURE "arc"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.19.bb
index b5264be2a0..0212be7f40 100644
--- a/meta/recipes-support/nspr/nspr_4.19.bb
+++ b/meta/recipes-support/nspr/nspr_4.19.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
+           file://0004-Add-ARC-support.patch \
            file://nspr.pc.in \
 "
 
-- 
2.16.2
