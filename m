From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:51 -0800
Subject: [PATCH v2 11/15] ARC: Update syscall-names.list for ARC specific
 syscalls
In-Reply-To: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-12-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                  | 1 +
 sysdeps/unix/sysv/linux/syscall-names.list | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index 55d185c2a189..3fb8c7c14cae 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -85,6 +85,7 @@
 	* sysdeps/unix/sysv/linux/arc/libthread_db.abilist: New file.
 	* sysdeps/unix/sysv/linux/arc/libutil.abilist: New file.
 	* sysdeps/unix/sysv/linux/arc/localplt.data: New file.
+	* sysdeps/unix/sysv/linux/syscall-names.list: Update for ARC.
 
 2019-01-25  Siddhesh Poyarekar  <siddhesh at sourceware.org>
 
diff --git a/sysdeps/unix/sysv/linux/syscall-names.list b/sysdeps/unix/sysv/linux/syscall-names.list
index b650dc07cc64..5a9f63ff511c 100644
--- a/sysdeps/unix/sysv/linux/syscall-names.list
+++ b/sysdeps/unix/sysv/linux/syscall-names.list
@@ -42,6 +42,9 @@ adjtimex
 afs_syscall
 alarm
 alloc_hugepages
+arc_gettls
+arc_settls
+arc_usr_cmpxchg
 arch_prctl
 arm_fadvise64_64
 arm_sync_file_range
-- 
2.7.4
