Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96608C4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31BED60EFF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31BED60EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NErPh1CGcnPdZYOQgLkdryC57uZ0Z0pzGdYyOhv27T0=; b=P8pA6oBvLjNuBZ
	jzVwk+F2IX0GwA19j6m0eFfM8PEEBv0II9eBtEhq+n7HPu5+Cgc+ldOuxb03UMsE9wrmOJgi+I1K3
	HgdJI9me1XDmr/Vubp2KmATwZBt+3w5PDKpj+G+EKGmobR8CvVRyWTdQtUy2ZoQ0RC3AQZ2sAxc14
	2WX0mzD8HQYmnvJdoCF24ApZBhbdK00oOfZOKJB8ke+Ke5m037EQn7GTWVaY6PWuY39ne8iNpx1hB
	8XAHSmZoX+PL5j4VfYGtPG4YzfJ1u0okqhTrd99YBQUBkvy3abPyMalomtTgV1wUatIDjQMamxdzk
	+0Whz1PDT1Egc+ZDbegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcLC-0056qQ-JG; Wed, 11 Aug 2021 00:43:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL5-0056fH-K3
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C69C60EB9;
 Wed, 11 Aug 2021 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642603;
 bh=bkSeK1zM8h+JAAwlZRlJp4kcognaCCVRcd5O5x4DWII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XTmZmpVbbXqnh9TVRFwLMoAKGFYaxy6EIAZYZ9Or+yC04yXxh8CPyNvv//OB/89On
 cRZeQ7WUVn9vMYQ8qXM7tE947CmZGBGoy/7+q3bWPQY1L0jxe431nY3eKI36TZJclg
 exYHWq9ckoJPpMFiAmzX9BqGlgf9LbJUdGXhwDe+7izebqxgqq5/vR6LDOkvM/LqfX
 QU6Ad0hBV+pNgrbfBk0X46vduXxi3E767Wu0I0kBvp4PjXeOYuT1GCAMaHJT0Ub+pt
 Pibgs8vmBCHolgHTtQ1atZU1syYeRRfiXfF4izfN98TNd8sPHMKi0EhquPKY3EHySD
 LNZtRxggf36lw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 16/18] ARC: mm: support 4 levels of page tables
Date: Tue, 10 Aug 2021 17:42:56 -0700
Message-Id: <20210811004258.138075-17-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174323_748719_D7C31A9F 
X-CRM114-Status: GOOD (  13.13  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/page.h           | 11 +++++++
 arch/arc/include/asm/pgalloc.h        | 22 +++++++++++++
 arch/arc/include/asm/pgtable-levels.h | 45 ++++++++++++++++++++++++---
 arch/arc/mm/fault.c                   |  2 ++
 arch/arc/mm/tlbex.S                   |  9 ++++++
 5 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index df3cc154ae4a..883856f12afe 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -41,6 +41,17 @@ typedef struct {
 #define pgd_val(x)	((x).pgd)
 #define __pgd(x)	((pgd_t) { (x) })
 
+#if CONFIG_PGTABLE_LEVELS > 3
+
+typedef struct {
+	unsigned long pud;
+} pud_t;
+
+#define pud_val(x)      	((x).pud)
+#define __pud(x)        	((pud_t) { (x) })
+
+#endif
+
 #if CONFIG_PGTABLE_LEVELS > 2
 
 typedef struct {
diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index 01c2d84418ed..e99c724d9235 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -86,6 +86,28 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 }
 
 
+#if CONFIG_PGTABLE_LEVELS > 3
+
+static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
+{
+	set_p4d(p4dp, __p4d((unsigned long)pudp));
+}
+
+static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
+{
+	return (pud_t *)__get_free_page(
+		GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO);
+}
+
+static inline void pud_free(struct mm_struct *mm, pud_t *pudp)
+{
+	free_page((unsigned long)pudp);
+}
+
+#define __pud_free_tlb(tlb, pmd, addr)  pud_free((tlb)->mm, pmd)
+
+#endif
+
 #if CONFIG_PGTABLE_LEVELS > 2
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index 1c2f022d4ad0..2da3c4e52a91 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -44,8 +44,13 @@
 /*
  * A default 3 level paging testing setup in software walked MMU
  *   MMUv4 (8K page): <4> : <7> : <8> : <13>
+ * A default 4 level paging testing setup in software walked MMU
+ *   MMUv4 (8K page): <4> : <3> : <4> : <8> : <13>
  */
 #define PGDIR_SHIFT		28
+#if CONFIG_PGTABLE_LEVELS > 3
+#define PUD_SHIFT		25
+#endif
 #if CONFIG_PGTABLE_LEVELS > 2
 #define PMD_SHIFT		21
 #endif
@@ -56,17 +61,25 @@
 #define PGDIR_MASK		(~(PGDIR_SIZE - 1))
 #define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
 
+#if CONFIG_PGTABLE_LEVELS > 3
+#define PUD_SIZE		BIT(PUD_SHIFT)
+#define PUD_MASK		(~(PUD_SIZE - 1))
+#define PTRS_PER_PUD		BIT(PGDIR_SHIFT - PUD_SHIFT)
+#endif
+
 #if CONFIG_PGTABLE_LEVELS > 2
 #define PMD_SIZE		BIT(PMD_SHIFT)
 #define PMD_MASK		(~(PMD_SIZE - 1))
-#define PTRS_PER_PMD		BIT(PGDIR_SHIFT - PMD_SHIFT)
+#define PTRS_PER_PMD		BIT(PUD_SHIFT - PMD_SHIFT)
 #endif
 
 #define PTRS_PER_PTE		BIT(PMD_SHIFT - PAGE_SHIFT)
 
 #ifndef __ASSEMBLY__
 
-#if CONFIG_PGTABLE_LEVELS > 2
+#if CONFIG_PGTABLE_LEVELS > 3
+#include <asm-generic/pgtable-nop4d.h>
+#elif CONFIG_PGTABLE_LEVELS > 2
 #include <asm-generic/pgtable-nopud.h>
 #else
 #include <asm-generic/pgtable-nopmd.h>
@@ -81,9 +94,31 @@
 #define pgd_ERROR(e) \
 	pr_crit("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
+#if CONFIG_PGTABLE_LEVELS > 3
+
+/* In 4 level paging, p4d_* macros work on pgd */
+#define p4d_none(x)		(!p4d_val(x))
+#define p4d_bad(x)		((p4d_val(x) & ~PAGE_MASK))
+#define p4d_present(x)		(p4d_val(x))
+#define p4d_clear(xp)		do { p4d_val(*(xp)) = 0; } while (0)
+#define p4d_pgtable(p4d)	((pud_t *)(p4d_val(p4d) & PAGE_MASK))
+#define p4d_page(p4d)		virt_to_page(p4d_pgtable(p4d))
+#define set_p4d(p4dp, p4d)	(*(p4dp) = p4d)
+
+/*
+ * 2nd level paging: pud
+ */
+#define pud_ERROR(e) \
+	pr_crit("%s:%d: bad pud %08lx.\n", __FILE__, __LINE__, pud_val(e))
+
+#endif
+
 #if CONFIG_PGTABLE_LEVELS > 2
 
-/* In 3 level paging, pud_* macros work on pgd */
+/*
+ * In 3 level paging, pud_* macros work on pgd
+ * In 4 level paging, pud_* macros work on pud
+ */
 #define pud_none(x)		(!pud_val(x))
 #define pud_bad(x)		((pud_val(x) & ~PAGE_MASK))
 #define pud_present(x)		(pud_val(x))
@@ -93,7 +128,7 @@
 #define set_pud(pudp, pud)	(*(pudp) = pud)
 
 /*
- * 2nd level paging: pmd
+ * 3rd level paging: pmd
  */
 #define pmd_ERROR(e) \
 	pr_crit("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
@@ -121,7 +156,7 @@
 #define pmd_pgtable(pmd)	((pgtable_t) pmd_page_vaddr(pmd))
 
 /*
- * 3rd level paging: pte
+ * 4th level paging: pte
  */
 #define pte_ERROR(e) \
 	pr_crit("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 8da2f0ad8c69..f8994164fa36 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -46,6 +46,8 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	if (!p4d_present(*p4d_k))
 		goto bad_area;
 
+	set_p4d(p4d, *p4d_k);
+
 	pud = pud_offset(p4d, address);
 	pud_k = pud_offset(p4d_k, address);
 	if (!pud_present(*pud_k))
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 5f6bfdfda1be..e1831b6fafa9 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -173,6 +173,15 @@ ex_saved_reg1:
 	tst	r3, r3
 	bz	do_slow_path_pf         ; if no Page Table, do page fault
 
+#if CONFIG_PGTABLE_LEVELS > 3
+	lsr     r0, r2, PUD_SHIFT	; Bits for indexing into PUD
+	and	r0, r0, (PTRS_PER_PUD - 1)
+	ld.as	r1, [r3, r0]		; PMD entry
+	tst	r1, r1
+	bz	do_slow_path_pf
+	mov	r3, r1
+#endif
+
 #if CONFIG_PGTABLE_LEVELS > 2
 	lsr     r0, r2, PMD_SHIFT	; Bits for indexing into PMD
 	and	r0, r0, (PTRS_PER_PMD - 1)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
