Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F042EC4320A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB916056C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AB916056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jcd/YQGNskFS1nxO1ccm1VaoDWpqKBLKbULcdev4RGM=; b=LY6Tq2f1aH8KJO
	iO2RiQKhYQR7mhhyOBwKoBzk0phYcCP+e01kJkblA8G1AXthy5eUC7NC3JDjrsVraQvbQIJlqcwPa
	E6zYH3HtpToof8ZTWvnLpXzYdBqFknk6fcdjseTHV/GdkC4mT3nhK5GoOpWAT1I9x92MJ+2SuK4BS
	WGSxMcB2h4NlyclYyKaNtFFRHz2Qh+6n/xP0rUucR4S/7kL8kb6RP1TqCQYZPAkeed098+UEwwTu8
	qlI15jbr47qeRlizrpkRN7c7I2X0rNHD4ZnPfq0yo0QO0sQVhcAd83kIbPFTJJ1i4yepUofNiiHbH
	/y0mb9orslPp2IiyxGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcLB-0056oN-0h; Wed, 11 Aug 2021 00:43:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL6-0056ey-49
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 989E960EB7;
 Wed, 11 Aug 2021 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642603;
 bh=7WJKlO9bHU1KTACHVSZNKYdiOMEX5YhZuZxQV/SdLuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HRnf5A4x4/jZiHyG9ZaRzXwbGnLGx/X7Meb25l6g61b2CB/dhxZTicTnsdeBUwEq8
 uPR3P/20cfHxaAzD6B2oM/PG1YvlEyleAelnhCPOKRpYyeZV9eD6HaQLNoqoMYJ5+i
 2rIEeTEM6HtnRIZPN+OyVa2JIZyVIuu5RMfoHoB93BHSDxUcrtSR/Cooe+bKYGge6S
 pIkAR2zJuxnAB8pdDLRsZ9gNp3OBD1xCxOF+VfdJYwLfEyiceL5vlqx2BCXqvIO0fg
 A8qiQb2OlNVgyyjuEAHcQu5PA47i5amo6imVqNQdIHNK+WD4wY38YMUbQnEoKKcI/T
 8ijDY055CsVjw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 17/18] ARC: mm: vmalloc sync from kernel to user table to
 update PMD ...
Date: Tue, 10 Aug 2021 17:42:57 -0700
Message-Id: <20210811004258.138075-18-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174324_218473_D2D214CB 
X-CRM114-Status: GOOD (  11.31  )
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

... not PGD

vmalloc() sets up the kernel page table (starting from @swapper_pg_dir).
But when vmalloc area is accessed in context of a user task, say opening
terminal in n_tty_open(), the user page tables need to be synced from
kernel page tables so that TLB entry is created in "user context".

The old code was doing this incorrectly, as it was updating the user pgd
entry (first level itself) to point to kernel pud table (2nd level),
effectively yanking away the entire user space translation with kernel one.

The correct way to do this is to ONLY update a user space pgd/pud/pmd entry
if it is not popluated already. This ensures that only the missing leaf
pmd entry gets updated to point to relevant kernel pte table.

From code change pov, we are chaging the pattern:

	p4d = p4d_offset(pgd, address);
	p4d_k = p4d_offset(pgd_k, address);
	if (!p4d_present(*p4d_k))
		goto bad_area;
	set_p4d(p4d, *p4d_k);

with
	p4d = p4d_offset(pgd, address);
	p4d_k = p4d_offset(pgd_k, address);
	if (p4d_none(*p4d_k))
		goto bad_area;
	if (!p4d_present(*p4d))
		set_p4d(p4d, *p4d_k);

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/mm/fault.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index f8994164fa36..5787c261c9a4 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -36,31 +36,31 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
 	pgd = pgd_offset(current->active_mm, address);
 	pgd_k = pgd_offset_k(address);
 
-	if (!pgd_present(*pgd_k))
+	if (pgd_none (*pgd_k))
 		goto bad_area;
-
-	set_pgd(pgd, *pgd_k);
+	if (!pgd_present(*pgd))
+		set_pgd(pgd, *pgd_k);
 
 	p4d = p4d_offset(pgd, address);
 	p4d_k = p4d_offset(pgd_k, address);
-	if (!p4d_present(*p4d_k))
+	if (p4d_none(*p4d_k))
 		goto bad_area;
-
-	set_p4d(p4d, *p4d_k);
+	if (!p4d_present(*p4d))
+		set_p4d(p4d, *p4d_k);
 
 	pud = pud_offset(p4d, address);
 	pud_k = pud_offset(p4d_k, address);
-	if (!pud_present(*pud_k))
+	if (pud_none(*pud_k))
 		goto bad_area;
-
-	set_pud(pud, *pud_k);
+	if (!pud_present(*pud))
+		set_pud(pud, *pud_k);
 
 	pmd = pmd_offset(pud, address);
 	pmd_k = pmd_offset(pud_k, address);
-	if (!pmd_present(*pmd_k))
+	if (pmd_none(*pmd_k))
 		goto bad_area;
-
-	set_pmd(pmd, *pmd_k);
+	if (!pmd_present(*pmd))
+		set_pmd(pmd, *pmd_k);
 
 	/* XXX: create the TLB entry here */
 	return 0;
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
