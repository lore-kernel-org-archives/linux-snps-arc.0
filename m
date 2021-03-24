Return-Path: <SRS0=H19V=IW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB77C433DB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Mar 2021 20:57:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D22C619B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Mar 2021 20:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D22C619B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLYrlDQaNQ7V+sNqpptTY5TMo4D5Nn7fmiVKSP/Umcs=; b=Qbqi+dXMy42SQyt73SrstEAWK
	GLVeMcU1aSxs2wJnCbT/5+3+Amf8gSu2ajpLHza8fS/pda3YNV6VoFnvK0H3lyQpD2gx9E/SMDyxC
	mebKtVSOZwHHJ5niMPyj6+174Q30RgPHVJae0jej/wCl4gnCghVRmKJR5xNjGTNB3X2HaNUttjygh
	UbsQN6KBpWeoSg6KhvOB5ViWjRX1ln0gtUXGcOIwvxGyfZw6GteoObx7GyWUl3aBMBuHFwwVS9/+9
	jjzvCLmYOwLJdSyQuOHNR2Q70imC7YCgAihxAfrJOZYPJXBT9c/JjhulITGzw3s6hvGHNUGrTcHSR
	gI+JUAYpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPAZJ-000Cu5-K6; Wed, 24 Mar 2021 20:57:33 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lPAYw-000CqK-Jc
 for linux-snps-arc@lists.infradead.org; Wed, 24 Mar 2021 20:57:14 +0000
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin
 <fancer.lancer@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-snps-arc@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/7] arc: dts: Harmonize EHCI/OHCI DT nodes name
Date: Wed, 24 Mar 2021 23:48:30 +0300
Message-ID: <20210324204836.29668-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210324204836.29668-1-Sergey.Semin@baikalelectronics.ru>
References: <20210324204836.29668-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_205710_912357_E97F3172 
X-CRM114-Status: UNSURE (   8.65  )
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

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
nodes are correctly named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arc/boot/dts/axc003.dtsi        | 4 ++--
 arch/arc/boot/dts/axc003_idu.dtsi    | 4 ++--
 arch/arc/boot/dts/axs10x_mb.dtsi     | 4 ++--
 arch/arc/boot/dts/hsdk.dts           | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index cd1edcf4f95e..3434c8131ecd 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -103,11 +103,11 @@ ethernet@18000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			dma-coherent;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			dma-coherent;
 		};
 
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 70779386ca79..67556f4b7057 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -110,11 +110,11 @@ ethernet@18000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			dma-coherent;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			dma-coherent;
 		};
 
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 99d3e7175bf7..b64435385304 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -87,13 +87,13 @@ gmac: ethernet@18000 {
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			compatible = "generic-ohci";
 			reg = < 0x60000 0x100 >;
 			interrupts = < 8 >;
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index dcaa44e408ac..fdd4f7f635d3 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -234,7 +234,7 @@ phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
 			};
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
 			reg = <0x60000 0x100>;
 			interrupts = <15>;
@@ -242,7 +242,7 @@ ohci@60000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
 			reg = <0x40000 0x100>;
 			interrupts = <15>;
diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index cbb179770293..90a412026e64 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -46,7 +46,7 @@ ethernet@18000 {
 			clock-names = "stmmaceth";
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
-- 
2.30.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
