From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 18 Sep 2018 00:29:35 +0300
Subject: [PATCH 02/10] site: Add ARC linux
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180917212943.27237-3-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 meta/site/arc-linux | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/site/arc-linux

diff --git a/meta/site/arc-linux b/meta/site/arc-linux
new file mode 100644
index 0000000..d3c721a
--- /dev/null
+++ b/meta/site/arc-linux
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
1.8.3.1
