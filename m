Return-Path: <SRS0=TWh9=ZM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753DDC432C3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Nov 2019 11:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F4421823
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Nov 2019 11:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RmfFBnID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JpI+SdPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46F4421823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+hPpxuWxXnRJhwoWlIL+0frXWXaT7IiohfPygjPw0WI=; b=RmfFBnIDhn7O0r
	Rb8RTBr+7Js3KtEbFF+/nnaaqM7z0x/8GLh092moI9lFpz3f5EMwZE1jiM77t2rLxbjYJVv2hsPkq
	bwAsKtcqKHQbgryPkg8zpiFQzJG94VVVMUfRoJ2mHt+3mmy4EoeTCae6cZz5DT2nY9qkSv4A//WTv
	guvuJgcAnsCyj68APPIbsWYM/qKkanvmoQCzrIjrUOS6j5PtEp6zrGzAs0AejDkbSEzmNIvLVqf84
	sldOBtbk52W0D/yIIrnJ6Wopix5H84EsAZePkgYgE/4VYBTZqrpG8BgwDLH++3p4xacUmYKjODkGa
	iDVxm3Mq43lGI/9dDkHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXOAu-0006OY-5f; Wed, 20 Nov 2019 11:29:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXOAr-0006N4-8n
 for linux-snps-arc@lists.infradead.org; Wed, 20 Nov 2019 11:29:30 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C4281C2EC6;
 Wed, 20 Nov 2019 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574249367; bh=xZuiw9xcWz5xaSLQT61O3wtX7ReJt+MIEb7btLMma1A=;
 h=From:To:Cc:Subject:Date:From;
 b=JpI+SdPewEQsTsLKOKZhfiREdC0oEbtTpa5I6VATJE5tzhnQRul7fUNUfJ/bvOqdo
 ivJa2vsGMeGJElfD8+Dq0G2NaCp7jV4rGIgfTK6LGfpc8JoFE//qJs46PaagrpCJ1V
 FnXnrzV942haXg3KRAsDJQu/aGwhdow6YJA0WgLLxlFqF3TW2pD9aD85RFq4/+UGI1
 3RTxwtFOXI+V+U8RxeUjMKpfjtqYDPoiHyTkmlM1PkB4UeyHlWu4ribFFqQl+mONpZ
 Q/pD+CoPFgR1xaLz3mVxgJOIcJUuBDyTxzNmV8k5tZZVCIdEOK1FXYB6h6gbRk8son
 Dp7QggbVyOqnA==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id AE626A0057;
 Wed, 20 Nov 2019 11:29:24 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 1/2] ARC: [plat-axs10x]: use pgu pll instead of fixed clock
Date: Wed, 20 Nov 2019 14:29:22 +0300
Message-Id: <20191120112923.431-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_032929_350680_D8A8902D 
X-CRM114-Status: UNSURE (   8.86  )
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
Changes v1->v2:
 * add missing input_clk node to AXS101. No changes for AXS103 /
   AXS103 SMP.

 arch/arc/boot/dts/axc001.dtsi    |  6 ++++++
 arch/arc/boot/dts/axs10x_mb.dtsi | 11 ++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index 6ec1fcdfc0d7..79ec27c043c1 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -28,6 +28,12 @@
 			clock-frequency = <750000000>;
 		};
 
+		input_clk: input-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <33333333>;
+		};
+
 		core_intc: arc700-intc@cpu {
 			compatible = "snps,arc700-intc";
 			interrupt-controller;
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
