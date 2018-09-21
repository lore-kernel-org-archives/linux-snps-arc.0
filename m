From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Sep 2018 17:26:06 +0300
Subject: [PATCH v3 7/9] gcc: Disable libitm for ARC
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180921142608.36203-8-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The libitm is not supported on ARC, so disable it

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

No changes in v3.

No changes in v2.

 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 72b8081cd3..9e7e7c5b3d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,7 @@ EXTRA_OECONF_PATHS = "\
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMELIBITM = "libitm"
+RUNTIMELIBITM_arc = ""
 RUNTIMELIBITM_mipsarch = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
-- 
2.16.2
