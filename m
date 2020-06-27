Return-Path: <SRS0=73lZ=AI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AA7C433DF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 18:46:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A513520724
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 18:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JEuotQpB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rt8TkjxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A513520724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CDTxQx5PQ9GIibwyKqowqsQ0c8ZXfv0gXMl0Z9XmRcw=; b=JEuotQpBu44SODCxKRu/f454l
	avPH1YsDj8FHw0xhnzQ4JTrLl9T/vguiYkhQV0OkK73AqVUcq9FgXVuqiUcRE462CMcLs6gX/pN4T
	kkNcU88la5IYKgRLLqJ6EEnt9a4nIg5Qb06AjN0UNDNxbAi6Z71Ni0EjO8r81l1l9ZzX3PkEd+MnJ
	qcFa/tz4CyDMC4x0XWtaRC84LRdZKyMT++70prYbcnHE5fcJZmbaGFRwvokKx1HG0wJqYJLs2OOxx
	MjV++3l4ygMPrXDhft74OG2Ew7yTYo4tWYgscPNdM6eMlaTQ+hqwGbpuChDrdEfy1u2ZtPIxPoiRG
	U6BqFVuVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpFqn-0005Zb-Rh; Sat, 27 Jun 2020 18:46:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpFqe-0005Ye-QM; Sat, 27 Jun 2020 18:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1N0BByy8wh3U5L6kSyD094uOjKmOfferUMmn5EME8io=; b=rt8TkjxM6E+8nmcpYCJvT3+hGr
 H4ecs3CPjquKl0PwNGx/0fLvLzSeMiWcVi9g0WCIz3JnPQUXbHNqxCwsT2ayVaFw3c97wVSQmiW1a
 rRm52Ir+aRTZP4azHkd5YkWRXRczyXy3h3kPFA95NHffmRnSpt92NCElCKtgs9bWeGRSTPeQhCTju
 iPtJAvPHoRFkmTEM1tJ00siPzLuSHbI8lKSLvU4vW88vtaVf2379Kp5XmE9uUb/m7xTPxYufnEdnI
 IEHPwIDOHEDO9KXQeLwESz53maPxEJf9fE+lLaTHw5uxLUAf5caLMZIB5tLXnAC15PHD057E6o2BK
 h9N6MSEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jpFqc-00058E-Db; Sat, 27 Jun 2020 18:46:42 +0000
Date: Sat, 27 Jun 2020 19:46:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 9/8] mm: Account PMD tables like PTE tables
Message-ID: <20200627184642.GF25039@casper.infradead.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

We account the PTE level of the page tables to the process in order to
make smarter OOM decisions and help diagnose why memory is fragmented.
For these same reasons, we should account pages allocated for PMDs.
With larger process address spaces and ASLR, the number of PMDs in use
is higher than it used to be so the inaccuracy is starting to matter.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dc7b87310c10..b283e25fcffa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2271,7 +2271,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_to_page(pmd));
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pmd_ptlock_init(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	page->pmd_huge_pte = NULL;
@@ -2279,7 +2279,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 	return ptlock_init(page);
 }
 
-static inline void pgtable_pmd_page_dtor(struct page *page)
+static inline void pmd_ptlock_free(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
@@ -2296,8 +2296,8 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
-static inline void pgtable_pmd_page_dtor(struct page *page) {}
+static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2310,6 +2310,22 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	if (!pmd_ptlock_init(page))
+		return false;
+	__SetPageTable(page);
+	inc_zone_page_state(page, NR_PAGETABLE);
+	return true;
+}
+
+static inline void pgtable_pmd_page_dtor(struct page *page)
+{
+	pmd_ptlock_free(page);
+	__ClearPageTable(page);
+	dec_zone_page_state(page, NR_PAGETABLE);
+}
+
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
