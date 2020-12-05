Return-Path: <SRS0=Eqoi=FJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F00DC433FE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Dec 2020 15:28:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C483923107
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Dec 2020 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C483923107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j9nZvcf3J9bDi9MfPN+nq6GHZV24ARm7xCcSYjltO4U=; b=3OnAhuSrJRPD2gmBQwVC3CeC/
	91ebUOAbXVLZVJLX5J/KgW/5Z9XA2k7sOktLjEvM1FPg359N+q2NzghgNlOj8jjJD5iL0iThf3V+y
	04uGff8xnItw1eZAZH2qvsK5gqqOV6fTxmRAbRRlJHqoDkuiEZqtjsGLeu5w8YdjahYvtOEraq+sX
	USpVGCFGvPggULmH9m3YScRValSNW3Pvn4fHPSeF8OYbpep+w9iJOp8ii30x/qjmWUa9Kd1gCpYUG
	O0mGbIM5PJOxD2ZrJ8YP6XnQ9keGPfuli+2UiT4okXe6/i8bHlq98+cTrCcg82a2VdF4m/lg2m9tV
	iwa5uYJ0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klZTc-0004CI-LD; Sat, 05 Dec 2020 15:28:00 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klZRF-00031g-3K; Sat, 05 Dec 2020 15:25:37 +0000
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kevin Hilman <khilman@baylibre.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v5 15/19] dt-bindings: usb: meson-g12a-usb: Fix FL-adj
 property value
Date: Sat, 5 Dec 2020 18:24:22 +0300
Message-ID: <20201205152427.29537-16-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_102533_662467_85909D44 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: devicetree@vger.kernel.org,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-amlogic@lists.infradead.org,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

An empty snps,quirk-frame-length-adjustment won't cause any change
performed by the driver. Moreover the DT schema validation will fail,
since it expects the property being assigned with some value. So set
fix the example by setting a valid FL-adj value in accordance with
Neil Armstrong comment.

Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

---

Note the same problem is in the DT source file
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
---
 .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index c0058332b967..1eda16dd4ee0 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -229,6 +229,6 @@ examples:
               interrupts = <30>;
               dr_mode = "host";
               snps,dis_u2_susphy_quirk;
-              snps,quirk-frame-length-adjustment;
+              snps,quirk-frame-length-adjustment = <0x20>;
           };
     };
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
