Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991EDC432BE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56372610A5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56372610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/6JZteuETQbXntRJYIQCt1uCl2NwfD0CXxS3t2enVI=; b=nHKuH5nCbMKl+p
	GeJZktKn9MQT1xMYHFgblPQtg12bELqWDHPkStYGTYGPL9vp/8i5XhRfwVd60O8Gx55w6u2OoUAU6
	8iojv4BgSDUzJJ52o1WfDWqv+6UarXimiFXMSpVNAz4E2byM32m95edPofjbA7o8/8rcn3fDS/5xr
	olmAvGf/t48h1Mcsiadi757p4xBCHeSZ0h4UP9ICUac5iFScsHsuF32dTOfNx6ATuIxAt25ps7XSW
	3XPaeB2x+DGXJztaGMdTikR3XTWTaFPA4UN2ilpDlpyHEp/R6kvWQ8JO+drDFbgacz4c2+hNKWFxt
	d7LrwHv23M+2pRhmPjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH3-00BU2I-MD; Thu, 12 Aug 2021 23:38:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGw-00BTum-Rf
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 311AD6113E;
 Thu, 12 Aug 2021 23:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811481;
 bh=P/zEitpJGWXqQnjfHf92tqfSZBtCS0Di5vxOaU/9MD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SoMM9n1Tr9XrlR6f4RTBC9zHGaQ7Tv1e0NIHSbudb/XWoxRn7yJH/EpDjhLAoPG1U
 k2VsEjQP02DPXvFXHVj0R/S5Y2782k0scB4WxtX6mUIyBLJ7DJBN+h7ftKfmMPBqL/
 +DwhvMMSy8nq0eWpPPrIbZSFCcFjBC7vIKQLYgC3XG9amedpT0Z2lEUgg4tURebKiG
 YLkUqikSOR7OvDrVu4UmlG/b0J5Fj+t4XXjgRaiRZjacqnGyXqsrLy0Xfxr5Ihhlte
 5Eng0QYUmJZbsFRfwkwDPu7hBvayhRq+wFiEagK/TeSRFOxgwNdiBAFPKisC4F4rIU
 +uvGLl4pZGrxQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 09/19] ARC: mm: switch to asm-generic/pgalloc.h
Date: Thu, 12 Aug 2021 16:37:43 -0700
Message-Id: <20210812233753.104217-10-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163803_002361_F451C058 
X-CRM114-Status: UNSURE (   8.99  )
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

With previous patch ARC pgalloc functions are same as generic, hence
switch to that.

Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/pgalloc.h | 42 +---------------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index 8ab1af3da6e7..0cde9e5eefd7 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -31,6 +31,7 @@
 
 #include <linux/mm.h>
 #include <linux/log2.h>
+#include <asm-generic/pgalloc.h>
 
 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
@@ -69,47 +70,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	return ret;
 }
 
-static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
-{
-	free_page((unsigned long)pgd);
-}
-
-static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	pte_t *pte;
-
-	pte = (pte_t *) __get_free_page(GFP_KERNEL | __GFP_ZERO);
-
-	return pte;
-}
-
-static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
-{
-	struct page *page;
-
-	page = (pgtable_t)alloc_page(GFP_KERNEL | __GFP_ZERO | __GFP_ACCOUNT);
-	if (!page)
-		return NULL;
-
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
-		return NULL;
-	}
-
-	return page;
-}
-
-static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
-{
-	free_page((unsigned long)pte);
-}
-
-static inline void pte_free(struct mm_struct *mm, pgtable_t pte_page)
-{
-	pgtable_pte_page_dtor(pte_page);
-	__free_page(pte_page);
-}
-
 #define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, pte)
 
 #endif /* _ASM_ARC_PGALLOC_H */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
