From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 15:14:08 -0700
Subject: [RFC PATCH 06/13] mm/mmap: Export 'vma_link' and 'find_vma_links' to
 mm subsystem
In-Reply-To: <20170313221415.9375-1-till.smejkal@gmail.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170313221415.9375-7-till.smejkal@gmail.com>
To: linux-snps-arc@lists.infradead.org

Make the functions 'vma_link' and 'find_vma_links' accessible to other
source files in the mm/ source directory of the kernel so that other files
in that directory can also perform low level changes to mm_struct data
structures.

Signed-off-by: Till Smejkal <till.smejkal at gmail.com>
---
 mm/internal.h | 11 +++++++++++
 mm/mmap.c     | 12 ++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 7aa2ea0a8623..e22cb031b45b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -76,6 +76,17 @@ static inline void set_page_refcounted(struct page *page)
 extern unsigned long highest_memmap_pfn;
 
 /*
+ * in mm/mmap.c
+ */
+extern void vma_link(struct mm_struct *mm, struct vm_area_struct *vma,
+		     struct vm_area_struct *prev, struct rb_node **rb_link,
+		     struct rb_node *rb_parent);
+extern int find_vma_links(struct mm_struct *mm, unsigned long addr,
+			  unsigned long end, struct vm_area_struct **pprev,
+			  struct rb_node ***rb_link,
+			  struct rb_node **rb_parent);
+
+/*
  * in mm/vmscan.c:
  */
 extern int isolate_lru_page(struct page *page);
diff --git a/mm/mmap.c b/mm/mmap.c
index 3f60c8ebd6b6..d35c6b51cadf 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -466,9 +466,9 @@ anon_vma_interval_tree_post_update_vma(struct vm_area_struct *vma)
 		anon_vma_interval_tree_insert(avc, &avc->anon_vma->rb_root);
 }
 
-static int find_vma_links(struct mm_struct *mm, unsigned long addr,
-		unsigned long end, struct vm_area_struct **pprev,
-		struct rb_node ***rb_link, struct rb_node **rb_parent)
+int find_vma_links(struct mm_struct *mm, unsigned long addr,
+		   unsigned long end, struct vm_area_struct **pprev,
+		   struct rb_node ***rb_link, struct rb_node **rb_parent)
 {
 	struct rb_node **__rb_link, *__rb_parent, *rb_prev;
 
@@ -580,9 +580,9 @@ __vma_link(struct mm_struct *mm, struct vm_area_struct *vma,
 	__vma_link_rb(mm, vma, rb_link, rb_parent);
 }
 
-static void vma_link(struct mm_struct *mm, struct vm_area_struct *vma,
-			struct vm_area_struct *prev, struct rb_node **rb_link,
-			struct rb_node *rb_parent)
+void vma_link(struct mm_struct *mm, struct vm_area_struct *vma,
+	      struct vm_area_struct *prev, struct rb_node **rb_link,
+	      struct rb_node *rb_parent)
 {
 	struct address_space *mapping = NULL;
 
-- 
2.12.0
