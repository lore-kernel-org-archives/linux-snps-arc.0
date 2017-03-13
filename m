From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 15:14:05 -0700
Subject: [RFC PATCH 03/13] mm: Rename 'unmap_region' and add mm_struct argument
In-Reply-To: <20170313221415.9375-1-till.smejkal@gmail.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170313221415.9375-4-till.smejkal@gmail.com>
To: linux-snps-arc@lists.infradead.org

Rename the 'unmap_region' function to 'munmap_region' so that it uses the
same naming pattern as the do_mmap <-> mmap_region couple. In addition
also make the new 'munmap_region' function publicly available to all other
kernel sources.

In addition, also add to the function the mm_struct it should operate on
as additional argument. Before, the function simply used the memory map of
the current task. However, with the introduction of first class virtual
address spaces, munmap_region need also be able to operate on other memory
maps than just the current task's one. Accordingly, add a new argument to
the function so that one can define explicitly which memory map should be
used.

Signed-off-by: Till Smejkal <till.smejkal at gmail.com>
---
 include/linux/mm.h |  4 ++++
 mm/mmap.c          | 14 +++++---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fb11be77545f..71a90604d21f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2023,6 +2023,10 @@ extern unsigned long do_mmap(struct mm_struct *mm, struct file *file,
 	unsigned long addr, unsigned long len, unsigned long prot,
 	unsigned long flags, vm_flags_t vm_flags, unsigned long pgoff,
 	unsigned long *populate);
+
+extern void munmap_region(struct mm_struct *mm, struct vm_area_struct *vma,
+			  struct vm_area_struct *prev, unsigned long start,
+			  unsigned long end);
 extern int do_munmap(struct mm_struct *, unsigned long, size_t);
 
 static inline unsigned long
diff --git a/mm/mmap.c b/mm/mmap.c
index 70028bf7b58d..ea79bc4da5b7 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -70,10 +70,6 @@ int mmap_rnd_compat_bits __read_mostly = CONFIG_ARCH_MMAP_RND_COMPAT_BITS;
 static bool ignore_rlimit_data;
 core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
 
-static void unmap_region(struct mm_struct *mm,
-		struct vm_area_struct *vma, struct vm_area_struct *prev,
-		unsigned long start, unsigned long end);
-
 /* description of effects of mapping type and prot in current implementation.
  * this is due to the limited x86 page protection hardware.  The expected
  * behavior is in parens:
@@ -1731,7 +1727,7 @@ unsigned long mmap_region(struct mm_struct *mm, struct file *file,
 	fput(file);
 
 	/* Undo any partial mapping done by a device driver. */
-	unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);
+	munmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);
 	charged = 0;
 	if (vm_flags & VM_SHARED)
 		mapping_unmap_writable(file->f_mapping);
@@ -2447,9 +2443,9 @@ static void remove_vma_list(struct mm_struct *mm, struct vm_area_struct *vma)
  *
  * Called with the mm semaphore held.
  */
-static void unmap_region(struct mm_struct *mm,
-		struct vm_area_struct *vma, struct vm_area_struct *prev,
-		unsigned long start, unsigned long end)
+void munmap_region(struct mm_struct *mm, struct vm_area_struct *vma,
+		struct vm_area_struct *prev, unsigned long start,
+		unsigned long end)
 {
 	struct vm_area_struct *next = prev ? prev->vm_next : mm->mmap;
 	struct mmu_gather tlb;
@@ -2654,7 +2650,7 @@ int do_munmap(struct mm_struct *mm, unsigned long start, size_t len)
 	 * Remove the vma's, and unmap the actual pages
 	 */
 	detach_vmas_to_be_unmapped(mm, vma, prev, end);
-	unmap_region(mm, vma, prev, start, end);
+	munmap_region(mm, vma, prev, start, end);
 
 	arch_unmap(mm, vma, start, end);
 
-- 
2.12.0
