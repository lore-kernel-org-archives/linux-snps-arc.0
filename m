Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602F1C19F3C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1561B6101D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1561B6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VXw1Zvat4tE/MS99iFP6oUevSoHb/q3kzOzRgKszLI=; b=eHJaJo2k61/XZp
	GUiFndzzAe0iGsYvLgEI50seu0f9rkzkdZQOe1m3cWd7BiIlLt12rRmvEIvWXtq5zA7cNYH/Mym5Z
	nJ2rFLEBPOTcQozLXOkF1iW8Z1w2iUHfiMdorN1sUd3OHvmWd3ZgV6cRT2IhjvDVG/HAiFyEv+Ii4
	olgTQjr/AC5sWMGKlzClwAeprR0aqK4TcRhsjW/DHEbidEbBj/i3lrRtTvmkWMKHCrsm4Uj4twdZx
	gg287R4/GgGdfurT+vxXmwopSRHc+zR8SP4EswRrVyDK+Bnzw8B6UTwSdDfSgR6JvHinvLstHwOh+
	CRuaxl++E/wd5jYYAjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL7-0056kW-Cs; Wed, 11 Aug 2021 00:43:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL2-0056cv-HT
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C330610FC;
 Wed, 11 Aug 2021 00:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642600;
 bh=iW4KvuWuC+r5z39MFQzwrbwCs0tKRK5GIGFWIb/ZRJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=agy6Rj11nk6gxe06wBgAua7nlZQ5Lkktx0Qtu9NWGx3Dyz1Ac9gkJfbTindxD4NJb
 iVuNiEnXjhwfd7iOzQIh42HKk7mj/QSv3lYGVA83QIM1zjK1KTZxKWtt10tPW8abL7
 QcB4UC8QATKQ2XIOcbTGGiuba4r5F5wyMGhNuM/bB8ehF6Vtz/70Wo23Np+qvS821W
 yQ6zTuTQG9h/rkXk+7Sz40K8+hK+FLYpZQUV0uT3Q0bAsr/J+jl9nh2986SA5G41YZ
 6T/OzK/iD2vARp9YolUHaRcVfZMjd0I0ruDHt4s+h6VfCNZrKi/1NbRU1OgopWpU3G
 UDwuuvxls+8Lw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 09/18] ARC: mm: non-functional code cleanup ahead of 3 levels
Date: Tue, 10 Aug 2021 17:42:49 -0700
Message-Id: <20210811004258.138075-10-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174320_650127_FC11F54C 
X-CRM114-Status: GOOD (  11.42  )
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
 arch/arc/include/asm/page.h    | 30 ++++++++++++++++--------------
 arch/arc/include/asm/pgalloc.h |  7 ++++++-
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index c4ac827379cd..313e6f543d2d 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -34,6 +34,13 @@ void copy_user_highpage(struct page *to, struct page *from,
 			unsigned long u_vaddr, struct vm_area_struct *vma);
 void clear_user_page(void *to, unsigned long u_vaddr, struct page *page);
 
+typedef struct {
+	unsigned long pgd;
+} pgd_t;
+
+#define pgd_val(x)	((x).pgd)
+#define __pgd(x)	((pgd_t) { (x) })
+
 typedef struct {
 #ifdef CONFIG_ARC_HAS_PAE40
 	unsigned long long pte;
@@ -41,22 +48,17 @@ typedef struct {
 	unsigned long pte;
 #endif
 } pte_t;
-typedef struct {
-	unsigned long pgd;
-} pgd_t;
+
+#define pte_val(x)	((x).pte)
+#define __pte(x)	((pte_t) { (x) })
+
 typedef struct {
 	unsigned long pgprot;
 } pgprot_t;
 
-#define pte_val(x)      ((x).pte)
-#define pgd_val(x)      ((x).pgd)
-#define pgprot_val(x)   ((x).pgprot)
-
-#define __pte(x)        ((pte_t) { (x) })
-#define __pgd(x)        ((pgd_t) { (x) })
-#define __pgprot(x)     ((pgprot_t) { (x) })
-
-#define pte_pgprot(x) __pgprot(pte_val(x))
+#define pgprot_val(x)	((x).pgprot)
+#define __pgprot(x)	((pgprot_t) { (x) })
+#define pte_pgprot(x)	__pgprot(pte_val(x))
 
 typedef pte_t * pgtable_t;
 
@@ -96,8 +98,8 @@ extern int pfn_valid(unsigned long pfn);
  * virt here means link-address/program-address as embedded in object code.
  * And for ARC, link-addr = physical address
  */
-#define __pa(vaddr)  ((unsigned long)(vaddr))
-#define __va(paddr)  ((void *)((unsigned long)(paddr)))
+#define __pa(vaddr)  		((unsigned long)(vaddr))
+#define __va(paddr)  		((void *)((unsigned long)(paddr)))
 
 #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
 #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index 356237b9c537..0cf73431eb89 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -29,6 +29,11 @@
 #ifndef _ASM_ARC_PGALLOC_H
 #define _ASM_ARC_PGALLOC_H
 
+/*
+ * For ARC, pgtable_t is not struct page *, but pte_t * (to avoid
+ * extraneous page_address() calculations) hence can't use
+ * use asm-generic/pgalloc.h which assumes it being struct page *
+ */
 #include <linux/mm.h>
 #include <linux/log2.h>
 
@@ -36,7 +41,7 @@ static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
 {
 	/*
-	 * The cast to long below is OK even when pte is long long (PAE40)
+	 * The cast to long below is OK in 32-bit PAE40 regime with long long pte
 	 * Despite "wider" pte, the pte table needs to be in non-PAE low memory
 	 * as all higher levels can only hold long pointers.
 	 *
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
