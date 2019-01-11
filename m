From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Jan 2019 16:26:25 -0800
Subject: [PATCH 1/3] coredump: Replace opencoded set_mask_bits()
In-Reply-To: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
References: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1547166387-19785-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Cc: Alexander Viro <viro at zeniv.linux.org.uk>
Cc: Peter Zijlstra (Intel) <peterz at infradead.org>
Cc: linux-fsdevel at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Link: http://lkml.kernel.org/g/20150807115710.GA16897 at redhat.com
Acked-by: Oleg Nesterov <oleg at redhat.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 fs/exec.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index fb72d36f7823..df7f05362283 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1944,15 +1944,10 @@ EXPORT_SYMBOL(set_binfmt);
  */
 void set_dumpable(struct mm_struct *mm, int value)
 {
-	unsigned long old, new;
-
 	if (WARN_ON((unsigned)value > SUID_DUMP_ROOT))
 		return;
 
-	do {
-		old = READ_ONCE(mm->flags);
-		new = (old & ~MMF_DUMPABLE_MASK) | value;
-	} while (cmpxchg(&mm->flags, old, new) != old);
+	set_mask_bits(&mm->flags, MMF_DUMPABLE_MASK, value);
 }
 
 SYSCALL_DEFINE3(execve,
-- 
2.7.4
