From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 15:14:04 -0700
Subject: [RFC PATCH 02/13] mm: Add mm_struct argument to 'do_mmap' and
 'do_mmap_pgoff'
In-Reply-To: <20170313221415.9375-1-till.smejkal@gmail.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170313221415.9375-3-till.smejkal@gmail.com>
To: linux-snps-arc@lists.infradead.org

Add to the 'do_mmap' and 'do_mmap_pgoff' functions the mm_struct they
should operate on as additional argument. Before, both functions simply
used the memory map of the current task. However, with the introduction of
first class virtual address spaces, these functions also need to be usable
for other memory maps than just the one of the current process. Hence,
explicitly define during the function call which memory map to use.

Signed-off-by: Till Smejkal <till.smejkal at gmail.com>
---
 arch/x86/mm/mpx.c  |  4 ++--
 fs/aio.c           |  4 ++--
 include/linux/mm.h | 11 ++++++-----
 ipc/shm.c          |  3 ++-
 mm/mmap.c          | 16 ++++++++--------
 mm/nommu.c         |  7 ++++---
 mm/util.c          |  2 +-
 7 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/arch/x86/mm/mpx.c b/arch/x86/mm/mpx.c
index af59f808742f..99c664a97c35 100644
--- a/arch/x86/mm/mpx.c
+++ b/arch/x86/mm/mpx.c
@@ -50,8 +50,8 @@ static unsigned long mpx_mmap(unsigned long len)
 		return -EINVAL;
 
 	down_write(&mm->mmap_sem);
-	addr = do_mmap(NULL, 0, len, PROT_READ | PROT_WRITE,
-			MAP_ANONYMOUS | MAP_PRIVATE, VM_MPX, 0, &populate);
+	addr = do_mmap(mm, NULL, 0, len, PROT_READ | PROT_WRITE,
+		       MAP_ANONYMOUS | MAP_PRIVATE, VM_MPX, 0, &populate);
 	up_write(&mm->mmap_sem);
 	if (populate)
 		mm_populate(addr, populate);
diff --git a/fs/aio.c b/fs/aio.c
index 873b4ca82ccb..df9bba5a2aff 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -510,8 +510,8 @@ static int aio_setup_ring(struct kioctx *ctx)
 		return -EINTR;
 	}
 
-	ctx->mmap_base = do_mmap_pgoff(ctx->aio_ring_file, 0, ctx->mmap_size,
-				       PROT_READ | PROT_WRITE,
+	ctx->mmap_base = do_mmap_pgoff(current->mm, ctx->aio_ring_file, 0,
+				       ctx->mmap_size, PROT_READ | PROT_WRITE,
 				       MAP_SHARED, 0, &unused);
 	up_write(&mm->mmap_sem);
 	if (IS_ERR((void *)ctx->mmap_base)) {
diff --git a/include/linux/mm.h b/include/linux/mm.h
index fa483d2ff3eb..fb11be77545f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2019,17 +2019,18 @@ extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned lo
 extern unsigned long mmap_region(struct mm_struct *mm, struct file *file,
 				 unsigned long addr, unsigned long len,
 				 vm_flags_t vm_flags, unsigned long pgoff);
-extern unsigned long do_mmap(struct file *file, unsigned long addr,
-	unsigned long len, unsigned long prot, unsigned long flags,
-	vm_flags_t vm_flags, unsigned long pgoff, unsigned long *populate);
+extern unsigned long do_mmap(struct mm_struct *mm, struct file *file,
+	unsigned long addr, unsigned long len, unsigned long prot,
+	unsigned long flags, vm_flags_t vm_flags, unsigned long pgoff,
+	unsigned long *populate);
 extern int do_munmap(struct mm_struct *, unsigned long, size_t);
 
 static inline unsigned long
-do_mmap_pgoff(struct file *file, unsigned long addr,
+do_mmap_pgoff(struct mm_struct *mm, struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot, unsigned long flags,
 	unsigned long pgoff, unsigned long *populate)
 {
-	return do_mmap(file, addr, len, prot, flags, 0, pgoff, populate);
+	return do_mmap(mm, file, addr, len, prot, flags, 0, pgoff, populate);
 }
 
 #ifdef CONFIG_MMU
diff --git a/ipc/shm.c b/ipc/shm.c
index 81203e8ba013..64c21fb32ca9 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -1222,7 +1222,8 @@ long do_shmat(int shmid, char __user *shmaddr, int shmflg, ulong *raddr,
 			goto invalid;
 	}
 
-	addr = do_mmap_pgoff(file, addr, size, prot, flags, 0, &populate);
+	addr = do_mmap_pgoff(mm, file, addr, size, prot, flags, 0,
+			     &populate);
 	*raddr = addr;
 	err = 0;
 	if (IS_ERR_VALUE(addr))
diff --git a/mm/mmap.c b/mm/mmap.c
index 5ac276ac9807..70028bf7b58d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1299,14 +1299,14 @@ static inline int mlock_future_check(struct mm_struct *mm,
 }
 
 /*
- * The caller must hold down_write(&current->mm->mmap_sem).
+ * The caller must hold down_write(&mm->mmap_sem).
  */
-unsigned long do_mmap(struct file *file, unsigned long addr,
-			unsigned long len, unsigned long prot,
-			unsigned long flags, vm_flags_t vm_flags,
-			unsigned long pgoff, unsigned long *populate)
+unsigned long do_mmap(struct mm_struct *mm, struct file *file,
+		      unsigned long addr, unsigned long len,
+		      unsigned long prot, unsigned long flags,
+		      vm_flags_t vm_flags, unsigned long pgoff,
+		      unsigned long *populate)
 {
-	struct mm_struct *mm = current->mm;
 	int pkey = 0;
 
 	*populate = 0;
@@ -2779,8 +2779,8 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	}
 
 	file = get_file(vma->vm_file);
-	ret = do_mmap_pgoff(vma->vm_file, start, size,
-			prot, flags, pgoff, &populate);
+	ret = do_mmap_pgoff(mm, vma->vm_file, start, size,
+			    prot, flags, pgoff, &populate);
 	fput(file);
 out:
 	up_write(&mm->mmap_sem);
diff --git a/mm/nommu.c b/mm/nommu.c
index 24f9f5f39145..54825d29f50b 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1198,7 +1198,8 @@ static int do_mmap_private(struct vm_area_struct *vma,
 /*
  * handle mapping creation for uClinux
  */
-unsigned long do_mmap(struct file *file,
+unsigned long do_mmap(struct mm_struct *mm,
+			struct file *file,
 			unsigned long addr,
 			unsigned long len,
 			unsigned long prot,
@@ -1375,10 +1376,10 @@ unsigned long do_mmap(struct file *file,
 	/* okay... we have a mapping; now we have to register it */
 	result = vma->vm_start;
 
-	current->mm->total_vm += len >> PAGE_SHIFT;
+	mm->total_vm += len >> PAGE_SHIFT;
 
 share:
-	add_vma_to_mm(current->mm, vma);
+	add_vma_to_mm(mm, vma);
 
 	/* we flush the region from the icache only when the first executable
 	 * mapping of it is made  */
diff --git a/mm/util.c b/mm/util.c
index 3cb2164f4099..46d05eef9a6b 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -302,7 +302,7 @@ unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	if (!ret) {
 		if (down_write_killable(&mm->mmap_sem))
 			return -EINTR;
-		ret = do_mmap_pgoff(file, addr, len, prot, flag, pgoff,
+		ret = do_mmap_pgoff(mm, file, addr, len, prot, flag, pgoff,
 				    &populate);
 		up_write(&mm->mmap_sem);
 		if (populate)
-- 
2.12.0
