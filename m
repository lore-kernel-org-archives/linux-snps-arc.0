Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBA0E77184
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xT/JY2H7ukKuTmIif3oBZzg9XP/Evmp/pOxJZEgBLYA=; b=UboYfyxsDvE4Ot
	QTS8Yfzu0ECpWLclqfknBWYIp42Sh6pZH2cw4Q4ZbKnHVLtOvJMOf0CzRxhPd88GPLxw7CNjFCbmf
	+lhqn1c9to29KMmtp0QbkaDScWKL1TZH4JEmPOKKu1h5LcHLS+k1B6ZsnTSY5PVp1939NPXFV0SM6
	o/KUDuJFSJ8SvkNPG/mlMQ0lYE6ySQyUrwicK/H013+TgPpvNTF+JwoejIO1q3mx/r8DW+jzXpu45
	OqCw7Vh7DZoA5U+QEyHvxQI+hS+faszNisMEP24imfey1LN5SXVCnECwtYCg8C61ZN3WHBuUWn5Rp
	xnXG/BtOIw3+Zuz0WRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJhr-00000002QCM-36Nu;
	Thu, 19 Dec 2024 16:48:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJfE-00000002PGw-0Nl2;
	Thu, 19 Dec 2024 16:46:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FF7A1D13;
	Thu, 19 Dec 2024 08:46:43 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60DB33F58B;
	Thu, 19 Dec 2024 08:46:11 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to helpers
Date: Thu, 19 Dec 2024 16:44:16 +0000
Message-ID: <20241219164425.2277022-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241219164425.2277022-1-kevin.brodsky@arm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_084616_241678_C1813533 
X-CRM114-Status: GOOD (  10.03  )
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

Besides the ptlock management at PTE/PMD level, all the
pagetable_*_[cd]tor have the same implementation. Introduce common
helpers for all levels to reduce the duplication.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 46 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c39c4945946c..a5b482362792 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2915,6 +2915,22 @@ static inline void pagetable_free(struct ptdesc *pt)
 	__free_pages(page, compound_order(page));
 }
 
+static inline void __pagetable_ctor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+}
+
+static inline void __pagetable_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -2992,22 +3008,16 @@ static inline void ptlock_free(struct ptdesc *ptdesc) {}
 
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
 	if (!ptlock_init(ptdesc))
 		return false;
-	__folio_set_pgtable(folio);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 	return true;
 }
 
 static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
 	ptlock_free(ptdesc);
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+	__pagetable_dtor(ptdesc);
 }
 
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
@@ -3110,22 +3120,16 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
 	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__folio_set_pgtable(folio);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 	return true;
 }
 
 static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
 	pmd_ptlock_free(ptdesc);
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+	__pagetable_dtor(ptdesc);
 }
 
 /*
@@ -3149,18 +3153,12 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 
 static inline void pagetable_pud_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	__folio_set_pgtable(folio);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 }
 
 static inline void pagetable_pud_dtor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	__folio_clear_pgtable(folio);
-	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+	__pagetable_dtor(ptdesc);
 }
 
 extern void __init pagecache_init(void);
-- 
2.47.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
