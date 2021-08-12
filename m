Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4768C43214
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5BC610CD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A5BC610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kAEJuDwfMbG/38nSTsG0qM0wkMIbP31sfZ16Up3WPA=; b=GMdgYvbDzOoZUW
	YdHVX7k4JNhYFcvLjmV/TbeAGfGp4YglWasZSy006TZfERUC0y96gpkRM+q8lTIUH7JVcLY5YAD7Y
	q6FfBm8BwuyUFiFoAGrc543oBqwM3z75vZDqNA6HbhlyAGUTZJWmaCNiiDEwYoxV2WgP5gTQJfdqD
	l/5QPuIrwMXJXuIi83EhLLhlK5nvJgjoRyXrizi2Z7VI9t+tVqwRXxDYBZkqLdjjMBYRmaDqPfI9l
	EcCRhRDlf7AVEZxKSXMDi/dlvtYf/kGAo0wVa7xRNrsj0ZauZwPVUyxTL9AW5S1pyGWPaOAv50Rtz
	6QAlBnE4gaRqD7oayZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH3-00BU2V-SW; Thu, 12 Aug 2021 23:38:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGw-00BTuF-Fo
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3860610FA;
 Thu, 12 Aug 2021 23:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811481;
 bh=IWyNaBVOFxoQxqyiGMzz51disJ1/hK0R28q3NRLGK10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bMzaNmK8JyKpzEfgJszpOn24QyfZmmJmIytZ9u72rJ4MIEDPomyV+8NLRWsCvdEU8
 xKk4nJ33OyT3Wlm56ooihYeoFpRckoUvE106CUqsWHhktfKPD03Qf4g07PTjvujD51
 OTJfMKqss4dsWzqWwyw4GDz5tAJ32m+XqQkhfEGJDhyIhrrgTmocPdGipZIHWF9UrF
 qi1pJ3FHjUZwMKWSt3LHZk5VU+uI0jeNB9aR14kjPKQHcj8iSwYXTtB17hMqnlg1z6
 yZVZFDLTw4E2SPNDA1vwsdHOaI4t5BEFXaTkCHLn2b0rB4FgBLxIIeQQ33X+cZqtx/
 A5VFk27meYc5g==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 08/19] ARC: mm: switch pgtable_t back to struct page *
Date: Thu, 12 Aug 2021 16:37:42 -0700
Message-Id: <20210812233753.104217-9-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163802_624971_B2B25EFA 
X-CRM114-Status: GOOD (  15.43  )
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

So far ARC pgtable_t has not been struct page based to avoid extra
page_address() calls involved. However the differences are down to
noise and get in the way of using generic code, hence this patch.

Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/page.h    |  2 +-
 arch/arc/include/asm/pgalloc.h | 57 ++++++++++------------------------
 arch/arc/mm/init.c             |  3 ++
 3 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index c4ac827379cd..514b8b70df50 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -58,7 +58,7 @@ typedef struct {
 
 #define pte_pgprot(x) __pgprot(pte_val(x))
 
-typedef pte_t * pgtable_t;
+typedef struct page *pgtable_t;
 
 /*
  * Use virt_to_pfn with caution:
diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index 408bc4b0842d..8ab1af3da6e7 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -45,22 +45,17 @@ pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 	set_pmd(pmd, __pmd((unsigned long)pte));
 }
 
-static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
+static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte_page)
 {
-	set_pmd(pmd, __pmd((unsigned long)pte));
-}
-
-static inline int __get_order_pgd(void)
-{
-	return get_order(PTRS_PER_PGD * sizeof(pgd_t));
+	set_pmd(pmd, __pmd((unsigned long)page_address(pte_page)));
 }
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	int num, num2;
-	pgd_t *ret = (pgd_t *) __get_free_pages(GFP_KERNEL, __get_order_pgd());
+	pgd_t *ret = (pgd_t *) __get_free_page(GFP_KERNEL);
 
 	if (ret) {
+		int num, num2;
 		num = USER_PTRS_PER_PGD + USER_KERNEL_GUTTER / PGDIR_SIZE;
 		memzero(ret, num * sizeof(pgd_t));
 
@@ -76,61 +71,43 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_pages((unsigned long)pgd, __get_order_pgd());
-}
-
-
-/*
- * With software-only page-tables, addr-split for traversal is tweakable and
- * that directly governs how big tables would be at each level.
- * Further, the MMU page size is configurable.
- * Thus we need to programatically assert the size constraint
- * All of this is const math, allowing gcc to do constant folding/propagation.
- */
-
-static inline int __get_order_pte(void)
-{
-	return get_order(PTRS_PER_PTE * sizeof(pte_t));
+	free_page((unsigned long)pgd);
 }
 
 static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
 	pte_t *pte;
 
-	pte = (pte_t *) __get_free_pages(GFP_KERNEL | __GFP_ZERO,
-					 __get_order_pte());
+	pte = (pte_t *) __get_free_page(GFP_KERNEL | __GFP_ZERO);
 
 	return pte;
 }
 
-static inline pgtable_t
-pte_alloc_one(struct mm_struct *mm)
+static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	pgtable_t pte_pg;
 	struct page *page;
 
-	pte_pg = (pgtable_t)__get_free_pages(GFP_KERNEL, __get_order_pte());
-	if (!pte_pg)
-		return 0;
-	memzero((void *)pte_pg, PTRS_PER_PTE * sizeof(pte_t));
-	page = virt_to_page(pte_pg);
+	page = (pgtable_t)alloc_page(GFP_KERNEL | __GFP_ZERO | __GFP_ACCOUNT);
+	if (!page)
+		return NULL;
+
 	if (!pgtable_pte_page_ctor(page)) {
 		__free_page(page);
-		return 0;
+		return NULL;
 	}
 
-	return pte_pg;
+	return page;
 }
 
 static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	free_pages((unsigned long)pte, __get_order_pte()); /* takes phy addr */
+	free_page((unsigned long)pte);
 }
 
-static inline void pte_free(struct mm_struct *mm, pgtable_t ptep)
+static inline void pte_free(struct mm_struct *mm, pgtable_t pte_page)
 {
-	pgtable_pte_page_dtor(virt_to_page(ptep));
-	free_pages((unsigned long)ptep, __get_order_pte());
+	pgtable_pte_page_dtor(pte_page);
+	__free_page(pte_page);
 }
 
 #define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, pte)
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index c083bf660cec..46ad9aee7a73 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -189,6 +189,9 @@ void __init mem_init(void)
 {
 	memblock_free_all();
 	highmem_init();
+
+	BUILD_BUG_ON((PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE);
+	BUILD_BUG_ON((PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE);
 }
 
 #ifdef CONFIG_HIGHMEM
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
