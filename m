From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:55 -0800
Subject: [PATCH v2 15/15] make-syscalls.sh: fix comment referencing
 syscall-template
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-16-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                     | 2 ++
 sysdeps/unix/make-syscalls.sh | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/ChangeLog b/ChangeLog
index 8c1fc3d2cdcb..3c73507df5f7 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -101,6 +101,8 @@
 	* sysdeps/unix/sysv/linux/arc/shlib-versions: New file.
 	* scripts/build-many-glibcs.py: Enable building for ARC.
 	* NEW: Mention ARC port.
+	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
+	syscall-template file.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
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
