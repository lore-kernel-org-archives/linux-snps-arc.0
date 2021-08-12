Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCF4C4320E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B057E610CF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B057E610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HTVXQH60NIvrnNqLTbdk76US5xi/PN2FSFST31mlUQ=; b=sj+KKbqLopbSYE
	KgAwOE/xoUrJucc0fksQZXQNyOy6/w616qVHaLqOK9Pf+IFLyv0nEGM/TQ8+GRtO7uUx5SvOTTmfn
	G7POcgY0q0PVi+Mx37fFrEQ9Sk/fgke+9IniPSiHRSj/E2jKUFTMu6/79JIMj1KN2SV32uMTxAZkm
	s8b+zFvhprTOKt4pZv3mNY+5ILdASBzdCJgsDcGE/zE+/ep0X6/IR0joh1p3kqTZ2zmS0yNLiTvlb
	3a8mnS+aInhP4YDGcMwws0FNRkZpIkcaWVMySbHPUytgbxYEEQbUuTZ5aJcUY0vVyE0bqDxtAGnaD
	2YIrVFX14OrbGHq/Y/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH0-00BU0A-V9; Thu, 12 Aug 2021 23:38:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGv-00BTsj-3N
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C30B610CF;
 Thu, 12 Aug 2021 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811479;
 bh=cpK9jdDVnyzUhhaLu6k4Nl4QhGWKsalzqRxrkovXOy4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rHFvkmg3DnqKPsG484pJFu4vngYzfYgCM9Sn03Lcy1JGuAc2LeyuOYEyMZqKwjB9j
 fPDVQ//D+UGAIIg5iL/aY8yqTzUWYXK14bPDweaNhyKYFXs2x/F6X7TK5TovUd5Dtx
 44WSgUgpAiJENUVnnaVri3UPdb2uhceOR/3RO2Vc+wABGbduL1thNSpaACoTH0YvaB
 IvhlBTSgQfzOFoQ5rPMIBPwWIGWcZ14ZVoXFgFhElMIEyD59vuwPEzqCpaCS2CPkV3
 t/CI0MCKfcn/w0OabuJeBrYpPPKLzWZjwEnC5OSe7A08+U9LIr2jbgo1PM39rXgUZA
 wSM2zygyM1bsg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 05/19] ARC: mm: Enable STRICT_MM_TYPECHECKS
Date: Thu, 12 Aug 2021 16:37:39 -0700
Message-Id: <20210812233753.104217-6-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163801_299295_6E619FAB 
X-CRM114-Status: GOOD (  11.92  )
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

In the past I've refrained from doing this (at least 2 times) due to the
slight code bloat due to ABI implications of pte_t etc becoming struct

Per ARC ABI, functions return struct via memory and not through register
r0, even if the struct would fit in register(s)

 - caller allocates space on stack and passes the address as first arg
   (r0), shifting rest of args by one

 - callee creates return struct in memory (referenced via r0)

This time around the code actually shrunk slightly (due to subtle
inlining heuristic effects), but still slightly inefficient due to
return values passed through memory. That however seems like a small
cost compared to maintenance burden given the impending new mmu support
for page walk etc

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/page.h | 26 --------------------------
 arch/arc/mm/ioremap.c       |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 4a9d33372fe2..c4ac827379cd 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -34,12 +34,6 @@ void copy_user_highpage(struct page *to, struct page *from,
 			unsigned long u_vaddr, struct vm_area_struct *vma);
 void clear_user_page(void *to, unsigned long u_vaddr, struct page *page);
 
-#undef STRICT_MM_TYPECHECKS
-
-#ifdef STRICT_MM_TYPECHECKS
-/*
- * These are used to make use of C type-checking..
- */
 typedef struct {
 #ifdef CONFIG_ARC_HAS_PAE40
 	unsigned long long pte;
@@ -64,26 +58,6 @@ typedef struct {
 
 #define pte_pgprot(x) __pgprot(pte_val(x))
 
-#else /* !STRICT_MM_TYPECHECKS */
-
-#ifdef CONFIG_ARC_HAS_PAE40
-typedef unsigned long long pte_t;
-#else
-typedef unsigned long pte_t;
-#endif
-typedef unsigned long pgd_t;
-typedef unsigned long pgprot_t;
-
-#define pte_val(x)	(x)
-#define pgd_val(x)	(x)
-#define pgprot_val(x)	(x)
-#define __pte(x)	(x)
-#define __pgd(x)	(x)
-#define __pgprot(x)	(x)
-#define pte_pgprot(x)	(x)
-
-#endif
-
 typedef pte_t * pgtable_t;
 
 /*
diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
index 95c649fbc95a..052bbd8b1e5f 100644
--- a/arch/arc/mm/ioremap.c
+++ b/arch/arc/mm/ioremap.c
@@ -39,7 +39,7 @@ void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
 	if (arc_uncached_addr_space(paddr))
 		return (void __iomem *)(u32)paddr;
 
-	return ioremap_prot(paddr, size, PAGE_KERNEL_NO_CACHE);
+	return ioremap_prot(paddr, size, pgprot_val(PAGE_KERNEL_NO_CACHE));
 }
 EXPORT_SYMBOL(ioremap);
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
