Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F9C19F41
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE45460EDF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE45460EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1ESdfepDWzmkiXSSPqx9bE2mDwvfd/8SIbr6Nj8KlY=; b=Tves1eq26Igep+
	eHM725e3LsPE4uCjL7bw4PvZhq2bHRR0TzqTHe/Oi1qXLVFHR+b8/qil3jIN9JeFlV806ihqnI1WV
	X63T080kZ+g9iyxy9Tg2woS+iOE2WxHpAoJ0WQR8Ju0jWY67j/NwKNXrgpDzhRLZUHL9Gz/cgjKU7
	wthg6l7CnqoeFvaTFemrDe8CyjHC/IgEQiqrdEOzh4xaGmqkc5k6aiGRWOb/VPTC5ybnGCYLyNEJy
	V3lfBee2KB49BiFA2ykxrON5TDe8udiyj4JRIw9bF2WObIWdOR6xKVAZx8Nsee5IRPVYGIvbFT59M
	fcDTq28osks0+/26zf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcLC-0056q0-B0; Wed, 11 Aug 2021 00:43:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL5-0056cv-4U
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B562B61008;
 Wed, 11 Aug 2021 00:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642602;
 bh=fbU0hMmleCw5vRgQgXl1CKzt9JscXC+sV2x5UO3YuGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LqPNYuK2wTt0KTP/CLyyyDZ+7qk/5ZvutiPZwv+6AkJVRYI0LKwaa1YjBXbbsRz1n
 zjEu0d8Eub46NnLcuoa+2ThJ7y5XJtzvkRe3QmLCpcAVUcOAZMKrEoJxlj+TnmPKV5
 x38JQmkSO8xA6cVdO5ksMmGXYczvX71ocM+rx+k1Ds2GnbXa8OcfY0kBb91xrAEnuG
 v+3gU2t1eM3m79CFAT845BEO5PPztfBR41ymp6IFS0FIQMlk9biORrxHHJf1YAV2wx
 EtF4Vb7lGwYHzLAr6n4Jtxt/EzW8euzUhTxQEHXtRUC0vTCrgYdKY7jV0k28WIIC7M
 xwmMoRf/1m+gA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 15/18] ARC: mm: support 3 levels of page tables
Date: Tue, 10 Aug 2021 17:42:55 -0700
Message-Id: <20210811004258.138075-16-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174323_278203_2BA3CD1F 
X-CRM114-Status: GOOD (  19.59  )
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

ARCv2 MMU is software walked and Linux implements 2 levels of paging: pgd/pte.
Forthcoming hw will have multiple levels, so this change preps mm code
for same. It is also fun to try multi levels even on soft-walked code to
ensure generic mm code is robust to handle.

overview
________

2 levels {pgd, pte} : pmd is folded but pmd_* macros are valid and operate on pgd
3 levels {pgd, pmd, pte}:
  - pud is folded and pud_* macros point to pgd
  - pmd_* macros operate on actual pmd

code changes
____________

1. #include <asm-generic/pgtable-nopud.h>

2. Define CONFIG_PGTABLE_LEVELS 3

3a. Define PMD_SHIFT, PMD_SIZE, PMD_MASK, pmd_t
3b. Define pmd_val() which actually deals with pmd
    (pmd_offset(), pmd_index() are provided by generic code)
3c. Define pmd_alloc_one() and pmd_free() to allocate pmd
    (pmd_populate/pmd_free already exist)

4. Define pud_none(), pud_bad() macros based on generic pud_val() which
   internally pertains to pgd now.
4b. define pud_populate() to just setup pgd

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig                      |  4 ++
 arch/arc/include/asm/page.h           | 11 +++++
 arch/arc/include/asm/pgalloc.h        | 22 ++++++++++
 arch/arc/include/asm/pgtable-levels.h | 63 ++++++++++++++++++++++++---
 arch/arc/include/asm/processor.h      |  2 +-
 arch/arc/mm/fault.c                   |  4 ++
 arch/arc/mm/tlb.c                     |  4 +-
 arch/arc/mm/tlbex.S                   |  9 ++++
 8 files changed, 111 insertions(+), 8 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 59d5b2a179f6..43cb8aaf57a2 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -314,6 +314,10 @@ config ARC_HUGEPAGE_16M
 
 endchoice
 
+config PGTABLE_LEVELS
+	int "Number of Page table levels"
+	default 2
+
 config ARC_COMPACT_IRQ_LEVELS
 	depends on ISA_ARCOMPACT
 	bool "Setup Timer IRQ as high Priority"
diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 313e6f543d2d..df3cc154ae4a 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -41,6 +41,17 @@ typedef struct {
 #define pgd_val(x)	((x).pgd)
 #define __pgd(x)	((pgd_t) { (x) })
 
+#if CONFIG_PGTABLE_LEVELS > 2
+
+typedef struct {
+	unsigned long pmd;
+} pmd_t;
+
+#define pmd_val(x)	((x).pmd)
+#define __pmd(x)	((pmd_t) { (x) })
+
+#endif
+
 typedef struct {
 #ifdef CONFIG_ARC_HAS_PAE40
 	unsigned long long pte;
diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index 0cf73431eb89..01c2d84418ed 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -86,6 +86,28 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 }
 
 
+#if CONFIG_PGTABLE_LEVELS > 2
+
+static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
+{
+	set_pud(pudp, __pud((unsigned long)pmdp));
+}
+
+static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long addr)
+{
+	return (pmd_t *)__get_free_page(
+		GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO);
+}
+
+static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
+{
+	free_page((unsigned long)pmd);
+}
+
+#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
+
+#endif
+
 /*
  * With software-only page-tables, addr-split for traversal is tweakable and
  * that directly governs how big tables would be at each level.
diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index 8ece75335bb5..1c2f022d4ad0 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -10,6 +10,8 @@
 #ifndef _ASM_ARC_PGTABLE_LEVELS_H
 #define _ASM_ARC_PGTABLE_LEVELS_H
 
+#if CONFIG_PGTABLE_LEVELS == 2
+
 /*
  * 2 level paging setup for software walked MMUv3 (ARC700) and MMUv4 (HS)
  *
@@ -37,16 +39,38 @@
 #define PGDIR_SHIFT		21
 #endif
 
-#define PGDIR_SIZE		BIT(PGDIR_SHIFT)	/* vaddr span, not PDG sz */
-#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
+#else
+
+/*
+ * A default 3 level paging testing setup in software walked MMU
+ *   MMUv4 (8K page): <4> : <7> : <8> : <13>
+ */
+#define PGDIR_SHIFT		28
+#if CONFIG_PGTABLE_LEVELS > 2
+#define PMD_SHIFT		21
+#endif
+
+#endif
 
+#define PGDIR_SIZE		BIT(PGDIR_SHIFT)
+#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
 #define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
 
-#define PTRS_PER_PTE		BIT(PGDIR_SHIFT - PAGE_SHIFT)
+#if CONFIG_PGTABLE_LEVELS > 2
+#define PMD_SIZE		BIT(PMD_SHIFT)
+#define PMD_MASK		(~(PMD_SIZE - 1))
+#define PTRS_PER_PMD		BIT(PGDIR_SHIFT - PMD_SHIFT)
+#endif
+
+#define PTRS_PER_PTE		BIT(PMD_SHIFT - PAGE_SHIFT)
 
 #ifndef __ASSEMBLY__
 
+#if CONFIG_PGTABLE_LEVELS > 2
+#include <asm-generic/pgtable-nopud.h>
+#else
 #include <asm-generic/pgtable-nopmd.h>
+#endif
 
 /*
  * 1st level paging: pgd
@@ -57,9 +81,35 @@
 #define pgd_ERROR(e) \
 	pr_crit("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
+#if CONFIG_PGTABLE_LEVELS > 2
+
+/* In 3 level paging, pud_* macros work on pgd */
+#define pud_none(x)		(!pud_val(x))
+#define pud_bad(x)		((pud_val(x) & ~PAGE_MASK))
+#define pud_present(x)		(pud_val(x))
+#define pud_clear(xp)		do { pud_val(*(xp)) = 0; } while (0)
+#define pud_pgtable(pud)	((pmd_t *)(pud_val(pud) & PAGE_MASK))
+#define pud_page(pud)		virt_to_page(pud_pgtable(pud))
+#define set_pud(pudp, pud)	(*(pudp) = pud)
+
+/*
+ * 2nd level paging: pmd
+ */
+#define pmd_ERROR(e) \
+	pr_crit("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
+
+#define pmd_pfn(pmd)		((pmd_val(pmd) & PMD_MASK) >> PAGE_SHIFT)
+#define pfn_pmd(pfn,prot)	__pmd(((pfn) << PAGE_SHIFT) | pgprot_val(prot))
+#define mk_pmd(page,prot)	pfn_pmd(page_to_pfn(page),prot)
+
+#endif
+
 /*
- * Due to the strange way generic pgtable level folding works, in a 2 level
- * setup, pmd_val() returns pgd, so these pmd_* macros actually work on pgd
+ * Due to the strange way generic pgtable level folding works, the pmd_* macros
+ *  - are valid even for 2 levels (which supposedly only has pgd - pte)
+ *  - behave differently for 2 vs. 3
+ * In 2  level paging        (pgd -> pte), pmd_* macros work on pgd
+ * In 3+ level paging (pgd -> pmd -> pte), pmd_* macros work on pmd
  */
 #define pmd_none(x)		(!pmd_val(x))
 #define pmd_bad(x)		((pmd_val(x) & ~PAGE_MASK))
@@ -70,6 +120,9 @@
 #define set_pmd(pmdp, pmd)	(*(pmdp) = pmd)
 #define pmd_pgtable(pmd)	((pgtable_t) pmd_page_vaddr(pmd))
 
+/*
+ * 3rd level paging: pte
+ */
 #define pte_ERROR(e) \
 	pr_crit("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index e4031ecd3c8c..f28afcf5c6d1 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -93,7 +93,7 @@ extern unsigned int get_wchan(struct task_struct *p);
 #define VMALLOC_START	(PAGE_OFFSET - (CONFIG_ARC_KVADDR_SIZE << 20))
 
 /* 1 PGDIR_SIZE each for fixmap/pkmap, 2 PGDIR_SIZE gutter (see asm/highmem.h) */
-#define VMALLOC_SIZE	((CONFIG_ARC_KVADDR_SIZE << 20) - PGDIR_SIZE * 4)
+#define VMALLOC_SIZE	((CONFIG_ARC_KVADDR_SIZE << 20) - PMD_SIZE * 4)
 
 #define VMALLOC_END	(VMALLOC_START + VMALLOC_SIZE)
 
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 41f154320964..8da2f0ad8c69 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -39,6 +39,8 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	if (!pgd_present(*pgd_k))
 		goto bad_area;
 
+	set_pgd(pgd, *pgd_k);
+
 	p4d = p4d_offset(pgd, address);
 	p4d_k = p4d_offset(pgd_k, address);
 	if (!p4d_present(*p4d_k))
@@ -49,6 +51,8 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	if (!pud_present(*pud_k))
 		goto bad_area;
 
+	set_pud(pud, *pud_k);
+
 	pmd = pmd_offset(pud, address);
 	pmd_k = pmd_offset(pud_k, address);
 	if (!pmd_present(*pmd_k))
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 34f16e0b41e6..77da83569b36 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -658,8 +658,8 @@ char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len)
 			  IS_USED_CFG(CONFIG_TRANSPARENT_HUGEPAGE));
 
 	n += scnprintf(buf + n, len - n,
-		      "MMU [v%x]\t: %dk PAGE, %sJTLB %d (%dx%d), uDTLB %d, uITLB %d%s%s\n",
-		       p_mmu->ver, p_mmu->pg_sz_k, super_pg,
+		      "MMU [v%x]\t: %dk PAGE, %s, swalk %d lvl, JTLB %d (%dx%d), uDTLB %d, uITLB %d%s%s\n",
+		       p_mmu->ver, p_mmu->pg_sz_k, super_pg,  CONFIG_PGTABLE_LEVELS,
 		       p_mmu->sets * p_mmu->ways, p_mmu->sets, p_mmu->ways,
 		       p_mmu->u_dtlb, p_mmu->u_itlb,
 		       IS_AVAIL2(p_mmu->pae, ", PAE40 ", CONFIG_ARC_HAS_PAE40));
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index d08bd09a0afc..5f6bfdfda1be 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -173,6 +173,15 @@ ex_saved_reg1:
 	tst	r3, r3
 	bz	do_slow_path_pf         ; if no Page Table, do page fault
 
+#if CONFIG_PGTABLE_LEVELS > 2
+	lsr     r0, r2, PMD_SHIFT	; Bits for indexing into PMD
+	and	r0, r0, (PTRS_PER_PMD - 1)
+	ld.as	r1, [r3, r0]		; PMD entry
+	tst	r1, r1
+	bz	do_slow_path_pf
+	mov	r3, r1
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	and.f	0, r3, _PAGE_HW_SZ	; Is this Huge PMD (thp)
 	add2.nz	r1, r1, r0
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
