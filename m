Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0916FC56201
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:13:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8001B206E3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="roVEGrew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8001B206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NjkrEnECZnHkzivJzHm/Xi49gn94ULfzYqY5eHJNgIs=; b=roVEGrewju1ARhl0wzx2v0xQJ
	GLZq580ziM7KU0uyIJ0BYXyiPtqGcpDb70R42DoXjktnrx1uB/D9UoNPZxOMKQcvJ0FhyWBRoWwb/
	LGjfsPTUoVCPI7CuqaZy/1YwsAqw9zKkJpksW0XTGJmUmm/mrm3bE7j3IsVoPvKx6f4I3WS5ZGWjD
	ryh5dlhRs7Xjtr+icIV62wpWzTavchKUACn3taY+SQ55mopBsf2ncNPWLx8oC2r/cQsl3ZKMfmZKt
	uU8T+XiTqKXN/Vb4dFnQbHIepyGG3kOveDRjF4G8x7WXTVGSxasegzpI6/gMsPZsBs+SlWoCIDvur
	IK6LZ9kKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmCE-0007B4-5i; Wed, 11 Nov 2020 09:13:42 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcm82-0004sb-0z; Wed, 11 Nov 2020 09:09:34 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 9DFBF803202A;
 Wed, 11 Nov 2020 09:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgQjlrXG8UMp; Wed, 11 Nov 2020 12:09:08 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 07/18] dt-bindings: usb: Convert xHCI bindings to DT schema
Date: Wed, 11 Nov 2020 12:08:42 +0300
Message-ID: <20201111090853.14112-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_040922_454698_BD90430E 
X-CRM114-Status: GOOD (  18.84  )
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

Currently the DT bindings of Generic xHCI Controllers are described by
means of the legacy text file. Since such format is deprecated in favor of
the DT schema, let's convert the Generic xHCI Controllers bindings file to
the corresponding yaml files. There will be two of them: a DT schema for
the xHCI controllers on a generic platform and a DT schema validating a
generic xHCI controllers properties. The later will be used to validate
the xHCI controllers, which aside from some vendor-specific features
support the basic xHCI functionality.

An xHCI-compatible DT node shall support the standard USB HCD properties
and custom ones like: usb2-lpm-disable, usb3-lpm-capable,
quirk-broken-port-ped and imod-interval-ns. In addition if a generic xHCI
controller is being validated against the DT schema it is also supposed to
be equipped with mandatory compatible string, single registers range,
single interrupts source, and is supposed to optionally contain up to two
reference clocks for the controller core and CSRs.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
  since additionalProperties/unevaluatedProperties are going to be mandary
  for each binding.
---
 .../devicetree/bindings/usb/generic-xhci.yaml | 63 +++++++++++++++++++
 .../devicetree/bindings/usb/usb-xhci.txt      | 41 ------------
 .../devicetree/bindings/usb/usb-xhci.yaml     | 42 +++++++++++++
 3 files changed, 105 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
new file mode 100644
index 000000000000..1ea1d49a8175
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB xHCI Controller Device Tree Bindings
+
+maintainers:
+  - Mathias Nyman <mathias.nyman@intel.com>
+
+allOf:
+  - $ref: "usb-xhci.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - description: Generic xHCI device
+        const: generic-xhci
+      - description: Armada 37xx/375/38x/8k SoCs
+        items:
+          - enum:
+              - marvell,armada3700-xhci
+              - marvell,armada-375-xhci
+              - marvell,armada-380-xhci
+              - marvell,armada-8k-xhci
+          - const: generic-xhci
+      - description: Broadcom STB SoCs with xHCI
+        const: brcm,bcm7445-xhci
+      - description: Generic xHCI device
+        const: xhci-platform
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: reg
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    usb@f0931000 {
+      compatible = "generic-xhci";
+      reg = <0xf0931000 0x8c8>;
+      interrupts = <0x0 0x4e 0x0>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
deleted file mode 100644
index 0c5cff84a969..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-USB xHCI controllers
-
-Required properties:
-  - compatible: should be one or more of
-
-    - "generic-xhci" for generic XHCI device
-    - "marvell,armada3700-xhci" for Armada 37xx SoCs
-    - "marvell,armada-375-xhci" for Armada 375 SoCs
-    - "marvell,armada-380-xhci" for Armada 38x SoCs
-    - "brcm,bcm7445-xhci" for Broadcom STB SoCs with XHCI
-    - "xhci-platform" (deprecated)
-
-    When compatible with the generic version, nodes must list the
-    SoC-specific version corresponding to the platform first
-    followed by the generic version.
-
-  - reg: should contain address and length of the standard XHCI
-    register set for the device.
-  - interrupts: one XHCI interrupt should be described here.
-
-Optional properties:
-  - clocks: reference to the clocks
-  - clock-names: mandatory if there is a second clock, in this case
-    the name must be "core" for the first clock and "reg" for the
-    second one
-  - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
-  - usb3-lpm-capable: determines if platform is USB3 LPM capable
-  - quirk-broken-port-ped: set if the controller has broken port disable mechanism
-  - imod-interval-ns: default interrupt moderation interval is 5000ns
-  - phys : see usb-hcd.yaml in the current directory
-
-additionally the properties from usb-hcd.yaml (in the current directory) are
-supported.
-
-
-Example:
-	usb@f0931000 {
-		compatible = "generic-xhci";
-		reg = <0xf0931000 0x8c8>;
-		interrupts = <0x0 0x4e 0x0>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
new file mode 100644
index 000000000000..965f87fef702
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB xHCI Controller Device Tree Bindings
+
+maintainers:
+  - Mathias Nyman <mathias.nyman@intel.com>
+
+allOf:
+  - $ref: "usb-hcd.yaml#"
+
+properties:
+  usb2-lpm-disable:
+    description: Indicates if we don't want to enable USB2 HW LPM
+    type: boolean
+
+  usb3-lpm-capable:
+    description: Determines if platform is USB3 LPM capable
+    type: boolean
+
+  quirk-broken-port-ped:
+    description: Set if the controller has broken port disable mechanism
+    type: boolean
+
+  imod-interval-ns:
+    description: Interrupt moderation interval
+    default: 5000
+
+additionalProperties: true
+
+examples:
+  - |
+    usb@f0930000 {
+      compatible = "generic-xhci";
+      reg = <0xf0930000 0x8c8>;
+      interrupts = <0x0 0x4e 0x0>;
+      usb2-lpm-disable;
+      usb3-lpm-capable;
+    };
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
