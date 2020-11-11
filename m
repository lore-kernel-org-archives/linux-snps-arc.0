Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1666DC4742C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:13:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8DC206E3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PsA6f1uR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8DC206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rxhSEjwpaNe87vpMQeSbAYwQ5zX/7l0dPEno3sjhK9I=; b=PsA6f1uRlcYAVCB9qVrMvUVDk
	y3x2yy41tLUa6SyeH2y5wcgQS89a1hAanjRNSmpxiaWuRd8vpOfHhmQj5mURKyGv2+ggml3NPQXKI
	p9ElTEf9zQN5LakKDLFONqpb1sT7VIro5fQtGfglBpgvHXIV1es8AAkicc4OM7W67Wv480Egr00oV
	bHwnyShFhk9FdQ09qEP5D4t2AApZLMgWaxii2DCpuxT/038Bc61/zHQIbRHbnLOY55XgFw78ib8w/
	H947/A1qtdgltAkVqpU5eSidQ3VWuIPTtTmFymsExhNwR5YnmV9KFudhggWHKMY9ce7UwB4FgHSU5
	2WPCS7pFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmCB-0007A5-MB; Wed, 11 Nov 2020 09:13:39 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcm82-0004sg-69; Wed, 11 Nov 2020 09:09:33 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id AE59C803073D;
 Wed, 11 Nov 2020 09:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wsDKerN1vQE; Wed, 11 Nov 2020 12:09:07 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 06/18] dt-bindings: usb: Add generic "usb-phy" property
Date: Wed, 11 Nov 2020 12:08:41 +0300
Message-ID: <20201111090853.14112-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_040922_595823_708BCC7E 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Even though the Generic PHY framework is the more preferable way of
setting the USB PHY up, there are still many dts-files and DT bindings
which rely on having the legacy "usb-phy" specified to attach particular
USB PHYs to USB cores. Let's have the "usb-phy" property described in
the generic USB HCD binding file so it would be validated against the
nodes in which it's specified. Mark the property as deprecated to
discourage the developers from using it.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Discard '|' from the property description, since we don't need to
  preserve the text formatting.

Changelog v4:
- Move the "usb-phy" property definition into the usb.yaml schema where
  all generic USB properties are now defined.
---
 Documentation/devicetree/bindings/usb/usb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
index 6dc4821e63c3..5400893d693e 100644
--- a/Documentation/devicetree/bindings/usb/usb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -24,6 +24,13 @@ properties:
     description:
       Name specifier for the USB PHY
 
+  usb-phy:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD to be accepted by the legacy USB
+      Physical Layer subsystem.
+    deprecated: true
+
   phy_type:
     description:
       Tells USB controllers that we want to configure the core to support a
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
