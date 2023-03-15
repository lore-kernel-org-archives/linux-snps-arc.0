Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C868DC7618E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Mar 2023 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qXV5WGa0ywN/17UuaTJvUaZZHFfP9w9CA21jwH1UEo=; b=kaROxtGEd5hW/7
	8mSo399Gk4fjBFlIoNPDcbrgD/wQCMxZy9tnKTwd/jDpPtethAz7VdWrYRV8Kt3C6FENeGXfKQmrw
	oNRdFXfZBBKDBfKTrTw8+MzEREMW6qWx/WpelxhkV8PtlrIW4HpMKCjW3TA6xTij+Q6S1H54ACZMg
	VvVhHj8I/+xRmg6bSM1rCjH52kgLdxdxPh2vCchW5aekoRakjx3TdyaXfc3MSnHq9Yzh9XcRUiqLw
	oaBDkJ6QumeHCHzLNh/ZKa7RLTb9zZO98r1ljODUsfOpZ8dvqyD88sVGcbWIkUjtnwszaWvpKYE5K
	XtuHUfrAPQ2oEZvD2mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJTO-00CM9E-0O;
	Wed, 15 Mar 2023 05:14:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJTM-00CM8u-2G
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 15 Mar 2023 05:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6/hWEFc0Vol4F6C3+SeR2Ih7aqS5VmEKy/BZy1zhr7U=; b=npKz7MQ24Jh6hl3M1G3cS63ADn
	rZvoXlJpzixA29z28EA4sXL4yrktquO6Nk/Bf/OQIM9aT9wYAu9Y5mXU6KdgoUBax+BQNm7LqBklR
	AwvdTntoISKFcoCV15UOqZgnymu6lzaztZR7RrnKoXnJrLvUdj4wVNk/Id/9Zs9OJzmO6ikFS2IpD
	vM8kJRUc3KrEUMGUk2855klfzjxyXt3Ri3dZBZB+wD7q1u7+Wccz5cEFFZhx5tqKFyOaXHp89P3tL
	nljnnt6FD1DsnfRYwgtDrQkRVMVIMtEEui8oo6OaCSeyQuR0OpgCPadctepZ+tJ3nCNroMY/aLp4p
	aYtVqcTA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcJTL-00DYBB-2P; Wed, 15 Mar 2023 05:14:47 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-arch@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v4 07/36] arc: Implement the new page table range API
Date: Wed, 15 Mar 2023 05:14:15 +0000
Message-Id: <20230315051444.3229621-8-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230315051444.3229621-1-willy@infradead.org>
References: <20230315051444.3229621-1-willy@infradead.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Add PFN_PTE_SHIFT, update_mmu_cache_range(), flush_dcache_folio()
and flush_icache_pages().

Change the PG_dc_clean flag from being per-page to per-folio (which
means it cannot always be set as we don't know that all pages in this
folio were cleaned).  Enhance the internal flush routines to take the
number of pages to flush.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/include/asm/cacheflush.h         |  7 ++-
 arch/arc/include/asm/pgtable-bits-arcv2.h | 11 ++--
 arch/arc/include/asm/pgtable-levels.h     |  1 +
 arch/arc/mm/cache.c                       | 61 ++++++++++++++---------
 arch/arc/mm/tlb.c                         | 18 ++++---
 5 files changed, 58 insertions(+), 40 deletions(-)

diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
index e201b4b1655a..04f65f588510 100644
--- a/arch/arc/include/asm/cacheflush.h
+++ b/arch/arc/include/asm/cacheflush.h
@@ -25,17 +25,20 @@
  * in update_mmu_cache()
  */
 #define flush_icache_page(vma, page)
+#define flush_icache_pages(vma, page, nr)
 
 void flush_cache_all(void);
 
 void flush_icache_range(unsigned long kstart, unsigned long kend);
 void __sync_icache_dcache(phys_addr_t paddr, unsigned long vaddr, int len);
-void __inv_icache_page(phys_addr_t paddr, unsigned long vaddr);
-void __flush_dcache_page(phys_addr_t paddr, unsigned long vaddr);
+void __inv_icache_pages(phys_addr_t paddr, unsigned long vaddr, unsigned nr);
+void __flush_dcache_pages(phys_addr_t paddr, unsigned long vaddr, unsigned nr);
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
 
 void flush_dcache_page(struct page *page);
+void flush_dcache_folio(struct folio *folio);
+#define flush_dcache_folio flush_dcache_folio
 
 void dma_cache_wback_inv(phys_addr_t start, unsigned long sz);
 void dma_cache_inv(phys_addr_t start, unsigned long sz);
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 6e9f8ca6d6a1..06d8039180c0 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -100,14 +100,11 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
-static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep, pte_t pteval)
-{
-	set_pte(ptep, pteval);
-}
+void update_mmu_cache_range(struct vm_area_struct *vma, unsigned long address,
+		      pte_t *ptep, unsigned int nr);
 
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
-		      pte_t *ptep);
+#define update_mmu_cache(vma, addr, ptep) \
+	update_mmu_cache_range(vma, addr, ptep, 1)
 
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index ef68758b69f7..fc417c75c24d 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -169,6 +169,7 @@
 #define pte_ERROR(e) \
 	pr_crit("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 
+#define PFN_PTE_SHIFT		PAGE_SHIFT
 #define pte_none(x)		(!pte_val(x))
 #define pte_present(x)		(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(mm,addr,ptep)	set_pte_at(mm, addr, ptep, __pte(0))
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 55c6de138eae..3c16ee942a5c 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -752,17 +752,17 @@ static inline void arc_slc_enable(void)
  * There's a corollary case, where kernel READs from a userspace mapped page.
  * If the U-mapping is not congruent to K-mapping, former needs flushing.
  */
-void flush_dcache_page(struct page *page)
+void flush_dcache_folio(struct folio *folio)
 {
 	struct address_space *mapping;
 
 	if (!cache_is_vipt_aliasing()) {
-		clear_bit(PG_dc_clean, &page->flags);
+		clear_bit(PG_dc_clean, &folio->flags);
 		return;
 	}
 
 	/* don't handle anon pages here */
-	mapping = page_mapping_file(page);
+	mapping = folio_flush_mapping(folio);
 	if (!mapping)
 		return;
 
@@ -771,17 +771,27 @@ void flush_dcache_page(struct page *page)
 	 * Make a note that K-mapping is dirty
 	 */
 	if (!mapping_mapped(mapping)) {
-		clear_bit(PG_dc_clean, &page->flags);
-	} else if (page_mapcount(page)) {
-
+		clear_bit(PG_dc_clean, &folio->flags);
+	} else if (folio_mapped(folio)) {
 		/* kernel reading from page with U-mapping */
-		phys_addr_t paddr = (unsigned long)page_address(page);
-		unsigned long vaddr = page->index << PAGE_SHIFT;
+		phys_addr_t paddr = (unsigned long)folio_address(folio);
+		unsigned long vaddr = folio_pos(folio);
 
+		/*
+		 * vaddr is not actually the virtual address, but is
+		 * congruent to every user mapping.
+		 */
 		if (addr_not_cache_congruent(paddr, vaddr))
-			__flush_dcache_page(paddr, vaddr);
+			__flush_dcache_pages(paddr, vaddr,
+						folio_nr_pages(folio));
 	}
 }
+EXPORT_SYMBOL(flush_dcache_folio);
+
+void flush_dcache_page(struct page *page)
+{
+	return flush_dcache_folio(page_folio(page));
+}
 EXPORT_SYMBOL(flush_dcache_page);
 
 /*
@@ -921,18 +931,18 @@ void __sync_icache_dcache(phys_addr_t paddr, unsigned long vaddr, int len)
 }
 
 /* wrapper to compile time eliminate alignment checks in flush loop */
-void __inv_icache_page(phys_addr_t paddr, unsigned long vaddr)
+void __inv_icache_pages(phys_addr_t paddr, unsigned long vaddr, unsigned nr)
 {
-	__ic_line_inv_vaddr(paddr, vaddr, PAGE_SIZE);
+	__ic_line_inv_vaddr(paddr, vaddr, nr * PAGE_SIZE);
 }
 
 /*
  * wrapper to clearout kernel or userspace mappings of a page
  * For kernel mappings @vaddr == @paddr
  */
-void __flush_dcache_page(phys_addr_t paddr, unsigned long vaddr)
+void __flush_dcache_pages(phys_addr_t paddr, unsigned long vaddr, unsigned nr)
 {
-	__dc_line_op(paddr, vaddr & PAGE_MASK, PAGE_SIZE, OP_FLUSH_N_INV);
+	__dc_line_op(paddr, vaddr & PAGE_MASK, nr * PAGE_SIZE, OP_FLUSH_N_INV);
 }
 
 noinline void flush_cache_all(void)
@@ -962,10 +972,10 @@ void flush_cache_page(struct vm_area_struct *vma, unsigned long u_vaddr,
 
 	u_vaddr &= PAGE_MASK;
 
-	__flush_dcache_page(paddr, u_vaddr);
+	__flush_dcache_pages(paddr, u_vaddr, 1);
 
 	if (vma->vm_flags & VM_EXEC)
-		__inv_icache_page(paddr, u_vaddr);
+		__inv_icache_pages(paddr, u_vaddr, 1);
 }
 
 void flush_cache_range(struct vm_area_struct *vma, unsigned long start,
@@ -978,9 +988,9 @@ void flush_anon_page(struct vm_area_struct *vma, struct page *page,
 		     unsigned long u_vaddr)
 {
 	/* TBD: do we really need to clear the kernel mapping */
-	__flush_dcache_page((phys_addr_t)page_address(page), u_vaddr);
-	__flush_dcache_page((phys_addr_t)page_address(page),
-			    (phys_addr_t)page_address(page));
+	__flush_dcache_pages((phys_addr_t)page_address(page), u_vaddr, 1);
+	__flush_dcache_pages((phys_addr_t)page_address(page),
+			    (phys_addr_t)page_address(page), 1);
 
 }
 
@@ -989,6 +999,8 @@ void flush_anon_page(struct vm_area_struct *vma, struct page *page,
 void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long u_vaddr, struct vm_area_struct *vma)
 {
+	struct folio *src = page_folio(from);
+	struct folio *dst = page_folio(to);
 	void *kfrom = kmap_atomic(from);
 	void *kto = kmap_atomic(to);
 	int clean_src_k_mappings = 0;
@@ -1005,7 +1017,7 @@ void copy_user_highpage(struct page *to, struct page *from,
 	 * addr_not_cache_congruent() is 0
 	 */
 	if (page_mapcount(from) && addr_not_cache_congruent(kfrom, u_vaddr)) {
-		__flush_dcache_page((unsigned long)kfrom, u_vaddr);
+		__flush_dcache_pages((unsigned long)kfrom, u_vaddr, 1);
 		clean_src_k_mappings = 1;
 	}
 
@@ -1019,17 +1031,17 @@ void copy_user_highpage(struct page *to, struct page *from,
 	 * non copied user pages (e.g. read faults which wire in pagecache page
 	 * directly).
 	 */
-	clear_bit(PG_dc_clean, &to->flags);
+	clear_bit(PG_dc_clean, &dst->flags);
 
 	/*
 	 * if SRC was already usermapped and non-congruent to kernel mapping
 	 * sync the kernel mapping back to physical page
 	 */
 	if (clean_src_k_mappings) {
-		__flush_dcache_page((unsigned long)kfrom, (unsigned long)kfrom);
-		set_bit(PG_dc_clean, &from->flags);
+		__flush_dcache_pages((unsigned long)kfrom,
+					(unsigned long)kfrom, 1);
 	} else {
-		clear_bit(PG_dc_clean, &from->flags);
+		clear_bit(PG_dc_clean, &src->flags);
 	}
 
 	kunmap_atomic(kto);
@@ -1038,8 +1050,9 @@ void copy_user_highpage(struct page *to, struct page *from,
 
 void clear_user_page(void *to, unsigned long u_vaddr, struct page *page)
 {
+	struct folio *folio = page_folio(page);
 	clear_page(to);
-	clear_bit(PG_dc_clean, &page->flags);
+	clear_bit(PG_dc_clean, &folio->flags);
 }
 EXPORT_SYMBOL(clear_user_page);
 
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 5f71445f26bd..0a996b65bb4e 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -467,8 +467,8 @@ void create_tlb(struct vm_area_struct *vma, unsigned long vaddr, pte_t *ptep)
  * Note that flush (when done) involves both WBACK - so physical page is
  * in sync as well as INV - so any non-congruent aliases don't remain
  */
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
-		      pte_t *ptep)
+void update_mmu_cache_range(struct vm_area_struct *vma,
+		unsigned long vaddr_unaligned, pte_t *ptep, unsigned int nr)
 {
 	unsigned long vaddr = vaddr_unaligned & PAGE_MASK;
 	phys_addr_t paddr = pte_val(*ptep) & PAGE_MASK_PHYS;
@@ -491,15 +491,19 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
 	 */
 	if ((vma->vm_flags & VM_EXEC) ||
 	     addr_not_cache_congruent(paddr, vaddr)) {
-
-		int dirty = !test_and_set_bit(PG_dc_clean, &page->flags);
+		struct folio *folio = page_folio(page);
+		int dirty = !test_and_set_bit(PG_dc_clean, &folio->flags);
 		if (dirty) {
+			unsigned long offset = offset_in_folio(folio, paddr);
+			nr = folio_nr_pages(folio);
+			paddr -= offset;
+			vaddr -= offset;
 			/* wback + inv dcache lines (K-mapping) */
-			__flush_dcache_page(paddr, paddr);
+			__flush_dcache_pages(paddr, paddr, nr);
 
 			/* invalidate any existing icache lines (U-mapping) */
 			if (vma->vm_flags & VM_EXEC)
-				__inv_icache_page(paddr, vaddr);
+				__inv_icache_pages(paddr, vaddr, nr);
 		}
 	}
 }
@@ -531,7 +535,7 @@ void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 				 pmd_t *pmd)
 {
 	pte_t pte = __pte(pmd_val(*pmd));
-	update_mmu_cache(vma, addr, &pte);
+	update_mmu_cache_range(vma, addr, &pte, HPAGE_PMD_NR);
 }
 
 void local_flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
