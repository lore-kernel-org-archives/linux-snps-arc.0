Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD874C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Dec 2021 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=01/W9/AlXRF3ddrubUkV9E7H+BfmEgwUUd/fus1l2O8=; b=lVs5FUmI26hvH5
	dode5mEgeKlD1BKqv5EAE6Ch40XcIUALnG1fGmSsyR9UhNGNs45c70wf0D+zxJeMjlKYgf/T555Bw
	TuyWKwbedTfIC+K9z6WPWRTliAuRttyCWvmJ1eAh9dGTyMZquxZ6UQNa2IZPMHt7o011ZKzC/oOzZ
	1jIeRDLB6aCBuJX/HXEumb/IZkmxDcO+iGU6VpifA/sURdLFVuTzo6QsFjoz/9tO1CfWtbe345qim
	aCSqftnVJQk1Jgvhyg+h3nMyWgQfbnWPfHvD3x7WKjOFx9/XNMtY8vA+UDHw/qCdVaB58bR+oHPAU
	foQZNL42UKlTZEuta31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxV1m-00144V-Dj; Wed, 15 Dec 2021 14:13:06 +0000
Received: from mail.airspan.com ([188.39.32.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxV1a-0013tG-LP
 for linux-snps-arc@lists.infradead.org; Wed, 15 Dec 2021 14:12:56 +0000
Received: from barbaros-Desktop.airspan.com (10.220.0.17) by FS50.airspan.com
 (10.2.10.50) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 14:12:46 +0000
From: Barbaros Tokaoglu <btokaoglu@airspan.com>
To: <vgupta@kernel.org>, <Vladimir.Isaev@synopsys.com>,
 <linux-snps-arc@lists.infradead.org>
CC: <mkeskinen@airspan.com>
Subject: [PATCH v3] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline operation
Date: Wed, 15 Dec 2021 17:12:33 +0300
Message-ID: <1639577553-26909-1-git-send-email-btokaoglu@airspan.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.220.0.17]
X-ClientProxiedBy: FS50.airspan.com (10.2.10.50) To FS50.airspan.com
 (10.2.10.50)
X-C2ProcessedOrg: 9bdab810-6dbc-44eb-a994-a231bebe8d9f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_061254_751980_EF5C5F83 
X-CRM114-Status: UNSURE (   9.48  )
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

For 16 kB data cache with 4 ways and 32 byte cache lines we have tag LSB
[(128 locations for each way: 7 bits) + byte offset (32 bytes: 5 bits)]
lower than page offset (13 bits for 8 kB pages).
So it is possible for PTAG to change even for single page loop. Hence
update ARC_REG_*C_PTAG register on each cacheline iteration.

Signed-off-by: Barbaros Tokaoglu <btokaoglu@airspan.com>
---
 arch/arc/mm/cache.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 8aa1231..d0875a8 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -251,13 +251,6 @@ void __cache_line_loop_v3(phys_addr_t paddr, unsigned long vaddr,
 	num_lines = DIV_ROUND_UP(sz, L1_CACHE_BYTES);
 
 	/*
-	 * MMUv3, cache ops require paddr in PTAG reg
-	 * if V-P const for loop, PTAG can be written once outside loop
-	 */
-	if (full_page)
-		write_aux_reg(aux_tag, paddr);
-
-	/*
 	 * This is technically for MMU v4, using the MMU v3 programming model
 	 * Special work for HS38 aliasing I-cache configuration with PAE40
 	 *   - upper 8 bits of paddr need to be written into PTAG_HI
@@ -268,10 +261,8 @@ void __cache_line_loop_v3(phys_addr_t paddr, unsigned long vaddr,
 		write_aux_reg(ARC_REG_IC_PTAG_HI, (u64)paddr >> 32);
 
 	while (num_lines-- > 0) {
-		if (!full_page) {
-			write_aux_reg(aux_tag, paddr);
-			paddr += L1_CACHE_BYTES;
-		}
+		write_aux_reg(aux_tag, paddr);
+		paddr += L1_CACHE_BYTES;
 
 		write_aux_reg(aux_cmd, vaddr);
 		vaddr += L1_CACHE_BYTES;
-- 
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
