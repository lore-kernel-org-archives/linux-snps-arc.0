Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5107BC19F3A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF74A610CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF74A610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jcd/YQGNskFS1nxO1ccm1VaoDWpqKBLKbULcdev4RGM=; b=gRdnoztxVSFWY2
	h+xaCtgnwHbwr8fg+fT42OsrUaRWf/rC/D7g8h+rb41guv4PTOMwkBleJgUKBdfYlJYssaeqd2RNo
	USOr7wn58xnhTYevQR3kFZFfq1O6IQ5a/mmIkN3RI2nMHcxWLKEYAZBW9+rkiOXOiWgbdRSmnGFW8
	awKluyWzD1wL7nCVF8jVG0oiCIqcnAOciGmpQ3Fb7e5YRkML0oO0h2T1ljTj3wZaXF3bpwI3H1wv0
	2wpkXQOhxVeQ1dYyRICLZoWCdqamDiCJYqh3bzIQkl+IIIZIOx4MwHqBLLTD6B9QCwB6XOP7DoYOO
	zuLFevh7CVmTu/4YRKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH8-00BU7g-6U; Thu, 12 Aug 2021 23:38:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKH0-00BTym-A8
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4087A61131;
 Thu, 12 Aug 2021 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811485;
 bh=7WJKlO9bHU1KTACHVSZNKYdiOMEX5YhZuZxQV/SdLuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dt1uufFxiBpM64WdTSAuTk8+1zrKO6HU17TYlEUlNN2kujLxQYptBPWGS+0DQsO8c
 qLICm2qZyETLEzLvScOtCQYp5JedDoefi3B5ziqpYXQusDyQeCNzXRPINiFGzyB0ik
 AIsE96Dk0G2t12AyO1Ka1LfR5NFh9OOSpW0+yL/l0+qDRko4spy5cH0V3OuvtRJ3Fg
 nIKGR1NJko/owd0DL01zdM6HsvN6k862UPaFztDZw0p5ZGHiObtNREUaZCUqexrveP
 m580WAdbM/F0mF37GPiVk2k5f33D1sPQrkwPSbiJSQCipodfYOi5O5jCZ9SrkyCP0n
 GSOvLOSh6E24w==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 18/19] ARC: mm: vmalloc sync from kernel to user table to
 update PMD ...
Date: Thu, 12 Aug 2021 16:37:52 -0700
Message-Id: <20210812233753.104217-19-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163806_558788_BD2BF740 
X-CRM114-Status: GOOD (  11.84  )
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
