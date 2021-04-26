Return-Path: <SRS0=GR/N=JX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ECCC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 10:08:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D754F61165
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D754F61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sYxsphYVyKGjmRQrVlbBn0Uoi2jz0G1bWhO3ljc6vKE=; b=I5EqSqs0ZiFn+j1MNjPr6Mr4a7
	3wqOJ36S7jw92Wp2I88u+OuqsPZsG7fJNnMI8gH18yGVnexudmbCPmQIVSezMR37ap+14Ugtr5EU3
	b3uLI2YYzL+poLu1v7aMqCJm+9nyeV/ly5mEMp5oipIkUupLMeTa3hkm9jRFqHIolXzrD9t1gGbVd
	rYJDOPaiuTdYuETSuYZMNcRifM+ZQ3AlksoBkg0LZww1UKmf9tdNKgaw+xi+nAvwnRS2tIX+1MAxG
	EKESfOSjIa9iR1/GB4br7ji2nKijMX0YcRBDQR+iQlOzAMLvsJGy2FQfcgYt1FJvNQrvcXk6MGc9k
	GY5J86zQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1layAE-007NX6-2A; Mon, 26 Apr 2021 10:08:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1layAB-007NWw-W7
 for linux-snps-arc@desiato.infradead.org; Mon, 26 Apr 2021 10:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=++bgDjDc6Bmb70djL7kMf+O9Sqfl5JrYUiTwAWh52Ow=; b=FCI/Z81zbmw4CUvasj0iEkJSv3
 BuV9kTa/98nJ6170jT21nHWpx2i7taqxBk2+JY0NdC6mqizUzpykYV2JGyFb0mbSNSxEJB3yTpd6M
 X3gdVmQ9yFJ5mlemcbEJ3U0HVO22paWQqHFstFwKKGjDFaOEWDMdqR3GZaZf7qeDmTuCElUmPtzbJ
 1M30Kjlk2deg0bURu41z40s1fg9w+kQDReY2R9fnS/8yA8i72maCBdZkvh+CZpVJYlBQkPXqWaGgT
 uv8i8KCzskqsCYLzZM3rtEkBUVOiTNfoUQWMKTk5uqAiOosPnPt8WFcMVjDTmq075LKGSIpdamTW/
 kfW7s1pw==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1layA9-00FswZ-0w
 for linux-snps-arc@lists.infradead.org; Mon, 26 Apr 2021 10:08:22 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 422D6C043E;
 Mon, 26 Apr 2021 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619431697; bh=qDN/qUPHbR2jazBXaOLiYF2dvCU/A8yXaTIGWr7NH4g=;
 h=From:To:Cc:Subject:Date:From;
 b=MTdbJ2BbetKq35kjaEx/aeHXyjkrbVvj/WMOCssrSANrusf0p8qnM/ECEihZ80ZeH
 NXu/92ik15OBSQ2GAT5qXJ20gL+wiv2wBxh6QlnqetnUYZB8ShaGt36BY+7bO+nVsK
 C6X9GNgYfjcyyVcPYNirGy0Bms4E49gJ/p0hIJuTL2Cy0V3+Le3WWewR2mNkxoCVoO
 9cLpJx3csyd90mWYcJFksHFwb++Q2RdNtPsVeAoWDjX/VuQLYQPWS5j8jZLJtvCkOW
 sRSf6hXCt/Y2LI4dVdSVv7mTh9SQYGZ2IaFAQl/8IQ9DuXuML4QKneuWApaWpmUAg7
 vg8banKUhA2ig==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id AAA13A005E;
 Mon, 26 Apr 2021 10:08:12 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: [PATCH] ARC: Use 40-bit physical page mask for PAE
Date: Mon, 26 Apr 2021 13:08:01 +0300
Message-Id: <20210426100801.41308-1-isaev@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_030821_133798_E055279A 
X-CRM114-Status: GOOD (  12.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

32-bit PAGE_MASK can not be used as a mask for physical addresses
when PAE is enabled. PHYSICAL_PAGE_MASK must be used for physical
addresses instead of PAGE_MASK.

Signed-off-by: Vladimir Isaev <isaev@synopsys.com>
---
 arch/arc/include/asm/pgtable.h   | 12 +++---------
 arch/arc/include/uapi/asm/page.h |  7 +++++++
 arch/arc/mm/ioremap.c            |  4 ++--
 arch/arc/mm/tlb.c                |  2 +-
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 163641726a2b..25c95fbc7021 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -107,8 +107,8 @@
 #define ___DEF (_PAGE_PRESENT | _PAGE_CACHEABLE)
 
 /* Set of bits not changed in pte_modify */
-#define _PAGE_CHG_MASK	(PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SPECIAL)
-
+#define _PAGE_CHG_MASK	(PHYSICAL_PAGE_MASK | _PAGE_ACCESSED | _PAGE_DIRTY | \
+							       _PAGE_SPECIAL)
 /* More Abbrevaited helpers */
 #define PAGE_U_NONE     __pgprot(___DEF)
 #define PAGE_U_R        __pgprot(___DEF | _PAGE_READ)
@@ -132,13 +132,7 @@
 #define PTE_BITS_IN_PD0		(_PAGE_GLOBAL | _PAGE_PRESENT | _PAGE_HW_SZ)
 #define PTE_BITS_RWX		(_PAGE_EXECUTE | _PAGE_WRITE | _PAGE_READ)
 
-#ifdef CONFIG_ARC_HAS_PAE40
-#define PTE_BITS_NON_RWX_IN_PD1	(0xff00000000 | PAGE_MASK | _PAGE_CACHEABLE)
-#define MAX_POSSIBLE_PHYSMEM_BITS 40
-#else
-#define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK | _PAGE_CACHEABLE)
-#define MAX_POSSIBLE_PHYSMEM_BITS 32
-#endif
+#define PTE_BITS_NON_RWX_IN_PD1	(PHYSICAL_PAGE_MASK | _PAGE_CACHEABLE)
 
 /**************************************************************************
  * Mapping of vm_flags (Generic VM) to PTE flags (arch specific)
diff --git a/arch/arc/include/uapi/asm/page.h b/arch/arc/include/uapi/asm/page.h
index 2a97e2718a21..8fecf2a2b592 100644
--- a/arch/arc/include/uapi/asm/page.h
+++ b/arch/arc/include/uapi/asm/page.h
@@ -33,5 +33,12 @@
 
 #define PAGE_MASK	(~(PAGE_SIZE-1))
 
+#ifdef CONFIG_ARC_HAS_PAE40
+#define MAX_POSSIBLE_PHYSMEM_BITS 40
+#define PHYSICAL_PAGE_MASK	(0xff00000000ull | PAGE_MASK)
+#else
+#define MAX_POSSIBLE_PHYSMEM_BITS 32
+#define PHYSICAL_PAGE_MASK	PAGE_MASK
+#endif
 
 #endif /* _UAPI__ASM_ARC_PAGE_H */
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index fac4adc90204..eb109d57d544 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -71,8 +71,8 @@ void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
 	prot = pgprot_noncached(prot);
 
 	/* Mappings have to be page-aligned */
-	off = paddr & ~PAGE_MASK;
-	paddr &= PAGE_MASK;
+	off = paddr & ~PHYSICAL_PAGE_MASK;
+	paddr &= PHYSICAL_PAGE_MASK;
 	size = PAGE_ALIGN(end + 1) - paddr;
 
 	/*
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 9bb3c24f3677..15a3b92e9e72 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -576,7 +576,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
 		      pte_t *ptep)
 {
 	unsigned long vaddr = vaddr_unaligned & PAGE_MASK;
-	phys_addr_t paddr = pte_val(*ptep) & PAGE_MASK;
+	phys_addr_t paddr = pte_val(*ptep) & PHYSICAL_PAGE_MASK;
 	struct page *page = pfn_to_page(pte_pfn(*ptep));
 
 	create_tlb(vma, vaddr, ptep);
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
