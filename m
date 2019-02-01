From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 31 Jan 2019 16:16:50 -0800
Subject: [PATCH] make-syscalls.sh: fix comment referencing syscall-template
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548980210-5289-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

spotted when started working on ARC port to glibc

---
 ChangeLog                     | 5 +++++
 sysdeps/unix/make-syscalls.sh | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/ChangeLog b/ChangeLog
index 93201b76a26b..8438f93e13a2 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,8 @@
+2019-01-31  Vineet Gupta <vgupta at synopsys.com>
+
+	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
+	syscall-template file.
+
 2019-01-31  Paul Pluzhnikov  <ppluzhnikov at google.com>
 
 	[BZ #24051]
diff --git a/sysdeps/unix/make-syscalls.sh b/sysdeps/unix/make-syscalls.sh
index e39b2d6d5214..6a5c10d54e87 100644
--- a/sysdeps/unix/make-syscalls.sh
+++ b/sysdeps/unix/make-syscalls.sh
@@ -7,7 +7,7 @@
 #
 # This script is used to process the syscall data encoded in the various
 # syscalls.list files to produce thin assembly syscall wrappers around the
-# appropriate OS syscall. See syscall-template.s for more details on the
+# appropriate OS syscall. See syscall-template.S for more details on the
 # actual wrapper.
 #
 # Syscall Signature Prefixes:
-- 
2.7.4
