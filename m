From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 20 Sep 2018 23:42:29 +0300
Subject: [PATCH v2 6/9] icu: Add ARC support
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180920204232.10583-7-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

Changes v1 -> v2:

 * Added upstream status

 .../icu/icu/0002-Add-ARC-support.patch             | 27 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_62.1.bb               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch

diff --git a/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
new file mode 100644
index 0000000000..20e3d8356c
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
@@ -0,0 +1,27 @@
+From fcfd57105b4bdb30d906df152ef01748fa95daff Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin at synopsys.com>
+Date: Thu, 13 Sep 2018 17:13:20 +0300
+Subject: [PATCH] icu: Add ARC support
+
+Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
+
+Upstream-Status: Submitted [ https://github.com/unicode-org/icu/pull/149 ]
+---
+ i18n/double-conversion-utils.h                 | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+index 57fc49b231a3..0bd3e8340673 100644
+--- a/i18n/double-conversion-utils.h
++++ b/i18n/double-conversion-utils.h
+@@ -86,7 +86,7 @@ inline void abort_noreturn() { abort(); }
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__aarch64__) || \
+-    defined(__riscv)
++    defined(__riscv) || defined(__arc__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
+2.17.1
+
diff --git a/meta/recipes-support/icu/icu_62.1.bb b/meta/recipes-support/icu/icu_62.1.bb
index ec9db7de84..4e3750b997 100644
--- a/meta/recipes-support/icu/icu_62.1.bb
+++ b/meta/recipes-support/icu/icu_62.1.bb
@@ -16,6 +16,7 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
+           file://0002-Add-ARC-support.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.16.2
