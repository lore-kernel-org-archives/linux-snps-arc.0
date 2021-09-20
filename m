Return-Path: <SRS0=haVn=OK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7302EC4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Sep 2021 17:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4391861AE1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Sep 2021 17:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4391861AE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6VIILmSj6nHZoL2KNOa9dpezEbUFKzXR0bFE1cG3wM=; b=rlD71sQijawomE
	W/WpJBHJHVhi6IVbcrpGXQKn03eQVNFaiWN6NOvdmmEeSrtTT5zaCQTH22rE6PSg6oWNRAe8O47sr
	SFnj43mX/1onYHOJj6pv1aOdEnp5uELF6S1uLiTQ3mVtM+ChN/eFVBNOPkszP2fpmXLtMZdgCgX6Q
	yA5BKfVqbevKc5y6Za8XqP3U0DL1WXbU/bonTpdE3UEiLBx51PU1UBcKJoBSB+S2XIc7S3Xb4eiJy
	z6GlLB6ky/BPTM234cdVEAAQnouuKwVRI6qh1xRPSevaN4S73StMyVFEDxJyi6lO5iRgU8v9qUg0U
	nL+WBGLeivIyXpkW4Fbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSMiS-002WwU-Pb; Mon, 20 Sep 2021 17:04:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSMiQ-002WvG-BV
 for linux-snps-arc@lists.infradead.org; Mon, 20 Sep 2021 17:04:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9736E61507;
 Mon, 20 Sep 2021 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632157466;
 bh=Unf8Uj1Wye11DRpjddwiE6ax0HVzALpL2RGe4Nk81VQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ysE74YYK4LEVOqpe6/G5e5dbxinBJJqsKKnLOWhKExT6lO0GM9I9UI2fTcc5EBZBR
 Xv+mixp9p+jYMbnv/NEyU1w27KPbSKSpimOkCRRBecCTgZtvWiKfOyJKmmgaBOwdQs
 AFKZizmEzFdH0093CPIysfsU1scz9PulBUnVTp/k=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 213/217] ARC: export clear_user_page() for modules
Date: Mon, 20 Sep 2021 18:43:54 +0200
Message-Id: <20210920163931.842626391@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920163924.591371269@linuxfoundation.org>
References: <20210920163924.591371269@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_100426_450618_AA49C6D7 
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
index d14499500106..bf02efbee5e1 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1118,7 +1118,7 @@ void clear_user_page(void *to, unsigned long u_vaddr, struct page *page)
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
