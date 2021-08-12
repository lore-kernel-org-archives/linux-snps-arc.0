Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC0EC19F33
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D07610CF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16D07610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeOw7AgZooybnAF9lvGTmN45ZeFQ6uFkzvKTtCxFQxU=; b=ULKmhKI4zctuWt
	YpIohcJ1N56ZzvaGrvG/Hg/P+02zLRVq69440rLMATvdMzlzqh++QaUeLcImkoOzxe2GNc8oKaoqq
	7MWTuvTwHPJIFGMbiR3xsaNnI2YoTQ+1ipQAl57j4inkepJAG7Jw9YnlFfwjYKtKI8yE3DcOuLd4s
	wf/HwrwYx4gx1O9YeJJ3Gqqbk5+1b0xnOSt/aO1RHXJyGXmh4dwSiIONgre9XC2b3gnjUinj9AzYm
	StC800gMB/6YXJzKXWQZRdy9nhs6bNC5DzSa6dU8Pekb6f6regpP5oPYzY6Iqudmb4l/0WX72Hr9j
	xG0dVOW+VDO/i3kS3qIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH4-00BU2w-Ba; Thu, 12 Aug 2021 23:38:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGw-00BTun-R4
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0B6E6108C;
 Thu, 12 Aug 2021 23:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811482;
 bh=ToKfOhhiER8j02fngobXA+3bITHxEeKJM0blznUvlNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qz4+ACaX+VhL6UDoG4GATHnXNG72f1jie44pd2QKRM/Fe242x5Rqwzt62yiHkhABI
 MJ/1t7szUYGw8tdaKtR8D9vCerC3VuDIIJtYTJWFWb0pVK8YkdwVZFN3/cC7PoaxVo
 Y+thDihH1djtm3oHMhYWc8ik+VvG4d58g49pit5v+E6Avw3D1LtRGJriJJ99kRM7+b
 BoH5ZmPGOCl0RZ3RbAOOdfUod3kXbWyaxhtNCcWKf6XLiOhhFwxV84smL9w5OC2FSs
 bVNGScJpcJGUt98HJx8A8QBEXBFWzYUXbsUC2wEVQpuzDpOBj8cOxRKwU32diPvcU/
 WPaoB/kKJ0qTA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 10/19] ARC: mm: non-functional code cleanup ahead of 3
 levels
Date: Thu, 12 Aug 2021 16:37:44 -0700
Message-Id: <20210812233753.104217-11-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163803_003486_BD162DBA 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
 arch/arc/include/asm/page.h | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 514b8b70df50..28ed82b1800f 100644
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
 
 typedef struct page *pgtable_t;
 
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
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
