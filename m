From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:54 -0800
Subject: [PATCH v2 14/15] NEWS: mention ARC port
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-15-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog | 1 +
 NEWS      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index 63418806d331..8c1fc3d2cdcb 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -100,6 +100,7 @@
 	* sysdeps/unix/sysv/linux/arc/configure.ac: New file.
 	* sysdeps/unix/sysv/linux/arc/shlib-versions: New file.
 	* scripts/build-many-glibcs.py: Enable building for ARC.
+	* NEW: Mention ARC port.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/NEWS b/NEWS
index 76679f33938d..73f422a93e85 100644
--- a/NEWS
+++ b/NEWS
@@ -64,6 +64,13 @@ Major new features:
   "%EY" to control how the year number is formatted; they have the
   same effect that they would on "%Ey".
 
+* Support for ARC HS cores running Linux has been contributed by Synopsys.
+  Port requires atleast
+    - binutils-2.31 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
+    - gcc 8.2 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
+    - Linux kernel 3.9+
+  Soft-float ABI is currently supported.
+
 Deprecated and removed features, and other changes affecting compatibility:
 
 * The glibc.tune tunable namespace has been renamed to glibc.cpu and the
-- 
2.7.4
