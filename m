Return-Path: <SRS0=NTAw=3S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE30C33CB2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jan 2020 11:08:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A605E2071E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jan 2020 11:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QlFg09xk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bIbHDvBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A605E2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dMTfOxSIQnZA+lTiasFrFphbYE7BA7dIxLQ4iHFTcpo=; b=QlFg09xkCjaJ5a
	0+X4Q+K/L0WnTNJI3w0Fl2FJDzCcOLxT9CRGJL3wxM6fQP1ntnt4gmlCON4ntuN4gt8dkHR5JbQEv
	ez9JzkcgoPc6X+P2Vq83nCCTn8xBiaaRYsO+GAFmL/7YDDXkJQ7Dz6BNgp5qDDYrDx22xkK3B9Z70
	01YO6Es2B50IY6IUvJkoNSHUGeYXernVzVqSAhtP0H90M585o+82rRxW7UKsLIE7ePysc2YkaI28U
	sJhsXYd7OfULRdLnHhd/OYz4U9FFsY63WsLCyPYZrT4alngMeHWTBMuZuTneUt2qyFEtkzPFTyjRM
	/XWqM66f8oWCruSgzYSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwlDB-0001mi-0t; Wed, 29 Jan 2020 11:08:45 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwlD8-0001lq-Sj
 for linux-snps-arc@lists.infradead.org; Wed, 29 Jan 2020 11:08:44 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79E5E40815;
 Wed, 29 Jan 2020 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580296120; bh=GlEu2odxEmY5CcdXpMOCOohEsEYGyM7olGp88Ua6UIs=;
 h=From:To:Cc:Subject:Date:From;
 b=bIbHDvBffdqTBrDFayT9qbIX9l1/S7FuBYqVIuUmL9ZwsW/tW/u3SSOgPSGG5vxXI
 KqrHv7sAHyZN7M+ntT3tU7IGT7nExJq6408RNAVtc9zfF5Lu65RRAA75aj8JD0u6rs
 L1BS4ltcVoqcqDk4OdfnsyaN1c5UKTFA/IG/05gDcalZtXD7KwTN8PV7AAhLcVhT47
 +sQ91iBnQd4Lg04tG/XbA4JvhS7ha8weX7ytbcv5bSPQJ6BhM1WZn9UReLQMI/BOyC
 bZmyIA+2skrPgvGRVvgg9EzftPvN/NGEg+J5R1Hgm9hN8/S9OWm0LX8/3LKlrrzg7a
 D5sydvMGPfS6Q==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.65])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1B06AA005E;
 Wed, 29 Jan 2020 11:08:33 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: uboot-snps-arc@synopsys.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 1/2] CLK: HSDK: Check for PLL bypass firstly
Date: Wed, 29 Jan 2020 14:08:29 +0300
Message-Id: <20200129110830.22004-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_030842_927581_5FFC87BC 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: u-boot@lists.denx.de, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Pll bypass has priority over enable/disable.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/clk/clk-hsdk-cgu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-hsdk-cgu.c b/drivers/clk/clk-hsdk-cgu.c
index 56ef08c032b..69e6b24b66c 100644
--- a/drivers/clk/clk-hsdk-cgu.c
+++ b/drivers/clk/clk-hsdk-cgu.c
@@ -377,14 +377,14 @@ static ulong pll_get(struct clk *sclk)
 
 	pr_debug("current configurarion: %#x\n", val);
 
-	/* Check if PLL is disabled */
-	if (val & CGU_PLL_CTRL_PD)
-		return 0;
-
 	/* Check if PLL is bypassed */
 	if (val & CGU_PLL_CTRL_BYPASS)
 		return PARENT_RATE;
 
+	/* Check if PLL is disabled */
+	if (val & CGU_PLL_CTRL_PD)
+		return 0;
+
 	/* input divider = reg.idiv + 1 */
 	idiv = 1 + ((val & CGU_PLL_CTRL_IDIV_MASK) >> CGU_PLL_CTRL_IDIV_SHIFT);
 	/* fb divider = 2*(reg.fbdiv + 1) */
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
