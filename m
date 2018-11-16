From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 16 Nov 2018 13:44:25 +0300
Subject: [PATCH 1/3] ARC: split show_faulting_vma for logic and representation
 parts
In-Reply-To: <20181116104427.25264-1-Eugeniy.Paltsev@synopsys.com>
References: <20181116104427.25264-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181116104427.25264-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

In preparation for introduncing SmaRT support for ARC split
show_faulting_vma() for logic and representation parts to be
able to use logic part in SmaRT code.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/include/asm/bug.h     |  9 +++++++++
 arch/arc/kernel/troubleshoot.c | 43 ++++++++++++++++++++++++++++++------------
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arc/include/asm/bug.h b/arch/arc/include/asm/bug.h
index b68f7f82f2d8..064391646d38 100644
--- a/arch/arc/include/asm/bug.h
+++ b/arch/arc/include/asm/bug.h
@@ -15,6 +15,15 @@
 
 struct task_struct;
 
+struct faulting_vma_info {
+	char *file_path;
+	unsigned long offset;
+	unsigned long vm_start;
+	unsigned long vm_end;
+};
+
+int get_faulting_vma_info(unsigned long address, char *buf, int buflen,
+			  struct faulting_vma_info *fvma);
 void show_regs(struct pt_regs *regs);
 void show_exception_mesg(struct pt_regs *regs);
 void show_stacktrace(struct task_struct *tsk, struct pt_regs *regs);
diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index fdfba1942a06..00efcdfde0ee 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -80,11 +80,14 @@ static void print_task_path_n_nm(struct task_struct *tsk, char *buf)
 	pr_info("Path: %s\n", !IS_ERR(path_nm) ? path_nm : "?");
 }
 
-static void show_faulting_vma(unsigned long address, char *buf)
+int get_faulting_vma_info(unsigned long address, char *buf, int buflen,
+			  struct faulting_vma_info *fvma)
 {
 	struct vm_area_struct *vma;
-	char *nm = buf;
 	struct mm_struct *active_mm = current->active_mm;
+	int ret = -ENOENT;
+
+	fvma->file_path = "?";
 
 	/* can't use print_vma_addr() yet as it doesn't check for
 	 * non-inclusive vma
@@ -97,19 +100,35 @@ static void show_faulting_vma(unsigned long address, char *buf)
 	 */
 	if (vma && (vma->vm_start <= address)) {
 		if (vma->vm_file) {
-			nm = file_path(vma->vm_file, buf, PAGE_SIZE - 1);
-			if (IS_ERR(nm))
-				nm = "?";
+			fvma->file_path = file_path(vma->vm_file, buf, buflen);
+			if (IS_ERR(fvma->file_path))
+				fvma->file_path = "?";
 		}
 
-		pr_cont("[off 0x%lx in %s, VMA: %08lx:%08lx] ",
-			vma->vm_start < TASK_UNMAPPED_BASE ?
-				address : address - vma->vm_start,
-			nm, vma->vm_start, vma->vm_end);
-	} else
-		pr_cont("[No matching VMA found] ");
+		fvma->vm_start = vma->vm_start;
+		fvma->vm_end = vma->vm_end;
+		fvma->offset = vma->vm_start < TASK_UNMAPPED_BASE ?
+				address : address - vma->vm_start;
+
+		ret = 0;
+	}
 
 	up_read(&active_mm->mmap_sem);
+
+	return ret;
+}
+
+static void show_faulting_vma(unsigned long address, char *buf, int buflen)
+{
+	struct faulting_vma_info fvma;
+	int ret;
+
+	ret = get_faulting_vma_info(address, buf, buflen, &fvma);
+	if (ret)
+		pr_cont("[No matching VMA found] ");
+	else
+		pr_cont("[off 0x%lx in %s, VMA: %08lx:%08lx] ", fvma.offset,
+			fvma.file_path, fvma.vm_start, fvma.vm_end);
 }
 
 static void show_ecr_verbose(struct pt_regs *regs)
@@ -175,7 +194,7 @@ static inline void show_exception_mesg_u(struct pt_regs *regs)
 
 	buf = (char *)__get_free_page(GFP_NOWAIT);
 	if (buf) {
-		show_faulting_vma(regs->ret, buf);
+		show_faulting_vma(regs->ret, buf, PAGE_SIZE - 1);
 		free_page((unsigned long)buf);
 	}
 
-- 
2.14.5
