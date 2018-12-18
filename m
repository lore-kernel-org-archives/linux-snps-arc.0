From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:34 -0800
Subject: [PATCH 12/21] ARC: Update syscall-names.list for ARC specific syscalls
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-13-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                  | 1 +
 sysdeps/unix/sysv/linux/syscall-names.list | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index 4182e89ccbb3..3735df67a3b2 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -91,6 +91,7 @@
 	* sysdeps/unix/sysv/linux/arc/libthread_db.abilist: New file.
 	* sysdeps/unix/sysv/linux/arc/libutil.abilist: New file.
 	* sysdeps/unix/sysv/linux/arc/localplt.data: New file.
+	* sysdeps/unix/sysv/linux/syscall-names.list: Update for ARC.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/unix/sysv/linux/syscall-names.list b/sysdeps/unix/sysv/linux/syscall-names.list
index f88001c9c38d..62862010600f 100644
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
