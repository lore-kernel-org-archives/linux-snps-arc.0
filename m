From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 18 Oct 2018 13:26:09 +0300
Subject: [PATCH] packagegroup-core-tools-profile: disable valgrind on arc
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181018102609.12234-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

As of today there's no port of Valgrind for ARC so disabling it.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 520d907714..4ec1f9284f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -55,6 +55,7 @@ VALGRIND = "valgrind"
 VALGRIND_libc-musl = ""
 VALGRIND_mipsarch = ""
 VALGRIND_nios2 = ""
+VALGRIND_arc = ""
 VALGRIND_armv4 = ""
 VALGRIND_armv5 = ""
 VALGRIND_armv6 = ""
-- 
2.16.2
