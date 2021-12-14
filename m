Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC454C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Dec 2021 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ch3G0ABM+NIjRYYtUGZpn/hVrdCrKv+/wxy2cpp5Aa4=; b=V5P+TkeOJ5KBNL
	F+4SWaQfJAUOvp7c96Ppg0iXC0P0W3pq14381O8hyKcRtymW85KQEJ+2TmtfM2sefnYoU6nS+/vM3
	EA6ppbWG9RJmEUJce42MsQK3Z6cnHdvUVnY40qxF9Y+uHfONxuP7rfGt0svH9ZQrxM0XzUMQMXJI3
	mXno8nlMWR4Um1HATbrf6wXPsFC0qfQP5tl5SO7rcB61Nu5gTWvYwQpzATU7DETu5ZJqnsQ2W9w8R
	dK6rFU28rx3S9m5GBI8o81vlQJmyt61YLcGh5qMwvtlzpRronQBs4pbQ4zeg10JAD0pzRPHosTs/Z
	EuCTI60rpbBgFiYzvStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6uS-00DvXE-Ut; Tue, 14 Dec 2021 12:27:56 +0000
Received: from 188-39-32-17.static.enta.net ([188.39.32.17]
 helo=mail.airspan.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6l9-00DsuD-BT
 for linux-snps-arc@lists.infradead.org; Tue, 14 Dec 2021 12:18:21 +0000
Received: from FS50.airspan.com (10.2.10.50) by FS60.airspan.com (10.2.10.60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.12; Tue, 14 Dec
 2021 12:18:12 +0000
Received: from FS50.airspan.com ([fe80::5103:1cfd:775b:73dc]) by
 FS50.airspan.com ([fe80::5103:1cfd:775b:73dc%5]) with mapi id 15.01.2375.017; 
 Tue, 14 Dec 2021 12:18:12 +0000
From: Barbaros Tokaoglu <btokaoglu@airspan.com>
To: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev
 <Vladimir.Isaev@synopsys.com>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: Miika Keskinen <mkeskinen@airspan.com>
Subject: [PATCH v2] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline operation
Thread-Topic: [PATCH v2] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX8OSpc3XIvkPo7kSrkdg2fRQfkA==
Date: Tue, 14 Dec 2021 12:18:12 +0000
Message-ID: <588d5473-0344-3284-2a8b-b2a105eece8d@airspan.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.35.200.190]
x-c2processedorg: 9bdab810-6dbc-44eb-a994-a231bebe8d9f
Content-ID: <A49F22A79EC9E14592B29B969A8AF730@airspan.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_041819_428178_56302232 
X-CRM114-Status: UNSURE (   9.46  )
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
@@ -251,13 +251,6 @@ void __cache_line_loop_v3(phys_addr_t paddr, 
unsigned long vaddr,
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
@@ -268,10 +261,8 @@ void __cache_line_loop_v3(phys_addr_t paddr, 
unsigned long vaddr,
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
