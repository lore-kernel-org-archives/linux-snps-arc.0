Return-Path: <SRS0=PoFS=ZL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B71C432C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 13:22:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C6E222C2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 13:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l+AOhblq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h6pv1IqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C6E222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIz8+kegoLRuwSgBbLarmJdxu6k3CZTafNOYVOz1EY8=; b=l+AOhblqY5edGL
	ohE48QHBxFngCKIBMMlA7DYE7KkXrhQFjhusLijYAQim9eT6emBvMj9jjoD0C3g7P/nJgGStj2CdT
	EENUea0uKBP7+eTP2XI0Y0rF884fJzUmo+m8shkF38qJrB2VQh17RAMVErQazcwdyJtuliyd/JnHH
	jtloxAu0jQaYdEr4Z3eKS5thp7yMH4jFpnWg1N00csSzXyy/MZhC2umLOsNcGy55syCHFrFPrpj6D
	XP0jL+6SM68uB40HB+6zHxjIKD6h7r+m2Pg+BoT5Ky69DEUkOqQ+7peNodZkD8fXSuO6mZW7HNbOC
	dQGS0G+8D9tp+enJYpqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX3Sb-0002je-B2; Tue, 19 Nov 2019 13:22:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX3SY-0002iG-Qo
 for linux-snps-arc@lists.infradead.org; Tue, 19 Nov 2019 13:22:24 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B6AADC04B5;
 Tue, 19 Nov 2019 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574169740; bh=9QTEGRJcENaTi4DjOhtqNfA9DLY6BKQ15SnmReiHuB4=;
 h=From:To:Cc:Subject:Date:From;
 b=h6pv1IqIiYSRosFwWcL9Y+mun2ub/7SAcdBddKlWlqWdgNbSrHnrGxJvr7Fdh8lxt
 RlfiUGHKpA9IQvSUAx1wMgZ8dQDOJHhsT4IyfiKrFs3HUMywbecEszAj/OO6kqPNKr
 JFlWEBfi1LliZqd0mJw5rKmmZ2racZd/ybCRDYBRz5GDCL6r0Lf31RurcFje4AVK7c
 u0vxo3udik9oYU//V59MrWRktKSsSTj0V4FKf2Me0Gvv+48J0ry4lD8eMjG/5SDi6q
 bcmTML84gsYdsrqtHIwssmvN1Yc1hk3Bnzmu2T/7mR+qfQPSlocCFv7LodBSr7JGqi
 /Em4qBduCxt1A==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8D60CA005D;
 Tue, 19 Nov 2019 13:22:17 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 1/2] ARC: [plat-axs10x]: use pgu pll instead of fixed clock
Date: Tue, 19 Nov 2019 16:22:14 +0300
Message-Id: <20191119132215.3011-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_052222_904992_A99803D7 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Use PLL driver instead of fixed-clock for PGU pixel clock.
That allows us to support wider range of graphic modes.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 08bcfed6b80f..f9a5c9ddcae7 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -61,12 +61,13 @@
 				clock-frequency = <25000000>;
 				#clock-cells = <0>;
 			};
+		};
 
-			pguclk: pguclk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-				clock-frequency = <74250000>;
-			};
+		pguclk: pguclk@10080 {
+			compatible = "snps,axs10x-pgu-pll-clock";
+			reg = <0x10080 0x10>, <0x110 0x10>;
+			#clock-cells = <0>;
+			clocks = <&input_clk>;
 		};
 
 		gmac: ethernet@18000 {
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
