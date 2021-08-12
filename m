Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31511C43216
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B0C610EA
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4B0C610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gg160uFk8XV5kYipHWSKAXiT0ZCq8lXbdc+VvJLarDU=; b=Ev6cqo6b0p7h/U
	sDm1b7W65KvfED3y4SZkwRp5rr3PZDBPkxHvHjucxTbgM91IQrKPhhWluLCBIdjLsSJ6HFkhUo7mt
	+Q8XTgSaWdppjs8Kga8b4pcB9iGVp7SU9oymItEsigmci8evsRMaXKgW6KAOzy5575A/Jkwzswn2F
	mKptm8PX7HF8Oa5ONxOKgewPWrRcc9vkXh3wHcPatPeUlMDylUdw2wqvXCcFJRJy3DRxjJTWHdebl
	5zUPMq6uxvlenJuS/RR8KQc7OmndqrhFtbgEhWUdNkOdJZyS+sEI9NzA2e93OL3oP3TIflNzpi4zy
	VHHc2P45/xBYe+tQoGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH4-00BU2i-4l; Thu, 12 Aug 2021 23:38:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGw-00BTuE-FC
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CC94610FC;
 Thu, 12 Aug 2021 23:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811480;
 bh=756huhpCIkumJJNbUzXKUy3Y4Jb2tLDhfukRVM8geaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8eBEeTBrCxLXIaLILkA2TGAhtbxiRSFBgwckHnqQ5EgTXPG4fpzE9H2hdqfIAbH+
 8255LaxxXNfBXSFz1+BH+10nGjdGLcuav46otwMidYiKWTxqhlFubzPvw7z73sTX17
 jXfSGZlKphIU4bGxMIuP2SU2D7AIp8qGOFkx+AyPQV8IB+l7FiykgvLYoz6WXzfy8W
 P6BwvqPFlYm/eiOT8KXX7skUHeWR/pkQ4Bf0B9GPgBuiSh33x9zmz2RuQeMjECKgFd
 zx+NM36kRPClDOwJpwC+jdZEk7Fx/LgRKzA1BgGu1NTpSg415ewnkuFQB2aO0QWDgi
 bJs6uCGfEpgpw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 07/19] ARC: mm: pmd_populate* to use the canonical set_pmd
 (and drop pmd_set)
Date: Thu, 12 Aug 2021 16:37:41 -0700
Message-Id: <20210812233753.104217-8-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163802_597340_09EEE1C9 
X-CRM114-Status: UNSURE (   9.34  )
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
 arch/arc/include/asm/pgalloc.h | 14 ++++++++++----
 arch/arc/include/asm/pgtable.h |  6 ------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arc/include/asm/pgalloc.h b/arch/arc/include/asm/pgalloc.h
index a32ca3104ced..408bc4b0842d 100644
--- a/arch/arc/include/asm/pgalloc.h
+++ b/arch/arc/include/asm/pgalloc.h
@@ -35,13 +35,19 @@
 static inline void
 pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
 {
-	pmd_set(pmd, pte);
+	/*
+	 * The cast to long below is OK in 32-bit PAE40 regime with long long pte
+	 * Despite "wider" pte, the pte table needs to be in non-PAE low memory
+	 * as all higher levels can only hold long pointers.
+	 *
+	 * The cast itself is needed given simplistic definition of set_pmd()
+	 */
+	set_pmd(pmd, __pmd((unsigned long)pte));
 }
 
-static inline void
-pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t ptep)
+static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
 {
-	pmd_set(pmd, (pte_t *) ptep);
+	set_pmd(pmd, __pmd((unsigned long)pte));
 }
 
 static inline int __get_order_pgd(void)
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
