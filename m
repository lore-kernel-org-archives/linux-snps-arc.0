From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 15:14:10 -0700
Subject: [RFC PATCH 08/13] kernel/fork: Define explicitly which mm_struct to
 duplicate during fork
In-Reply-To: <20170313221415.9375-1-till.smejkal@gmail.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170313221415.9375-9-till.smejkal@gmail.com>
To: linux-snps-arc@lists.infradead.org

The dup_mm-function used during 'do_fork' to duplicate the current task's
mm_struct for the newly forked task always implicitly uses current->mm for
this purpose. However, during copy_mm it was already decided which
mm_struct to copy/duplicate. So pass this mm_struct to dup_mm instead of
again deciding which mm_struct to use.

Signed-off-by: Till Smejkal <till.smejkal at gmail.com>
---
 kernel/fork.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 9209f6d5d7c0..d3087d870855 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1158,9 +1158,10 @@ void mm_release(struct task_struct *tsk, struct mm_struct *mm)
  * Allocate a new mm structure and copy contents from the
  * mm structure of the passed in task structure.
  */
-static struct mm_struct *dup_mm(struct task_struct *tsk)
+static struct mm_struct *dup_mm(struct task_struct *tsk,
+				struct mm_struct *oldmm)
 {
-	struct mm_struct *mm, *oldmm = current->mm;
+	struct mm_struct *mm;
 	int err;
 
 	mm = allocate_mm();
@@ -1226,7 +1227,7 @@ static int copy_mm(unsigned long clone_flags, struct task_struct *tsk)
 	}
 
 	retval = -ENOMEM;
-	mm = dup_mm(tsk);
+	mm = dup_mm(tsk, oldmm);
 	if (!mm)
 		goto fail_nomem;
 
-- 
2.12.0
