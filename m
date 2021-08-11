Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A1C04FE3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6543F60EB7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6543F60EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VRxNyXNAuwUghs5AFFY/AIHWZvsWGZ0CdLmF7u4Hnw=; b=AzLbQ68kX4nh3F
	0cqParj36SfcxI7CFZ0A8aWcBMWK+7yYyB4bFziqzvqTVyERCTjQYlNp/9KLCQbMANThtMQgS0RvC
	6cNyO35pNsW1jjlo/nF6R1fw/UD06UJB5WywuQ6lJUCg/UNlXemAlKpwrwqPkXAl+KBRR/60ZGKgg
	m9tTRShXq8344nP5pY33/RRbok3O45JNQyN7BBQjl2P6/pMvsuHxBlTCh7bLRCTb2xQP4JrxYqH/8
	uoinqBWQXWydh49Ym6dpg6Nloq6jwo4rUnQBZzug1zVQTVM/IkjKuE0qSkzHhIQyr90F7kzIC/Dfm
	c+9lkR3gxpQ/xcAsRCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL3-0056fQ-IS; Wed, 11 Aug 2021 00:43:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL0-0056cK-DJ
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D498960EFF;
 Wed, 11 Aug 2021 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642598;
 bh=o68pQKOkoMjqGvslTv9+5NhBcfzvevarzmfnV2WjK38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i9E0moRAtyOyw9Sx7Ur777jymu/dOGX06mLGlJiV9J7UjMcNqnZWnrasSe3jnphZJ
 m+oAeup8cQVGK1bf56LRFIkx8Afv89ZYjAcP+0kpXROVmnN3s7OvB6IHo18pefNK/r
 xqrqgkMNIo/2uXAZMXCbo4FTNMGFWtrVIwuY3cLhAzJFHNFFX4bqFzm6uNgosWyKrL
 v8phW7+OpxKLP1YbUgtaCcUGwQDdZc7EJhMrrDN0UpaM8kwi3aZ9n9iEj68R/2sVMI
 +3zBgBaR0tjm1iv+IVAFceG3SkGbmKRRzSnLN8WcfL6xIs+dWiE0ZyoSB+RmCE4a4o
 d9YpYBgglc12A==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 04/18] ARC: mm: remove pgd_offset_fast
Date: Tue, 10 Aug 2021 17:42:44 -0700
Message-Id: <20210811004258.138075-5-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174318_506304_04A51B43 
X-CRM114-Status: UNSURE (   8.59  )
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
 arch/arc/include/asm/pgtable.h | 23 -----------------------
 arch/arc/mm/fault.c            |  2 +-
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 0c3e220bd2b4..80b57c14b430 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -284,29 +284,6 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 	set_pte(ptep, pteval);
 }
 
-/*
- * Macro to quickly access the PGD entry, utlising the fact that some
- * arch may cache the pointer to Page Directory of "current" task
- * in a MMU register
- *
- * Thus task->mm->pgd (3 pointer dereferences, cache misses etc simply
- * becomes read a register
- *
- * ********CAUTION*******:
- * Kernel code might be dealing with some mm_struct of NON "current"
- * Thus use this macro only when you are certain that "current" is current
- * e.g. when dealing with signal frame setup code etc
- */
-#ifdef ARC_USE_SCRATCH_REG
-#define pgd_offset_fast(mm, addr)	\
-({					\
-	pgd_t *pgd_base = (pgd_t *) read_aux_reg(ARC_REG_SCRATCH_DATA0);  \
-	pgd_base + pgd_index(addr);	\
-})
-#else
-#define pgd_offset_fast(mm, addr)	pgd_offset(mm, addr)
-#endif
-
 extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
 void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 		      pte_t *ptep);
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index f5657cb68e4f..41f154320964 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -33,7 +33,7 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	pud_t *pud, *pud_k;
 	pmd_t *pmd, *pmd_k;
 
-	pgd = pgd_offset_fast(current->active_mm, address);
+	pgd = pgd_offset(current->active_mm, address);
 	pgd_k = pgd_offset_k(address);
 
 	if (!pgd_present(*pgd_k))
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
