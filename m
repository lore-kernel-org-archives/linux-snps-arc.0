Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4224EC18E5A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB1420873
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pu4Yhbd5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P/CN4sXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB1420873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvbFUCrw3qZ43U+id+hRp1NYR56EFmv2xJ8+4O9hoNI=; b=Pu4Yhbd5e6eBvR
	QRmd07Y7lKdLVg6tNn/TFv7vFtRprkr8fi23oy2WCBKPU+pHf7s4zm/Z2Q+V8T/93Zrw4p+nmVLrH
	aJsY/sm0LjopC81gbysKqCjgoau0Wkb2c047POJDTYdUZc8hxosmtsgX4ldU3iyC0Hp9uIa2n+apR
	KwU85N9uoAgOmIF44DpPCJwkbqS6YXj3nrr+PrJhAUDvyVWa0rQmW/scGwOFAdWeksl1PMdCD8O2X
	pVJ1qID4VNLkS1t6WxQElyTmgLRkt9n7OhK5npY5oYIcxehhNEUo3lZ+Tzn2Yt2BowByI54xzFSTs
	KuHLFIjRgL5xNREGK9EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1bx-0002bB-DI; Wed, 11 Mar 2020 13:41:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1bt-0002Z1-EK
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 13:41:23 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A785243B60;
 Wed, 11 Mar 2020 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583934080; bh=MrYqWoJsLLc48EYOcna6bzraId29vA+POfySYiFDcto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P/CN4sXj58UqoIpsW4r9iBWNBV9e2ghWDYdt6Rnv2sdAvNBFlQv3/ZR+Jn5n9WGEe
 eVzF2YfV2bURfjeSQI74i5fX0ojR4tn6EaA3g1FjOvNhRBtbPIZ/dmkH4FaD3/ROrV
 yyFi7ST30lj44kBoHHOFrSp19lO9Oop4rxUreaV4gWLPR197kHINcNjx+WuZ4PR8Vp
 ll+29ymICQHJxLG3hi5099RTxYWu7B2fXeS0Tnk5MrgGjWoLTL94pWh2ZTktMua4q9
 z2hAp+Q5+835a8hAz0VnngDfHOcWDE2HNXYbVDTF+hC88AtSdMJjXT4bWUtAqf4iCU
 tdDK0+iZDO4pw==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id F380CA0063;
 Wed, 11 Mar 2020 13:41:18 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 2/3] CLK: HSDK: CGU: support PLL bypassing
Date: Wed, 11 Mar 2020 16:41:14 +0300
Message-Id: <20200311134115.13257-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
References: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_064121_495303_9824CC19 
X-CRM114-Status: GOOD (  10.49  )
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

Support setting PLL to bypass mode to support output frequency
equal to input one.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/clk/clk-hsdk-pll.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index b47a559f3528..0ea7af57a5b1 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -53,35 +53,37 @@ struct hsdk_pll_cfg {
 	u32 fbdiv;
 	u32 odiv;
 	u32 band;
+	u32 bypass;
 };
 
 static const struct hsdk_pll_cfg asdt_pll_cfg[] = {
-	{ 100000000,  0, 11, 3, 0 },
-	{ 133000000,  0, 15, 3, 0 },
-	{ 200000000,  1, 47, 3, 0 },
-	{ 233000000,  1, 27, 2, 0 },
-	{ 300000000,  1, 35, 2, 0 },
-	{ 333000000,  1, 39, 2, 0 },
-	{ 400000000,  1, 47, 2, 0 },
-	{ 500000000,  0, 14, 1, 0 },
-	{ 600000000,  0, 17, 1, 0 },
-	{ 700000000,  0, 20, 1, 0 },
-	{ 800000000,  0, 23, 1, 0 },
-	{ 900000000,  1, 26, 0, 0 },
-	{ 1000000000, 1, 29, 0, 0 },
-	{ 1100000000, 1, 32, 0, 0 },
-	{ 1200000000, 1, 35, 0, 0 },
-	{ 1300000000, 1, 38, 0, 0 },
-	{ 1400000000, 1, 41, 0, 0 },
-	{ 1500000000, 1, 44, 0, 0 },
-	{ 1600000000, 1, 47, 0, 0 },
+	{ 100000000,  0, 11, 3, 0, 0 },
+	{ 133000000,  0, 15, 3, 0, 0 },
+	{ 200000000,  1, 47, 3, 0, 0 },
+	{ 233000000,  1, 27, 2, 0, 0 },
+	{ 300000000,  1, 35, 2, 0, 0 },
+	{ 333000000,  1, 39, 2, 0, 0 },
+	{ 400000000,  1, 47, 2, 0, 0 },
+	{ 500000000,  0, 14, 1, 0, 0 },
+	{ 600000000,  0, 17, 1, 0, 0 },
+	{ 700000000,  0, 20, 1, 0, 0 },
+	{ 800000000,  0, 23, 1, 0, 0 },
+	{ 900000000,  1, 26, 0, 0, 0 },
+	{ 1000000000, 1, 29, 0, 0, 0 },
+	{ 1100000000, 1, 32, 0, 0, 0 },
+	{ 1200000000, 1, 35, 0, 0, 0 },
+	{ 1300000000, 1, 38, 0, 0, 0 },
+	{ 1400000000, 1, 41, 0, 0, 0 },
+	{ 1500000000, 1, 44, 0, 0, 0 },
+	{ 1600000000, 1, 47, 0, 0, 0 },
 	{}
 };
 
 static const struct hsdk_pll_cfg hdmi_pll_cfg[] = {
-	{ 297000000,  0, 21, 2, 0 },
-	{ 540000000,  0, 19, 1, 0 },
-	{ 594000000,  0, 21, 1, 0 },
+	{ 27000000,   0, 0,  0, 0, 1 },
+	{ 297000000,  0, 21, 2, 0, 0 },
+	{ 540000000,  0, 19, 1, 0, 0 },
+	{ 594000000,  0, 21, 1, 0, 0 },
 	{}
 };
 
@@ -134,11 +136,16 @@ static inline void hsdk_pll_set_cfg(struct hsdk_pll_clk *clk,
 {
 	u32 val = 0;
 
-	/* Powerdown and Bypass bits should be cleared */
-	val |= cfg->idiv << CGU_PLL_CTRL_IDIV_SHIFT;
-	val |= cfg->fbdiv << CGU_PLL_CTRL_FBDIV_SHIFT;
-	val |= cfg->odiv << CGU_PLL_CTRL_ODIV_SHIFT;
-	val |= cfg->band << CGU_PLL_CTRL_BAND_SHIFT;
+	if (cfg->bypass) {
+		val = hsdk_pll_read(clk, CGU_PLL_CTRL);
+		val |= CGU_PLL_CTRL_BYPASS;
+	} else {
+		/* Powerdown and Bypass bits should be cleared */
+		val |= cfg->idiv << CGU_PLL_CTRL_IDIV_SHIFT;
+		val |= cfg->fbdiv << CGU_PLL_CTRL_FBDIV_SHIFT;
+		val |= cfg->odiv << CGU_PLL_CTRL_ODIV_SHIFT;
+		val |= cfg->band << CGU_PLL_CTRL_BAND_SHIFT;
+	}
 
 	dev_dbg(clk->dev, "write configuration: %#x\n", val);
 
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
