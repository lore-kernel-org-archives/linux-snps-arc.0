Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB0CC433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 12:02:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA6420770
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 12:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSWYHlau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA6420770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=euCsCiGKuavGnGnqX3kzp+OmapYnFC0VgtmdL4wonpc=; b=QSWYHlauAh4lgO30qic5tYV1j
	oAv9NA1H6FJcc3Rfo2HiAz7zytAR6sUWghtdhnnonJPMohVzbVt1OZMpJee02t5UZPzGZjS1EUSf8
	DQO+Ed+A6hZMW8lOksp8twPbcRmiT9B/n4g+YOGsh8zTCp6EvALiGw+H7AHKHjtU6/RSTJzwl4/Vj
	SQM1TQwVgZ6LA8+TM00qfF6DfJW3p1hi0sIYL6e9uqVa5eQyagOd4uReoXy3tFynKC8/MBQK2dN/H
	y5qxsB4eHVKtktqMadmJYE0JaLQQkNbrqOY/NYfLrxPVaCk4KHI8wTPomS5jwxQe9yw6vXX64C8p2
	a8mDriNqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUqLw-0005Ia-Rh; Tue, 20 Oct 2020 12:02:56 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUqJP-0004Ec-Co; Tue, 20 Oct 2020 12:00:21 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id D40DE8030816;
 Tue, 20 Oct 2020 12:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHIphe-cfQKv; Tue, 20 Oct 2020 15:00:18 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Felipe Balbi <balbi@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexey Brodkin
 <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>
Subject: [PATCH 06/29] arc: dts: Harmonize EHCI/OHCI DT nodes name
Date: Tue, 20 Oct 2020 14:59:36 +0300
Message-ID: <20201020115959.2658-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_080019_716419_EAC02892 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
---
 arch/arc/boot/dts/axc003.dtsi        | 4 ++--
 arch/arc/boot/dts/axc003_idu.dtsi    | 4 ++--
 arch/arc/boot/dts/axs10x_mb.dtsi     | 4 ++--
 arch/arc/boot/dts/hsdk.dts           | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index ac8e1b463a70..256ecffbc31e 100644
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
index 9da21e7fd246..6eda28cbd15e 100644
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
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
