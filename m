Return-Path: <SRS0=Eqoi=FJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AABC4361A
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Dec 2020 15:26:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC9522A83
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Dec 2020 15:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC9522A83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NSWXSId+w2QKVTnd7JpjCzaOdMP8uykYFxNlP4M7j7U=; b=A9w4MZvAmbp6ZNXe8twtPEKKH
	XZvJVQlhn/JxecL/kYXTfkSVFWkUIsoSK9zwk5Gg9XUdyJrdpFmjBzQuERkLNtWRq9PJV9/xxTbXM
	ET6m0h5++09UJ5zFUuSqcckAFHlaAZnGP8yZtpkPzqGhsDbiTH2Pe0owNHu+LVq/c54amB4khVA69
	zKy2p8FgSRK2mdWnOcGZylf2Xi3Kp01Z6I33KHVpmUezjRlJE7+NfbzpFCazhhdl8LiWX218lrvym
	qyaPfJ+Wj1VxWOQsu6lee7aFbS9YLQTeuaD7F55BsZNCGjuj22OHhoZSb2afJkLqQx8S7LiKyNO4j
	NfsfQEcbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klZRi-0003AJ-Ml; Sat, 05 Dec 2020 15:26:02 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klZRA-0002z5-Ld; Sat, 05 Dec 2020 15:25:32 +0000
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH v5 01/19] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Date: Sat, 5 Dec 2020 18:24:08 +0300
Message-ID: <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_102529_110871_77C9449C 
X-CRM114-Status: GOOD (  11.53  )
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
 linux-mips@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

There can be three distinctive types of the USB controllers: USB hosts,
USB peripherals/gadgets and USB OTG, which can switch from one role to
another. In order to have that hierarchy handled in the DT binding files,
we need to collect common properties in a common DT schema and specific
properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
dedicated for the USB host controllers only, let's move some common
properties from there into the usb.yaml schema. So the later would be
available to evaluate all currently supported types of the USB
controllers.

While at it add an explicit "additionalProperties: true" into the
usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
properties is going to be get mandatory soon.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v4:
- This is a new patch created as a result of the comment left
  by Chunfeng Yun in v3

Changelog v5:
- Discard duplicated additionalProperties property definition.
---
 .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
 .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index b545b087b342..81f3ad1419d8 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -9,18 +9,8 @@ title: Generic USB Host Controller Device Tree Bindings
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-properties:
-  $nodename:
-    pattern: "^usb(@.*)?"
-
-  phys:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description:
-      List of all the USB PHYs on this HCD
-
-  phy-names:
-    description:
-      Name specifier for the USB PHY
+allOf:
+  - $ref: usb.yaml#
 
 additionalProperties: true
 
diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
new file mode 100644
index 000000000000..941ad59fbac5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Controller Device Tree Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^usb(@.*)?"
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD
+
+  phy-names:
+    description:
+      Name specifier for the USB PHY
+
+additionalProperties: true
+
+...
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
