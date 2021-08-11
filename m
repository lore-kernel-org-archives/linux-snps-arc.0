Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC05C19F36
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339946101D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 339946101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKe2mBzUnyOm1LuGoLfPYke4Y56LmdI8G2NHa+GwcP8=; b=eD/bBZ37f0y/HG
	vAjySuZuMMPHYvjI9NpFV2UtYmcZtcgvM0q1U4/aWb/udGvqL5bksejP1AGeAW4YNKDztifSsmOH0
	YBq6VpnNtbtR2MedEW3x6BwFuZ2PN3d/o7CUwG2CFnaGIYQwrY7mDUhTIhHgyuUxsfpBkgpLciC9N
	mK+4BxVy2gXfpnglv/0Li5MUhCAm0Uagq93zTbb1NzUErzUXKmUQ/+8v44Nh7osTv7XZy4PQsJu8h
	Yn9uhURZ2Q4xeTvdsWhMnp43Gxclpe353AYIc4/JjQP+PFGZb+KdBNZW+itUqXxZNAYJ8JZdqw6gg
	HqE08QTL+6GMlJRdQOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL4-0056gP-A2; Wed, 11 Aug 2021 00:43:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL0-0056cv-V9
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C1C06101D;
 Wed, 11 Aug 2021 00:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642598;
 bh=SDwFDPOQmz/pmHMM+4prMbb/FBKaF/3A8kiP4jUiFjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZkJz7h7+oRGr3Xu1DUppMJk0wp3gXJP97aJv06qXq1C4tMizWAXPfFe5GyVCcMKmT
 +vPP/Ls42lfy8cgY4VR+nEGmA3S59MGj1hVyPixzMORUsnw2WxfPJqoCRGZuTx0mdD
 RdowomDxp3/FtdZbae2lZGnJAvVQb3RJrx1SPcmtMcvRC8+cMDbj6UVbitRzs6Ti9w
 x4iWLmXJXWjEHmuPA59CjG8jRhMnzUCdq/fdTSXgaZLh4dDN5MmG4PsFU4Zb58WdRF
 9LkrTwbllbHu4pkenQgBHaTko3uU7oTXGT4YJqugupg64C+RCKItUwjwomN0F5mOG3
 bd2XlgnvbUzaQ==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 05/18] ARC: mm: Fixes to allow STRICT_MM_TYPECHECKS
Date: Tue, 10 Aug 2021 17:42:45 -0700
Message-Id: <20210811004258.138075-6-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174319_087670_547F399F 
X-CRM114-Status: UNSURE (   9.56  )
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
 arch/arc/mm/tlb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 6079dfd129b9..15cbc285b0de 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -71,7 +71,7 @@ static void tlb_entry_erase(unsigned int vaddr_n_asid)
 	}
 }
 
-static void tlb_entry_insert(unsigned int pd0, pte_t pd1)
+static void tlb_entry_insert(unsigned int pd0, phys_addr_t pd1)
 {
 	unsigned int idx;
 
@@ -109,13 +109,16 @@ static void tlb_entry_erase(unsigned int vaddr_n_asid)
 	write_aux_reg(ARC_REG_TLBCOMMAND, TLBDeleteEntry);
 }
 
-static void tlb_entry_insert(unsigned int pd0, pte_t pd1)
+static void tlb_entry_insert(unsigned int pd0, phys_addr_t pd1)
 {
 	write_aux_reg(ARC_REG_TLBPD0, pd0);
-	write_aux_reg(ARC_REG_TLBPD1, pd1);
 
-	if (is_pae40_enabled())
+	if (!is_pae40_enabled()) {
+		write_aux_reg(ARC_REG_TLBPD1, pd1);
+	} else {
+		write_aux_reg(ARC_REG_TLBPD1, pd1 & 0xFFFFFFFF);
 		write_aux_reg(ARC_REG_TLBPD1HI, (u64)pd1 >> 32);
+	}
 
 	write_aux_reg(ARC_REG_TLBCOMMAND, TLBInsertEntry);
 }
@@ -391,7 +394,7 @@ void create_tlb(struct vm_area_struct *vma, unsigned long vaddr, pte_t *ptep)
 	unsigned long flags;
 	unsigned int asid_or_sasid, rwx;
 	unsigned long pd0;
-	pte_t pd1;
+	phys_addr_t pd1;
 
 	/*
 	 * create_tlb() assumes that current->mm == vma->mm, since
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
