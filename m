Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F467C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Apr 2022 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cs3L8WEDwV3ECHMHcOEYyg5mx8cPugNx/qHc/Ms/sQs=; b=ex69qguVF4Zko2
	qVQP/QgiIlc2iON7GKLK1WjauBhxLUmixxOpVIt6ee1ZZE2mttAcab6VhcOv/a1VOZ8V8e0R3it7S
	7j1w/+KZAnWyTm5oAITiucLXsXi1QGZnywEMzy5HSTvKCqfxJKFsQuCyCpjHvhaKnBG/LWoU2UaNk
	1fCxdcZqs7elYm0tBlH7NpOsFZmtjNey8Q9JXS/XdNZ36hSh/9S1oDeqOP/lRf69A/DFhGdnaxXDN
	LhMzOgg0cHDdgT5EOtmoUSfvX3b9h2QmbRR5WokjeAzvLKvgV3FpYbVQly19wyv1wZYoy81sL8kBo
	ERcYjm6fRYuawyi75oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTF4-00CQ6v-76; Thu, 07 Apr 2022 14:36:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTCP-00COhx-Vp
 for linux-snps-arc@lists.infradead.org; Thu, 07 Apr 2022 14:33:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n6so11185339ejc.13
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Apr 2022 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WexuKP2+sDgybtIp4d5+di9H7v3WxWenN1FdjYcEmk=;
 b=y/SG15SEpRCCG8uYeJmXPIv9oAYavis/ItpzS7yLNHAFM5XaLn3QHBwSEUJF76Fljx
 92pFV11kezcROBOnXoPUn+IeOEFyawtfsm+3onlxSnHrxn1hbkL/V2rILaCwpRAnI/47
 /IpC+r5T09f0/F1fwJ0GZBFy16DypolTb61Y26dkfUT9ddK9Ay7vmpheriUCk3wh5D6d
 R+PCulq7AcsKwaTaDucEuQvU+c3vs0SRV8d2Hzp8RJBfH+EMh35leg3hfUUpxjWkNEf4
 u4oPwWrUaRudP6dFhUYRHn9TBlAXuA9XOk9l0MhgVy3URBlVAOpRa3oil7DnhSpx/eMZ
 Jmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WexuKP2+sDgybtIp4d5+di9H7v3WxWenN1FdjYcEmk=;
 b=nh8e087gtvNM76xDxCpzw1aesPRYro5zhrsVp/Rc4WansEo1H0HPVWKAF7OuPcfZ5J
 zir1PUsYoX50o8HzywII7o++o4CTN37keMk5VK6B7BibAgPjG9iZOvopVUivrmPR418A
 oS+jsEoofG26R1e9L539oRdYrozlMC4ky6S5B6k5Dsw+fnWgq1kT1zougj/7rp06yBct
 8ByFlauw8kPJ7gSmdxOwSVmXxYqejmbn/N1rExhncO5Su2I4nfiyLOgauu68BlKtotV3
 waLpfQbwQk8DQ6LjTPOxJXHCqPXsx0ZaO+ohOuEKTDx5olbsMCTX7U4z/Dm+iKf5aHeO
 UUng==
X-Gm-Message-State: AOAM530ghN3X2b8MeHiyWO+BXG+bVftow3RJI288JCY2/SP1Oh7/bVyB
 6nNTOdhdnQTi07HptvwKFPE3pg==
X-Google-Smtp-Source: ABdhPJw5zue4iKS/TQaJIGMwSZ6Y7iPPlhdZ+SImZzHszW1qfRZOjpR6siPostuHMy/5BnvEtua0aw==
X-Received: by 2002:a17:907:7e99:b0:6e0:2fed:9789 with SMTP id
 qb25-20020a1709077e9900b006e02fed9789mr13512644ejc.72.1649342004706; 
 Thu, 07 Apr 2022 07:33:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm7653567ejc.174.2022.04.07.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:33:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, devicetree@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARC: dts: align SPI NOR node name with dtschema
Date: Thu,  7 Apr 2022 16:33:22 +0200
Message-Id: <20220407143322.295696-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_073326_075117_C434BA39 
X-CRM114-Status: UNSURE (   9.60  )
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

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arc/boot/dts/hsdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index dcaa44e408ac..f48ba03e9b5e 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -275,7 +275,7 @@ spi0: spi@20000 {
 			cs-gpios = <&creg_gpio 0 GPIO_ACTIVE_LOW>,
 				   <&creg_gpio 1 GPIO_ACTIVE_LOW>;
 
-			spi-flash@0 {
+			flash@0 {
 				compatible = "sst26wf016b", "jedec,spi-nor";
 				reg = <0>;
 				#address-cells = <1>;
-- 
2.32.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
