Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BB7E7718A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKbx0aHZMDOa0KTtHgeAsngH/qJUZ+4w6NrzJ2S5+Y0=; b=GgakUnllfcRlcr
	pTToIYHBRV4U72Csocl4lkBJj5+y1qVO5Mo1oRja5D6j723qBqE+YY3u21BJ1TQgWZyvEBTFC+WDz
	GyQQYbmqI+b9TMby0dgmgXlpQuNfRpLqWqdt/2lWTXici/Ef3vO3cd50BSWwPzdryf5Mafl2AKkWy
	kBw+cUwGlNHvOV+E99hbM+vJwVjWThx/luhrbhsMt8JJVrFcxkDM2zrqSszd8XlxXbuOEDL8nB38d
	0mWk1k3De/xTBRAWlRpPezEaiVke5MSAhnzf1RTbkXSrJqmFA8GUt6y3bB7hneICo0dobBrBBqKhE
	pxpey/dCAR66JYCz7Nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJoN-00000002Rv6-1nN5;
	Thu, 19 Dec 2024 16:55:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJfd-00000002PUV-0whZ;
	Thu, 19 Dec 2024 16:46:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A3511480;
	Thu, 19 Dec 2024 08:47:08 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C03F3F58B;
	Thu, 19 Dec 2024 08:46:36 -0800 (PST)
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
Subject: [PATCH 07/10] mm: Introduce ctor/dtor at P4D level
Date: Thu, 19 Dec 2024 16:44:22 +0000
Message-ID: <20241219164425.2277022-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241219164425.2277022-1-kevin.brodsky@arm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_084641_342385_2F7AD38D 
X-CRM114-Status: GOOD (  14.76  )
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

Commit 55d2a0bd5ead ("mm: add statistics for PUD level pagetable")
added accounting for PUD-level page tables. This patch does exactly
the same thing for P4D-level page tables, introducing
pagetable_p4d_[cd]tor with the same implementation as the PUD
ctor/dtor and calling them on all alloc/free paths.

Besides the small improvement in accounting accuracy, this also
enables adding construction/destruction hooks in just one generic
place for page tables at P4D level (like lower levels).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/riscv/include/asm/pgalloc.h |  8 ++++++--
 arch/s390/include/asm/pgalloc.h  | 12 ++++++++----
 arch/x86/mm/pgtable.c            |  3 +++
 include/asm-generic/pgalloc.h    |  2 ++
 include/linux/mm.h               | 10 ++++++++++
 5 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 551d614d3369..3c364ecc3100 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+	if (pgtable_l5_enabled) {
+		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+		pagetable_p4d_dtor(ptdesc);
+		riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 97db66ae06b9..85a5d07365aa 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -53,15 +53,19 @@ static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
 
-	if (table)
-		crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	pagetable_p4d_ctor(virt_to_ptdesc(table));
 	return (p4d_t *) table;
 }
 
 static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	if (!mm_p4d_folded(mm))
-		crst_table_free(mm, (unsigned long *) p4d);
+	if (mm_p4d_folded(mm))
+		return;
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	crst_table_free(mm, (unsigned long *) p4d);
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 5745a354a241..c1bfdf7b4767 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -86,6 +86,9 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+	pagetable_p4d_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
 }
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 59131629ac9c..bb482eeca0c3 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -230,6 +230,7 @@ static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
+	pagetable_p4d_ctor(ptdesc);
 	return ptdesc_address(ptdesc);
 }
 #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
@@ -247,6 +248,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
+	pagetable_p4d_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a5b482362792..e8b92f4bf3f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3161,6 +3161,16 @@ static inline void pagetable_pud_dtor(struct ptdesc *ptdesc)
 	__pagetable_dtor(ptdesc);
 }
 
+static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
+{
+	__pagetable_ctor(ptdesc);
+}
+
+static inline void pagetable_p4d_dtor(struct ptdesc *ptdesc)
+{
+	__pagetable_dtor(ptdesc);
+}
+
 extern void __init pagecache_init(void);
 extern void free_initmem(void);
 
-- 
2.47.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
