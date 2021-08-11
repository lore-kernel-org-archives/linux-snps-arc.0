Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90A4C19F39
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DAF26056C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DAF26056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Le98sFiFySrF97g09NGfZLuSd8c1lU0+HM6zxACMrM=; b=dfnJ0mTq6B/0pX
	kl9nfVLgbGJgxHhfchUT4mcXZzqJqrOGbAT2Tv+3/Kd6llDW67ii7Ci6YY90lvxpTCQAxhuKHPjuR
	uc2Ao6wke1aBO1fbWgiCcxtdmFxp5hXzgcTM4Wv0UrnJ3DMQs6FAqe6iXUzoS0AIdhH592feRTvUn
	XCP+GZw/z+k4vZiLEERe2uu/ky/RRIMbgIh5KMaSIyg4z/q3nEnjuyqT3keX0IUprxGiKpRZ73/5B
	QuE397O1iTDUueYG++rsBNfNQ6eqaCy4DBOy4I132OCJptigtH9Ld1+xilzs7Te3agq0zof61i4Xn
	aMQ00l+7jV4YVYX98Fjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL6-0056jd-NV; Wed, 11 Aug 2021 00:43:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL2-0056dw-C3
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A159360ED8;
 Wed, 11 Aug 2021 00:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642599;
 bh=d/hfOn3w687jN4zkC+l2dcxEmGUAtvEy2OYtzBkQRqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pIcHx0LwNdige9Yz4F7qvxqxWWqcdfoJ8KIVPY7/B1MadrCEssQKjIARhkuSMovjY
 CLivgL8YXgM/F0w6snoahKVCye50IBx3DHZP/jp1eIcXND/dlIopDzGucOi5LpivVa
 psqbaFcT4/X7E8I3zztdp+CLPCtYIB61CXEeiS49QpQh28ca7ptv/uH8nHdrOMPrJ6
 FnBEuAp044ryOyJdP2ICTeLef9KIs4cDzlsTRXJppqroAduldkTk1ndltlPKddFPqZ
 NMPBEaRZh4mCp5XTnj8pVHpJ1aIf64umV22sGxs9g5vAlipiGgnov0p2eCrgTh1PXm
 xZ8rMYITTfEiA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 08/18] ARC: mm: pmd_populate* to use the canonical set_pmd
 (and drop pmd_set)
Date: Tue, 10 Aug 2021 17:42:48 -0700
Message-Id: <20210811004258.138075-9-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174320_470319_23306D31 
X-CRM114-Status: UNSURE (   9.91  )
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
 arch/arc/include/asm/pgalloc.h | 21 ++++++++++++++-------
 arch/arc/include/asm/pgtable.h |  6 ------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index a32ca3104ced..356237b9c537 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -33,16 +33,23 @@
 #include <linux/log2.h>
 
 static inline void
-pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
+pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp, pte_t *ptep)
 {
-	pmd_set(pmd, pte);
+	/*
+	 * The cast to long below is OK even when pte is long long (PAE40)
+	 * Despite "wider" pte, the pte table needs to be in non-PAE low memory
+	 * as all higher levels can only hold long pointers.
+	 *
+	 * The cast itself is needed given simplistic definition of set_pmd()
+	 */
+	set_pmd(pmdp, __pmd((unsigned long)ptep));
 }
 
-static inline void
-pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t ptep)
-{
-	pmd_set(pmd, (pte_t *) ptep);
-}
+/*
+ * pmd_populate can be implemented in terms of pmd_populate_kernel since
+ * pgtable_t is pte * on ARC
+ */
+#define pmd_populate(mm, pmdp, ptep)	pmd_populate_kernel(mm, pmdp, ptep)
 
 static inline int __get_order_pgd(void)
 {
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index b054c14f8bf6..f762bacb2358 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -222,12 +222,6 @@ extern char empty_zero_page[PAGE_SIZE];
 /* find the logical addr (phy for ARC) of the Page Tbl ref by PMD entry */
 #define pmd_page_vaddr(pmd)	(pmd_val(pmd) & PAGE_MASK)
 
-/* In a 2 level sys, setup the PGD entry with PTE value */
-static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
-{
-	pmd_val(*pmdp) = (unsigned long)ptep;
-}
-
 #define pte_none(x)			(!pte_val(x))
 #define pte_present(x)			(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(mm, addr, ptep)	set_pte_at(mm, addr, ptep, __pte(0))
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
