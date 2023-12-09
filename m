Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B700C46CC5
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZfCLYYvE2I+QkkgrREZdoKbMqKF8YINfCzfDLaxMN4=; b=nnc22c7VTqC39Q
	pQ+gOLh4xCR66Cddgnxc517mpw7c0M7/33KbL/gSKbwMRZYI8kuLo/cE59kxiS38tVpG7TvCWTRie
	mmXzDY14gFvG9W+dowFSzRjAjBPXA1uiX9BTBqJE1hGM1DA2K2tuSfl5p8ViMfGiiACNJyImWIsiG
	9560zr0C5OmRi5J9EHap5KLVp8sU2/fYrdkVtTt0Z5RFCai1R2rHnkJAQvoOeE9Qt9vvjbkf64KR2
	grhoKZqGgydh1emU8FmQoC5jchq8E8yBKOG0okvdt5POcYR/ZKN1Joa7k0FV5VRo7iU1XZK/OqTBx
	zx4xBbJh19HcavtyjPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHW-00GpXl-31;
	Sat, 09 Dec 2023 00:33:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHQ-00GpTU-1Y
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DCADCB830F0;
	Sat,  9 Dec 2023 00:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EA5C433D9;
	Sat,  9 Dec 2023 00:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702081994;
	bh=ZYf+SCCklojL+rFQDuhNnAEcg+CE/5aqIBLmY3otw/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/vlLFAN63TLonVDuzgDM/iQrbez8wI6/Zy/OM28cmmkKLejjX3Hgub1eIodNE8Nt
	 VUoKweM7KEzMjq07ZPZUVTyx+pZbYmuIki/5nD/X8wCm/u1SQGe8fzgHb3xeGQ8lwd
	 b9gtujc7R3OcqqJc8d1Zua2EE33qqKUmbbHx80d465DurOFC5RnosZNQ0I91EzM8uZ
	 1jZ0OyEtlf1cSQV5YT7o8v/6X+WyuAD0K1JRDd75zV796MNYET5lLD7fik9qZCVATU
	 tbw8VKMeHCPECDlxWzOtSQXIhimcWZ/M7lnXTSjZ9pA59ZXmle+FHvFjjAqfJIbsit
	 q8f4D9GUFlSbQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pavel.Kozlov@synopsys.com,
	Vineet Gupta <vgupta@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 3/5] ARC: mm: retire support for aliasing VIPT D$
Date: Fri,  8 Dec 2023 16:33:05 -0800
Message-Id: <20231209003307.480051-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209003307.480051-1-vgupta@kernel.org>
References: <20231209003307.480051-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163316_786058_79218CF2 
X-CRM114-Status: GOOD (  29.40  )
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

Legacy ARC700 processors (first generation of MMU enabled ARC cores) had
VIPT cached which could be configured such that they could alias.
Corresponding support in kernel (with all the obnoxious cache flush overhead)
was added in ARC port 10 years ago to support 1 silicon. That is long bygone
and we can let it RIP.

Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig                  |   5 --
 arch/arc/include/asm/cacheflush.h |  43 ----------
 arch/arc/mm/cache.c               | 136 ++----------------------------
 arch/arc/mm/mmap.c                |  21 +----
 arch/arc/mm/tlb.c                 |  16 ++--
 5 files changed, 14 insertions(+), 207 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 3162db540ee9..1b0483c51cc1 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -49,7 +49,6 @@ config ARC
 	select OF
 	select OF_EARLY_FLATTREE
 	select PCI_SYSCALL if PCI
-	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
 	select TRACE_IRQFLAGS_SUPPORT
 
@@ -232,10 +231,6 @@ config ARC_CACHE_PAGES
 	  Note that Global I/D ENABLE + Per Page DISABLE works but corollary
 	  Global DISABLE + Per Page ENABLE won't work
 
-config ARC_CACHE_VIPT_ALIASING
-	bool "Support VIPT Aliasing D$"
-	depends on ARC_HAS_DCACHE && ISA_ARCOMPACT
-
 endif #ARC_CACHE
 
 config ARC_HAS_ICCM
diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
index bd5b1a9a0544..563af3e75f01 100644
--- a/arch/arc/include/asm/cacheflush.h
+++ b/arch/arc/include/asm/cacheflush.h
@@ -44,31 +44,10 @@ void dma_cache_wback(phys_addr_t start, unsigned long sz);
 
 #define flush_cache_dup_mm(mm)			/* called on fork (VIVT only) */
 
-#ifndef CONFIG_ARC_CACHE_VIPT_ALIASING
-
 #define flush_cache_mm(mm)			/* called on munmap/exit */
 #define flush_cache_range(mm, u_vstart, u_vend)
 #define flush_cache_page(vma, u_vaddr, pfn)	/* PF handling/COW-break */
 
-#else	/* VIPT aliasing dcache */
-
-/* To clear out stale userspace mappings */
-void flush_cache_mm(struct mm_struct *mm);
-void flush_cache_range(struct vm_area_struct *vma,
-	unsigned long start,unsigned long end);
-void flush_cache_page(struct vm_area_struct *vma,
-	unsigned long user_addr, unsigned long page);
-
-/*
- * To make sure that userspace mapping is flushed to memory before
- * get_user_pages() uses a kernel mapping to access the page
- */
-#define ARCH_HAS_FLUSH_ANON_PAGE
-void flush_anon_page(struct vm_area_struct *vma,
-	struct page *page, unsigned long u_vaddr);
-
-#endif	/* CONFIG_ARC_CACHE_VIPT_ALIASING */
-
 /*
  * A new pagecache page has PG_arch_1 clear - thus dcache dirty by default
  * This works around some PIO based drivers which don't call flush_dcache_page
@@ -76,28 +55,6 @@ void flush_anon_page(struct vm_area_struct *vma,
  */
 #define PG_dc_clean	PG_arch_1
 
-#define CACHE_COLORS_NUM	4
-#define CACHE_COLORS_MSK	(CACHE_COLORS_NUM - 1)
-#define CACHE_COLOR(addr)	(((unsigned long)(addr) >> (PAGE_SHIFT)) & CACHE_COLORS_MSK)
-
-/*
- * Simple wrapper over config option
- * Bootup code ensures that hardware matches kernel configuration
- */
-static inline int cache_is_vipt_aliasing(void)
-{
-	return IS_ENABLED(CONFIG_ARC_CACHE_VIPT_ALIASING);
-}
-
-/*
- * checks if two addresses (after page aligning) index into same cache set
- */
-#define addr_not_cache_congruent(addr1, addr2)				\
-({									\
-	cache_is_vipt_aliasing() ? 					\
-		(CACHE_COLOR(addr1) != CACHE_COLOR(addr2)) : 0;		\
-})
-
 #define copy_to_user_page(vma, page, vaddr, dst, src, len)		\
 do {									\
 	memcpy(dst, src, len);						\
diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index f7e05c146637..9106ceac323c 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -145,10 +145,9 @@ int arc_cache_mumbojumbo(int c, char *buf, int len)
 	p_dc->sz_k = 1 << (dbcr.sz - 1);
 
 	n += scnprintf(buf + n, len - n,
-			"D-Cache\t\t: %uK, %dway/set, %uB Line, %s%s%s\n",
+			"D-Cache\t\t: %uK, %dway/set, %uB Line, %s%s\n",
 			p_dc->sz_k, assoc, p_dc->line_len,
 			vipt ? "VIPT" : "PIPT",
-			p_dc->colors > 1 ? " aliasing" : "",
 			IS_USED_CFG(CONFIG_ARC_HAS_DCACHE));
 
 slc_chk:
@@ -703,51 +702,10 @@ static inline void arc_slc_enable(void)
  * Exported APIs
  */
 
-/*
- * Handle cache congruency of kernel and userspace mappings of page when kernel
- * writes-to/reads-from
- *
- * The idea is to defer flushing of kernel mapping after a WRITE, possible if:
- *  -dcache is NOT aliasing, hence any U/K-mappings of page are congruent
- *  -U-mapping doesn't exist yet for page (finalised in update_mmu_cache)
- *  -In SMP, if hardware caches are coherent
- *
- * There's a corollary case, where kernel READs from a userspace mapped page.
- * If the U-mapping is not congruent to K-mapping, former needs flushing.
- */
 void flush_dcache_folio(struct folio *folio)
 {
-	struct address_space *mapping;
-
-	if (!cache_is_vipt_aliasing()) {
-		clear_bit(PG_dc_clean, &folio->flags);
-		return;
-	}
-
-	/* don't handle anon pages here */
-	mapping = folio_flush_mapping(folio);
-	if (!mapping)
-		return;
-
-	/*
-	 * pagecache page, file not yet mapped to userspace
-	 * Make a note that K-mapping is dirty
-	 */
-	if (!mapping_mapped(mapping)) {
-		clear_bit(PG_dc_clean, &folio->flags);
-	} else if (folio_mapped(folio)) {
-		/* kernel reading from page with U-mapping */
-		phys_addr_t paddr = (unsigned long)folio_address(folio);
-		unsigned long vaddr = folio_pos(folio);
-
-		/*
-		 * vaddr is not actually the virtual address, but is
-		 * congruent to every user mapping.
-		 */
-		if (addr_not_cache_congruent(paddr, vaddr))
-			__flush_dcache_pages(paddr, vaddr,
-						folio_nr_pages(folio));
-	}
+	clear_bit(PG_dc_clean, &folio->flags);
+	return;
 }
 EXPORT_SYMBOL(flush_dcache_folio);
 
@@ -921,44 +879,6 @@ noinline void flush_cache_all(void)
 
 }
 
-#ifdef CONFIG_ARC_CACHE_VIPT_ALIASING
-
-void flush_cache_mm(struct mm_struct *mm)
-{
-	flush_cache_all();
-}
-
-void flush_cache_page(struct vm_area_struct *vma, unsigned long u_vaddr,
-		      unsigned long pfn)
-{
-	phys_addr_t paddr = pfn << PAGE_SHIFT;
-
-	u_vaddr &= PAGE_MASK;
-
-	__flush_dcache_pages(paddr, u_vaddr, 1);
-
-	if (vma->vm_flags & VM_EXEC)
-		__inv_icache_pages(paddr, u_vaddr, 1);
-}
-
-void flush_cache_range(struct vm_area_struct *vma, unsigned long start,
-		       unsigned long end)
-{
-	flush_cache_all();
-}
-
-void flush_anon_page(struct vm_area_struct *vma, struct page *page,
-		     unsigned long u_vaddr)
-{
-	/* TBD: do we really need to clear the kernel mapping */
-	__flush_dcache_pages((phys_addr_t)page_address(page), u_vaddr, 1);
-	__flush_dcache_pages((phys_addr_t)page_address(page),
-			    (phys_addr_t)page_address(page), 1);
-
-}
-
-#endif
-
 void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long u_vaddr, struct vm_area_struct *vma)
 {
@@ -966,46 +886,11 @@ void copy_user_highpage(struct page *to, struct page *from,
 	struct folio *dst = page_folio(to);
 	void *kfrom = kmap_atomic(from);
 	void *kto = kmap_atomic(to);
-	int clean_src_k_mappings = 0;
-
-	/*
-	 * If SRC page was already mapped in userspace AND it's U-mapping is
-	 * not congruent with K-mapping, sync former to physical page so that
-	 * K-mapping in memcpy below, sees the right data
-	 *
-	 * Note that while @u_vaddr refers to DST page's userspace vaddr, it is
-	 * equally valid for SRC page as well
-	 *
-	 * For !VIPT cache, all of this gets compiled out as
-	 * addr_not_cache_congruent() is 0
-	 */
-	if (page_mapcount(from) && addr_not_cache_congruent(kfrom, u_vaddr)) {
-		__flush_dcache_pages((unsigned long)kfrom, u_vaddr, 1);
-		clean_src_k_mappings = 1;
-	}
 
 	copy_page(kto, kfrom);
 
-	/*
-	 * Mark DST page K-mapping as dirty for a later finalization by
-	 * update_mmu_cache(). Although the finalization could have been done
-	 * here as well (given that both vaddr/paddr are available).
-	 * But update_mmu_cache() already has code to do that for other
-	 * non copied user pages (e.g. read faults which wire in pagecache page
-	 * directly).
-	 */
 	clear_bit(PG_dc_clean, &dst->flags);
-
-	/*
-	 * if SRC was already usermapped and non-congruent to kernel mapping
-	 * sync the kernel mapping back to physical page
-	 */
-	if (clean_src_k_mappings) {
-		__flush_dcache_pages((unsigned long)kfrom,
-					(unsigned long)kfrom, 1);
-	} else {
-		clear_bit(PG_dc_clean, &src->flags);
-	}
+	clear_bit(PG_dc_clean, &src->flags);
 
 	kunmap_atomic(kto);
 	kunmap_atomic(kfrom);
@@ -1140,17 +1025,8 @@ static noinline void __init arc_cache_init_master(void)
 			      dc->line_len, L1_CACHE_BYTES);
 
 		/* check for D-Cache aliasing on ARCompact: ARCv2 has PIPT */
-		if (is_isa_arcompact()) {
-			int handled = IS_ENABLED(CONFIG_ARC_CACHE_VIPT_ALIASING);
-
-			if (dc->colors > 1) {
-				if (!handled)
-					panic("Enable CONFIG_ARC_CACHE_VIPT_ALIASING\n");
-				if (CACHE_COLORS_NUM != dc->colors)
-					panic("CACHE_COLORS_NUM not optimized for config\n");
-			} else if (handled && dc->colors == 1) {
-				panic("Disable CONFIG_ARC_CACHE_VIPT_ALIASING\n");
-			}
+		if (is_isa_arcompact() && dc->colors > 1) {
+			panic("Aliasing VIPT cache not supported\n");
 		}
 	}
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index fce5fa2b4f52..3c1c7ae73292 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -14,10 +14,6 @@
 
 #include <asm/cacheflush.h>
 
-#define COLOUR_ALIGN(addr, pgoff)			\
-	((((addr) + SHMLBA - 1) & ~(SHMLBA - 1)) +	\
-	 (((pgoff) << PAGE_SHIFT) & (SHMLBA - 1)))
-
 /*
  * Ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.
@@ -31,21 +27,13 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	int do_align = 0;
-	int aliasing = cache_is_vipt_aliasing();
 	struct vm_unmapped_area_info info;
 
-	/*
-	 * We only need to do colour alignment if D cache aliases.
-	 */
-	if (aliasing)
-		do_align = filp || (flags & MAP_SHARED);
-
 	/*
 	 * We enforce the MAP_FIXED case.
 	 */
 	if (flags & MAP_FIXED) {
-		if (aliasing && flags & MAP_SHARED &&
+		if (flags & MAP_SHARED &&
 		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
 			return -EINVAL;
 		return addr;
@@ -55,10 +43,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return -ENOMEM;
 
 	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+		addr = PAGE_ALIGN(addr);
 
 		vma = find_vma(mm, addr);
 		if (TASK_SIZE - len >= addr &&
@@ -70,7 +55,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
-	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	info.align_mask = 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index e536b2dcd4b0..ad702b49aeb3 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -478,21 +478,15 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 
 	create_tlb(vma, vaddr, ptep);
 
-	if (page == ZERO_PAGE(0)) {
+	if (page == ZERO_PAGE(0))
 		return;
-	}
 
 	/*
-	 * Exec page : Independent of aliasing/page-color considerations,
-	 *	       since icache doesn't snoop dcache on ARC, any dirty
-	 *	       K-mapping of a code page needs to be wback+inv so that
-	 *	       icache fetch by userspace sees code correctly.
-	 * !EXEC page: If K-mapping is NOT congruent to U-mapping, flush it
-	 *	       so userspace sees the right data.
-	 *  (Avoids the flush for Non-exec + congruent mapping case)
+	 * For executable pages, since icache doesn't snoop dcache, any
+	 * dirty K-mapping of a code page needs to be wback+inv so that
+	 * icache fetch by userspace sees code correctly.
 	 */
-	if ((vma->vm_flags & VM_EXEC) ||
-	     addr_not_cache_congruent(paddr, vaddr)) {
+	if (vma->vm_flags & VM_EXEC) {
 		struct folio *folio = page_folio(page);
 		int dirty = !test_and_set_bit(PG_dc_clean, &folio->flags);
 		if (dirty) {
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
