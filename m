From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 13 Nov 2018 01:43:51 +0300
Subject: [PATCH] locale: Allow usage of cross-localedef for ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181112224351.2050-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

With this it's possible to build locale data for ARC
and not do it instead on the first boot.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/classes/libc-package.bbclass        | 2 ++
 meta/lib/oe/package_manager.py           | 2 ++
 meta/recipes-core/glibc/glibc-locale.inc | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 9d09c7be6a..4c694ab5e2 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -242,6 +242,8 @@ python package_do_split_gconvs () {
         if use_cross_localedef == "1":
             target_arch = d.getVar('TARGET_ARCH')
             locale_arch_options = { \
+                "arc":     " --uint32-align=4 --little-endian ", \
+                "arceb":   " --uint32-align=4 --big-endian ",    \
                 "arm":     " --uint32-align=4 --little-endian ", \
                 "armeb":   " --uint32-align=4 --big-endian ",    \
                 "aarch64": " --uint32-align=4 --little-endian ",    \
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 882e7c429f..aa4de6e7c3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -94,6 +94,8 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
     # Pretty sure we don't need this for locale archive generation but
     # keeping it to be safe...
     locale_arch_options = { \
+        "arc": ["--uint32-align=4", "--little-endian"],
+        "arceb": ["--uint32-align=4", "--big-endian"],
         "arm": ["--uint32-align=4", "--little-endian"],
         "armeb": ["--uint32-align=4", "--big-endian"],
         "aarch64": ["--uint32-align=4", "--little-endian"],
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 1b676dc26e..57b465dd5d 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -27,7 +27,7 @@ ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-glibc-locale = "1"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
+BINARY_LOCALE_ARCHES ?= "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mips mips64 riscv32 riscv64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
-- 
2.16.2
