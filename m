Return-Path: <SRS0=SN/c=JY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB482C433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Apr 2021 12:14:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020A2613D1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Apr 2021 12:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020A2613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mcsuyggRhQnhINEdJN91QFf55eoJZUOlkdBRjJWKKaE=; b=IUuNOYvpAqpyyHzotAAdl6uImc
	VYVya4tDt/qHOXbH1Fs9TUbTdPDtj+uhi9yCX5pwhlsbrlfbKeAjGr6dT1/82oXq2P/g/RVIAHSpT
	5ueE8rC1uFndKmMA7Y8qaLTH8GpnCVDTn8VxpGY1bORaQG4+JMjubEkwPMxauDz1zEdQPBn4YvIRy
	dCOO5ASnHVC8HGh+ou1IEBWck+HuKVXERTRtMcjwLM2xYuEbrNJ3ZYBAKOvgFR9l4D8i9p9gnYKdS
	Yuhw5E3BcTOrFGHoQqj43caRQD7FiHuk8VHHO3oyABVTwRkwOrnSD4BfQTf+UblonTwyVR/9codFI
	GIWJ75/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbMbd-001bXb-BJ; Tue, 27 Apr 2021 12:14:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbMbZ-001bXB-Lo
 for linux-snps-arc@desiato.infradead.org; Tue, 27 Apr 2021 12:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PBm+dsM4nGsIxrcaMfK4qOnmhy3jhi20DH/GggPlbAs=; b=EvNEaUeM2u8nwAA1djzTKTG11d
 twcIJ+lYZRoWoVydbf2k2l58D+nr3IFybfqqI0bWnh6CF+5lM5yesvCNKSdS1IVOZwN5R0ZjLADd3
 J9GaYWSvmvfQ+5OPUCzf+ehqJg2yivS5RHCwN0rBdM5Dh4tqvJj5ax9RkrT5rbsDstDpa1avyZtt0
 UxDNiQP5kDf2OD8kdc9Hx8hJat0tStpjm/9+2RzsUKNx2gulFF2QRw82lPsz98qxWgTA2yIkVxgm5
 KLhbklEtnF9qEDdBvHmq8qrVJSO1L0/1/BO2vV/QustTZzeI7ErX4KUKrYIeRzDO5TjRZL1GiLdZ8
 MPc23msw==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbMbW-00Gihg-Oi
 for linux-snps-arc@lists.infradead.org; Tue, 27 Apr 2021 12:14:16 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BDFAEC0552;
 Tue, 27 Apr 2021 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619525653; bh=KRq0A/+QMHj5BLNmcw2miTkzyZiUHS4WDq7zHqV5LRg=;
 h=From:To:Cc:Subject:Date:From;
 b=DEgE3TErxy9aZN26Qcm5kU1BgX5NR3HwR+1aS4xNW9Uosf5lcpyVAFKbfRYJ9CnjY
 Vr2nwDhfnpnC51OzFJSDg6xTr8eAaQiNLqRgeMp8hpT51y/YX46GDT79LCokdPhokd
 VneN74QM5RrQdkRXk6pZdBMZsDbiNm7TYUsCslwSbGChjE5T0FIzPTVvA0Qz67MKmB
 8ktP2a9wD+CkrB/LoUHrHvSS1XQqcS6HRk6KriAtHgLI12jUyJnLt3yfoxjoEkiE9w
 HnEe/FouDKZGFaG9EXVVaUENU9hhv9wezeoOm0PUei2VHs/BLqhsI2FOJeQcxVHg0p
 ABZcpiljJkX4A==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5B1C6A005C;
 Tue, 27 Apr 2021 12:14:07 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2] ARC: Use max_high_pfn as a HIGHMEM zone border
Date: Tue, 27 Apr 2021 15:13:54 +0300
Message-Id: <20210427121354.3620-1-isaev@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_051414_843871_734E034A 
X-CRM114-Status: GOOD (  13.00  )
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

Commit 4af22ded0ecf ("arc: fix memory initialization for systems
with two memory banks") fixed highmem, but for the PAE case it causes
bug messages:

BUG: Bad page state in process swapper  pfn:80000
page:(ptrval) refcount:0 mapcount:1 mapping:00000000 index:0x0 pfn:0x80000
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000000 00000000 00000000 00000000
raw: 00000000
page dumped because: nonzero mapcount
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc5-00003-g1e43c377a79f #1

Stack Trace:
  arc_unwind_core+0xe8/0x118
Disabling lock debugging due to kernel taint

This is because the fix expects highmem to be always less than
lowmem and uses min_low_pfn as an upper zone border for highmem.

max_high_pfn should be ok for both highmem and highmem+PAE cases.

Signed-off-by: Vladimir Isaev <isaev@synopsys.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
Changes for v2:
 - Revised commit message and added comment to code
---
 arch/arc/mm/init.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index ce07e697916c..1bcc6985b9a0 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -157,7 +157,16 @@ void __init setup_arch_memory(void)
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
+	/*
+	 * max_high_pfn should be ok here for both HIGHMEM and HIGHMEM+PAE.
+	 * For HIGHMEM without PAE max_high_pfn should be less than
+	 * min_low_pfn to guarantee that these two regions don't overlap.
+	 * For PAE case highmem is greater than lowmem, so it is natural
+	 * to use max_high_pfn.
+	 *
+	 * In both cases, holes should be handled by pfn_valid().
+	 */
+	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
 
 	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
 
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
