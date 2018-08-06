From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon,  6 Aug 2018 19:44:23 +0300
Subject: [PATCH 1/2] ARC: show_faulting_vma: remove unused variables
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180806164424.32439-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We get 'inode', 'dev', and 'ino' in show_faulting_vma()
but never use them. So get rid of this variables and corresponding
code.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/troubleshoot.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index 783b20354f8b..f7330a3a1c4d 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -83,9 +83,6 @@ static void print_task_path_n_nm(struct task_struct *tsk, char *buf)
 static void show_faulting_vma(unsigned long address, char *buf)
 {
 	struct vm_area_struct *vma;
-	struct inode *inode;
-	unsigned long ino = 0;
-	dev_t dev = 0;
 	char *nm = buf;
 	struct mm_struct *active_mm = current->active_mm;
 
@@ -99,12 +96,8 @@ static void show_faulting_vma(unsigned long address, char *buf)
 	 * if the container VMA is not found
 	 */
 	if (vma && (vma->vm_start <= address)) {
-		struct file *file = vma->vm_file;
-		if (file) {
-			nm = file_path(file, buf, PAGE_SIZE - 1);
-			inode = file_inode(vma->vm_file);
-			dev = inode->i_sb->s_dev;
-			ino = inode->i_ino;
+		if (vma->vm_file) {
+			nm = file_path(vma->vm_file, buf, PAGE_SIZE - 1);
 		}
 		pr_info("    @off 0x%lx in [%s]\n"
 			"    VMA: 0x%08lx to 0x%08lx\n",
-- 
2.14.4
