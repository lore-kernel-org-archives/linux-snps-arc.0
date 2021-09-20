Return-Path: <SRS0=haVn=OK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A989C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Sep 2021 17:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637B26330D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Sep 2021 17:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 637B26330D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRq8Zellz4iC0zeyizabP+12+yE2mqClLEdTk2mWUEA=; b=0K5mlS9gFMY5TK
	45CvPJXls0a7LDMlkxHqii00qCt7Nu5PLkwizNCeh/cLV0sIjDlpqy/DZwNouD2zAM32ptFg4MzEi
	+zrecKOJW4ATXWJyQhVcJj/031F+Z3N0wbrKQnYAPILy1ZVx2zcS1n6G5e9BpkdFV5I15/tWOkbj8
	//teEt/Zugxyn216WmJb80cl5J3I1pQYHO05oDOT9bHuc692ogQd2AehrLPTvQbvrHgpfVhs6EG7k
	xJ9+2KVYJaKrLRn4BsHfCZnEbtA3UMnQuP7svN7qWM5OQrMdM6i+JANTQvBqI5ZxBm3ktFhuGGpuK
	FfHYo8yJfIwpx0ufCdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSN5o-002cnu-U5; Mon, 20 Sep 2021 17:28:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSN5m-002cn9-9X
 for linux-snps-arc@lists.infradead.org; Mon, 20 Sep 2021 17:28:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D64C6330A;
 Mon, 20 Sep 2021 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632158913;
 bh=1Ba3KhtEOml4S43b/+tqGlRyZIVlN/+Kmc1slN5ZFSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GR/J+wrTB7iG/Zi1mDat8+CaAdN83+VgqKzI7yL2+E/qppPT7yIZIEnRsJeXqGCjz
 u5zYQ1OsGPi1XcgmkianQEo5tMTM6xkDAsbXe/y0t/UsXyHJ+I3i1B+pyHrRjpY5DL
 JnePRDrgZyrieMu8ZvNW3iTX3xVnyZCMb87Spfyg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 096/122] ARC: export clear_user_page() for modules
Date: Mon, 20 Sep 2021 18:44:28 +0200
Message-Id: <20210920163918.940333154@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920163915.757887582@linuxfoundation.org>
References: <20210920163915.757887582@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_102834_375341_66693AB0 
X-CRM114-Status: GOOD (  11.64  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 6b5ff0405e4190f23780362ea324b250bc495683 ]

0day bot reports a build error:
  ERROR: modpost: "clear_user_page" [drivers/media/v4l2-core/videobuf-dma-sg.ko] undefined!
so export it in arch/arc/ to fix the build error.

In most ARCHes, clear_user_page() is a macro. OTOH, in a few
ARCHes it is a function and needs to be exported.
PowerPC exported it in 2004. It looks like nds32 and nios2
still need to have it exported.

Fixes: 4102b53392d63 ("ARC: [mm] Aliasing VIPT dcache support 2/4")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/mm/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index a2fbea3ee07c..102418ac5ff4 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1123,7 +1123,7 @@ void clear_user_page(void *to, unsigned long u_vaddr, struct page *page)
 	clear_page(to);
 	clear_bit(PG_dc_clean, &page->flags);
 }
-
+EXPORT_SYMBOL(clear_user_page);
 
 /**********************************************************************
  * Explicit Cache flush request from user space via syscall
-- 
2.30.2




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
