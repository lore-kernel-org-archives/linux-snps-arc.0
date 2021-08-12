Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6E7C4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9021610A4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9021610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OEiRnCMriUJNkE9Us1xJPEeLaHy0I13dwH/ymmQyCU=; b=Mb0CZnia8+hgRY
	qXAoQSjtm1NNDyG6dLp+Pvyrv8/WWgTOWjmamqPaZ/AiN235f++qkry22qfIfQtgQW0MlZVShp9Kp
	bqOds8oO7yTJRFlV+JjncEjgV+HzL1CzxqsxB+yWLS4hjMU83mK89UEkEsUNF0XQpYigYyX/bWMAw
	/0m5sG9s/yLexHNbfSN5LwzqcLRTxSEnIp5R6+DvLDMyTMSCC3ZzYY7VnAfvf7eXxjrEXzFa7dGH2
	zWynLYmvzx+/YLbP5is1/BtTEcBd5OmhOuUpoRTTBXW30w8rJnieXI5QGhKRNcV32YYTgKE2oNSDc
	cbB+HzJPpTzMaOmbxnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKHB-00BUBW-1c; Thu, 12 Aug 2021 23:38:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKH0-00BTyl-9i
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3AA8610A4;
 Thu, 12 Aug 2021 23:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811485;
 bh=Zfvf7PqDmvH0bSGDxCh5bZxbmsW668jVrn2bJhjQeHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wksp8+pKY+hKDYRj3YOG2np/XDZg2A/rgtEyHJv+Z7IJHIR2YKymr4LM7dJtCPWHe
 d7H9kXfhKrwl6GcqX//o0NVW/3nFAPaQM9LB2RlSlN67weKsXMeT62WLZh6xCnw/7M
 BNmomwKekBhYPuxADNKln+49+7LtDIQfpDGOZ5pQCFn1eFC64MkMGV+Z0ptrw7Zs3p
 Jmrh3sHNXA70eEz0NI/bqH0jIY0U55Mg3fztXSlFY/zEUzVKTaxQaVj8RAtP7Szb/y
 tNxS+fE2M6vTKp4u6Me5JzfoKEv0juo/o/u5m4b9V63useHWfEJOv/mbIbmVqhLcIX
 ZnLOtrexr4zhQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 17/19] ARC: mm: support 4 levels of page tables
Date: Thu, 12 Aug 2021 16:37:51 -0700
Message-Id: <20210812233753.104217-18-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163806_557048_C8D0C33D 
X-CRM114-Status: GOOD (  13.49  )
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
 arch/arc/include/asm/pgalloc.h        | 11 +++++++
 arch/arc/include/asm/pgtable-levels.h | 45 ++++++++++++++++++++++++---
 arch/arc/mm/fault.c                   |  2 ++
 arch/arc/mm/init.c                    |  1 +
 arch/arc/mm/tlbex.S                   |  9 ++++++
 6 files changed, 74 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 5d7899d87c08..9a62e1d87967 100644
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
index 781620d2e86f..096b8ef58edb 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -70,6 +70,17 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return ret;
 }
 
+#if CONFIG_PGTABLE_LEVELS > 3
+
+static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
+{
+	set_p4d(p4dp, __p4d((unsigned long)pudp));
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
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index f7ba2a5d5ec8..699ecf119641 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -191,6 +191,7 @@ void __init mem_init(void)
 	highmem_init();
 
 	BUILD_BUG_ON((PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE);
+	BUILD_BUG_ON((PTRS_PER_PUD * sizeof(pud_t)) > PAGE_SIZE);
 	BUILD_BUG_ON((PTRS_PER_PMD * sizeof(pmd_t)) > PAGE_SIZE);
 	BUILD_BUG_ON((PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE);
 }
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 5f57eba1089d..e054780a8fe0 100644
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
