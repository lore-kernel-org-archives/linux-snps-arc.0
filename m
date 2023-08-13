Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C4C001DB
	for <linux-snps-arc@archiver.kernel.org>; Sun, 13 Aug 2023 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EAQdIqGqt/OJIkKe1FE6qswhbvLZVhTHc1usq5OMIuE=; b=42FWjVtpebkkjd
	iQytJjLHh6LFSaUZwEgafVeJLa2WMRfz/61pIDkDZrYcjZ/GThd1BznT5BeTcc1D/OGcz+IZyERUO
	B/obj6rGEiM+Ai/OFyd7hStECtmo7jqA3TSaxCWjYQNDc6hWEFsAI5+0B1MZ/szerTm7kpVJK60Az
	WeHWlE5GB1wAG8KDqE5pXlJGtQaS+mPN/mTJh+6rV/7UREeAT0/pAn4rn724BWlg4XPgGZCfo5LKx
	jkm6FCCpGI1Trl4TiQ5bXptm+YiLDbHB7TNr2rG2dweSNrOGPnhtSVzkQSlqAkprv8zmc9vdhd04d
	FeuCF4wqZHUBB6qFCJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGil-00Fcfr-1A;
	Sun, 13 Aug 2023 19:25:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGih-00Fcew-2A
	for linux-snps-arc@lists.infradead.org;
	Sun, 13 Aug 2023 19:25:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2017160B6B;
	Sun, 13 Aug 2023 19:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3231DC433C7;
	Sun, 13 Aug 2023 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691954745;
	bh=juKohjLxZc1yED468GIqAXVRzZpDDYNwp3s1o0DeLn4=;
	h=From:To:Cc:Subject:Date:From;
	b=GtCU/oOhjdCWsKYwXo9+fiw2B5Dx3HGni0TJZDgZnTnpGApMZzrTcK+Fl/hB5PNNp
	 gU58idO83CazSkMvbhorqmBaIDXqsNco0GwSUunZI+DoYE/qkE98vYhJcS6i0QeBjZ
	 Ije19uiMZW1aEs+EbtbGc//e8nKHAlVvfRGmZ3jlUKpkwW5ELXEO7NyRvRekMrC97x
	 DZrHls0aba3JEZAiQuBNS7ay1+N1Cjzvta5PwwJRnpIOed+fBvPS+3yfsAfS1WwFxP
	 U4twlzztpizh3OzasLcFcQCK7VRpqmceSi3mRDiJXNTBNP4juwAE4qYvN18EHPXqAn
	 dZZH6zOgETuow==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	rppt@kernel.org,
	willy@infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] ARC: mm: retire support for aliasing VIPT D$
Date: Sun, 13 Aug 2023 12:25:43 -0700
Message-Id: <20230813192543.474957-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_122547_804291_01061198 
X-CRM114-Status: GOOD (  30.45  )
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

Legacy ARC700 processors (first generation of MMU enabled ARC cores) has
VIPT cached which could be configured such that they could alias.
I added the VIPT aliasing support, with all the cache flush overhead to
support all but 1 silicon. That is long bygone and we can remove the
complexity and maintenance burden of that unneeded code.

This also helps streamline support for new features such as generic folio
work.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig                  |   5 --
 arch/arc/include/asm/cacheflush.h |  43 ----------
 arch/arc/mm/cache.c               | 125 ++----------------------------
 arch/arc/mm/mmap.c                |  21 +----
 arch/arc/mm/tlb.c                 |  17 ++--
 5 files changed, 14 insertions(+), 197 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 96cf8720bb93..a03da8391430 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -46,7 +46,6 @@ config ARC
 	select OF
 	select OF_EARLY_FLATTREE
 	select PCI_SYSCALL if PCI
-	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
 	select TRACE_IRQFLAGS_SUPPORT
 
@@ -229,10 +228,6 @@ config ARC_CACHE_PAGES
 	  Note that Global I/D ENABLE + Per Page DISABLE works but corollary
 	  Global DISABLE + Per Page ENABLE won't work
 
-config ARC_CACHE_VIPT_ALIASING
-	bool "Support VIPT Aliasing D$"
-	depends on ARC_HAS_DCACHE && ISA_ARCOMPACT
-
 endif #ARC_CACHE
 
 config ARC_HAS_ICCM
diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
index e201b4b1655a..077340ba641c 100644
--- a/arch/arc/include/asm/cacheflush.h
+++ b/arch/arc/include/asm/cacheflush.h
@@ -50,31 +50,10 @@ void dma_cache_wback(phys_addr_t start, unsigned long sz);
 
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
@@ -82,28 +61,6 @@ void flush_anon_page(struct vm_area_struct *vma,
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
index bdaa4aa40947..e78c3070b517 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -45,10 +45,9 @@ char *arc_cache_mumbojumbo(int c, char *buf, int len)
 		n += scnprintf(buf + n, len - n, str"\t\t: N/A\n");	\
 	else								\
 		n += scnprintf(buf + n, len - n,			\
-			str"\t\t: %uK, %dway/set, %uB Line, %s%s%s\n",	\
+			str"\t\t: %uK, %dway/set, %uB Line, %s%s\n",	\
 			(p)->sz_k, (p)->assoc, (p)->line_len,		\
 			(p)->vipt ? "VIPT" : "PIPT",			\
-			(p)->alias ? " aliasing" : "",			\
 			IS_USED_CFG(cfg));
 
 	PR_CACHE(&cpuinfo_arc700[c].icache, CONFIG_ARC_HAS_ICACHE, "I-Cache");
@@ -740,47 +739,10 @@ static inline void arc_slc_enable(void)
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
 void flush_dcache_page(struct page *page)
 {
-	struct address_space *mapping;
-
-	if (!cache_is_vipt_aliasing()) {
-		clear_bit(PG_dc_clean, &page->flags);
-		return;
-	}
-
-	/* don't handle anon pages here */
-	mapping = page_mapping_file(page);
-	if (!mapping)
-		return;
-
-	/*
-	 * pagecache page, file not yet mapped to userspace
-	 * Make a note that K-mapping is dirty
-	 */
-	if (!mapping_mapped(mapping)) {
-		clear_bit(PG_dc_clean, &page->flags);
-	} else if (page_mapcount(page)) {
-
-		/* kernel reading from page with U-mapping */
-		phys_addr_t paddr = (unsigned long)page_address(page);
-		unsigned long vaddr = page->index << PAGE_SHIFT;
-
-		if (addr_not_cache_congruent(paddr, vaddr))
-			__flush_dcache_page(paddr, vaddr);
-	}
+	/* Defer flushing of kernel mapping after a WRITE */
+	clear_bit(PG_dc_clean, &page->flags);
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
@@ -948,66 +910,11 @@ noinline void flush_cache_all(void)
 
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
-	__flush_dcache_page(paddr, u_vaddr);
-
-	if (vma->vm_flags & VM_EXEC)
-		__inv_icache_page(paddr, u_vaddr);
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
-	__flush_dcache_page((phys_addr_t)page_address(page), u_vaddr);
-	__flush_dcache_page((phys_addr_t)page_address(page),
-			    (phys_addr_t)page_address(page));
-
-}
-
-#endif
-
 void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long u_vaddr, struct vm_area_struct *vma)
 {
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
-		__flush_dcache_page((unsigned long)kfrom, u_vaddr);
-		clean_src_k_mappings = 1;
-	}
 
 	copy_page(kto, kfrom);
 
@@ -1020,17 +927,7 @@ void copy_user_highpage(struct page *to, struct page *from,
 	 * directly).
 	 */
 	clear_bit(PG_dc_clean, &to->flags);
-
-	/*
-	 * if SRC was already usermapped and non-congruent to kernel mapping
-	 * sync the kernel mapping back to physical page
-	 */
-	if (clean_src_k_mappings) {
-		__flush_dcache_page((unsigned long)kfrom, (unsigned long)kfrom);
-		set_bit(PG_dc_clean, &from->flags);
-	} else {
-		clear_bit(PG_dc_clean, &from->flags);
-	}
+	clear_bit(PG_dc_clean, &from->flags);
 
 	kunmap_atomic(kto);
 	kunmap_atomic(kfrom);
@@ -1166,18 +1063,8 @@ static noinline void __init arc_cache_init_master(void)
 			      dc->line_len, L1_CACHE_BYTES);
 
 		/* check for D-Cache aliasing on ARCompact: ARCv2 has PIPT */
-		if (is_isa_arcompact()) {
-			int handled = IS_ENABLED(CONFIG_ARC_CACHE_VIPT_ALIASING);
-			int num_colors = dc->sz_k/dc->assoc/TO_KB(PAGE_SIZE);
-
-			if (dc->alias) {
-				if (!handled)
-					panic("Enable CONFIG_ARC_CACHE_VIPT_ALIASING\n");
-				if (CACHE_COLORS_NUM != num_colors)
-					panic("CACHE_COLORS_NUM not optimized for config\n");
-			} else if (!dc->alias && handled) {
-				panic("Disable CONFIG_ARC_CACHE_VIPT_ALIASING\n");
-			}
+		if (is_isa_arcompact() && dc->alias) {
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
index 2a3105a682c3..b53ad03ae564 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -476,22 +476,15 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
 
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
-
+	if (vma->vm_flags & VM_EXEC) {
 		int dirty = !test_and_set_bit(PG_dc_clean, &page->flags);
 		if (dirty) {
 			/* wback + inv dcache lines (K-mapping) */
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
