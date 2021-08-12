Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27A7C19F35
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974246112D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 974246112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKe2mBzUnyOm1LuGoLfPYke4Y56LmdI8G2NHa+GwcP8=; b=NEGk3ol/omFQKI
	dKYIk1LOpoBVwKtkQn/TChZk6HjfRSID+lYuhnd391at+g1Z5sHcD5hxlQ09MX13Yt1uY8W7nJsS5
	waw/tNDSaQpDLNk32soVoRpbwN6vAqgXUZf9iWcMGd6ZQ+x4WPkCwLABEUsGp3vBw0UeeIAr6xjcI
	/pF7HExIemE4nZDT+4AU8zz9m6C70eIp9PQMn2tsaNTMXI1540es2XnleNxXObnHRDnSm7/b1Tvnw
	LBamnj9+1h3odntyH4BXLYkUsDHUr44LDy5l33aYAX6dyHj7tox4AcfGHt4SrZISNq9u+MgEII69y
	SBzdIX6BQdQcaPI2lZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKGy-00BTxc-TR; Thu, 12 Aug 2021 23:38:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGv-00BTsi-3Z
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF3F8610A5;
 Thu, 12 Aug 2021 23:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811479;
 bh=SDwFDPOQmz/pmHMM+4prMbb/FBKaF/3A8kiP4jUiFjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=roa0nbg6P0b49j69EM6FvuJQOVTYh9WC3m/MSLBaWFNjUV+xkyM3Sep4d0y4LtEHo
 f5CaYtQWvkn4tZ3DHgCgkHKPXNkc+32AAjUCGiV39QnXL3t5bdYB/5wGizl+5rc2Cn
 9DaypbSSEqCr1e3eBWDofGqHqUwVLMVjgPNujXwg/B0jYRDyrnN8c1o9foaRw7+0hm
 iZ3uHbCyeDgFh1QMjdXKP5Go5wH/hXnkju2P+6OelxdXM3z/eOh5Zm/sf+xKs7eEv5
 +qBR8Iaju8svs91k0gm4lKV3K7Cls/dHPTqk+BHqo9h0NODF2NAm7K9k486yY4Ka9H
 /djBZrU5z5bnA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 04/19] ARC: mm: Fixes to allow STRICT_MM_TYPECHECKS
Date: Thu, 12 Aug 2021 16:37:38 -0700
Message-Id: <20210812233753.104217-5-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163801_283989_D95AF793 
X-CRM114-Status: GOOD (  10.08  )
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
