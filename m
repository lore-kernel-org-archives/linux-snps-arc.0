From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Sep 2018 17:26:00 +0300
Subject: [PATCH v3 1/9] siteinfo: Define data for ARC
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180921142608.36203-2-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---

No changes in v3.

Changes v1 -> v2:
 * Merged changes in meta/classes/siteinfo.bbclass &
   meta/site/arc-common

 meta/classes/siteinfo.bbclass |  2 ++
 meta/site/arc-common          | 11 +++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/site/arc-common

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 86bb853be2..dccf122b12 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -20,6 +20,8 @@ def siteinfo_data(d):
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common arm-64",
         "aarch64_be": "endian-big bit-64 arm-common arm-64",
+        "arc": "endian-little bit-32 arc-common",
+        "arceb": "endian-big bit-32 arc-common",
         "arm": "endian-little bit-32 arm-common arm-32",
         "armeb": "endian-big bit-32 arm-common arm-32",
         "avr32": "endian-big bit-32 avr32-common",
diff --git a/meta/site/arc-common b/meta/site/arc-common
new file mode 100644
index 0000000000..d3c721a8bb
--- /dev/null
+++ b/meta/site/arc-common
@@ -0,0 +1,11 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=4
+ac_cv_alignof_unsigned_long=4
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-- 
2.16.2
