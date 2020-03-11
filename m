Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A67AC10F27
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:41:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506AF20873
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jLf1X71O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZYD4YF5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 506AF20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhjUsykIWWEVzTerilkhOH3vsneO8QXIOPXMKWu1lQg=; b=jLf1X71OztFpU1
	apGrzdPOhrAs2F38sEuFuySvcLhCxygQIknOKFbl1OiBhYY6PrY+7JUOBjmgi6xFuZNcK3qvczcDF
	nlRLGbX7gb+ssopHRQhtqYSFwP9kbg8q8hMSB2DJ+GtGG67p3JJYvyNdj8nQEQyAvw2yBrNbRmptH
	V3jAyt801p112m/taFRUjbLmKaKPb9Y88D+4c4bQ9zJC8/OgLWz5gIxnMA8PertpjDxf8Bm66M83G
	BSc5OsNx2tkoKN5FrwsyadTUK2pDEWmpuREYHt4i7DO/o3h3+Pg126gQRUEhA+JG4NwihoX66//F1
	cKC2qUdO5dOaXy8fHEZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1by-0002bp-HK; Wed, 11 Mar 2020 13:41:26 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1bv-0002Zp-Nu
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 13:41:24 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DB0DEC0F5D;
 Wed, 11 Mar 2020 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583934082; bh=oVoyuxIlBGz3ZShXiT6O9EPX9Q5VwDgjwocJvAJsmOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZYD4YF5cLLSo+ccTWIM3l0tY8uM/wWCLMfsJuXR3xfoe6eMkLoogmF/Y/0KjYL8kj
 UVWXmhUqyzfx4heWCJh2u4Fy8Sggw1B5qGLn0gdyCY9OPv+2k1KbQOH7U/+xVRmV0v
 rmRxNvvLIOfZ+9TnOlXv4JA27alQEOBHat0foH7LElM8gyl894GlB5p1BEzF4TDCeN
 lRVophBUcECKK7On7UNnJEQyRsCzks0XVVzo6y1w/Ig/564Jil/m0JGXX+PtGwkTzk
 Rrjpi09FircFZBecTj7XctuhRc4yKhHc8KjaA29qDYCJr9eRsjjP9oTucSglWiP6ei
 4wxXOcrAqDKBw==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9D0C9A0064;
 Wed, 11 Mar 2020 13:41:19 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 3/3] CLK: HSDK: CGU: add support for 148.5MHz clock
Date: Wed, 11 Mar 2020 16:41:15 +0300
Message-Id: <20200311134115.13257-4-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
References: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_064123_807499_859D3A94 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Add support for 148.5MHz clock for HDMI PLL

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/clk/clk-hsdk-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index 0ea7af57a5b1..b4f8852201cb 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -81,6 +81,7 @@ static const struct hsdk_pll_cfg asdt_pll_cfg[] = {
 
 static const struct hsdk_pll_cfg hdmi_pll_cfg[] = {
 	{ 27000000,   0, 0,  0, 0, 1 },
+	{ 148500000,  0, 21, 3, 0, 0 },
 	{ 297000000,  0, 21, 2, 0, 0 },
 	{ 540000000,  0, 19, 1, 0, 0 },
 	{ 594000000,  0, 21, 1, 0, 0 },
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
