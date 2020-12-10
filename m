Return-Path: <SRS0=IY7X=FO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C462C4361B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Dec 2020 09:12:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E4123B99
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Dec 2020 09:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E4123B99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tRAeqqN0TQHemegqry0rN+SGxYzx/xDf/jPOgmA3l9w=; b=FxAuhgjW0oAyL0yeR61VRCAnVj
	wlzUpcAqBBCmsQ1YdNkaQlN0Uy4KZ/hZh5e4nAsGpYa57H1tKkukRozqfawcTkVGnl3YCY2B9nfEV
	KvYvj6cLQ5WQvdRrHtXw7ITuPEDL3t3/g0sZBXqXKR1pOAjFWw9yYT9+DwMcAdAEQM3tanqINx7Ft
	jtQVApsZpIrHMJbwuDB7g90FsO97eC/O17+3l4bimRcJ0K58mE5kxszLp7DwsAPWbKFm6eIBj9fkh
	Xse+NY28CWGkaG8/aBIfYuHoT2RXuEXnxTF5OnREJlPRCbWFsJ2HstlLZ6OphiirftZEk7FmjvvGS
	qbZmHZsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knHzt-0005AV-MP; Thu, 10 Dec 2020 09:12:25 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knHyA-0004VF-0b; Thu, 10 Dec 2020 09:10:44 +0000
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH v6 00/19] dt-bindings: usb: Add generic USB HCD, xHCI,
 DWC USB3 DT schema
Date: Thu, 10 Dec 2020 12:09:24 +0300
Message-ID: <20201210090944.16283-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_041038_461680_306D78B9 
X-CRM114-Status: GOOD (  19.24  )
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

We've performed some work on the Generic USB HCD, xHCI and DWC USB3 DT
bindings in the framework of the Baikal-T1 SoC support integration into
the kernel. This patchset is a result of that work.

First of all we moved the generic USB properties from the legacy text
bindings to the USB DT schema. The properties have been distributed
between three DT schemas dedicated for particular types of USB
controllers: Generic USB controller properties (like node-naming, phys,
maximum-speed, etc), Generic USB Host Controller bindings (companion and
TPL support), Dual-Role USB Controller (OTG revision, DR mode,
HNP/SRP/ADP protocols, etc). So the USB controllers DT bindings from now
can validate the nodes against a generic USB-controller schema suitable
for the controller functionality.

Secondly we converted generic USB xHCI text bindings file into the DT
schema. It had to be split up into two bindings: DT schema with generic
xHCI properties and a generic xHCI device DT schema. The later will be
used to validate the pure xHCI-based nodes, while the former can be
utilized by some vendor-specific versions of xHCI.

Thirdly, what was primarily intended to be done for Baikal-T1 SoC USB we
converted the legacy text-based DWC USB3 bindings to DT schema and altered
the result a bit so it would be more coherent with what actually
controller and its driver support. Since we've now got the DWC USB3 DT
schema, we made it used to validate the sub-nodes of the Qualcom, TI and
Amlogic DWC3 DT nodes.

Link: https://lore.kernel.org/linux-usb/20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Thanks to Sergei Shtylyov for suggesting the commit logs grammar fixes:
  [PATCH 04/18] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic" PHY types
  [PATCH 05/18] dt-bindings: usb: usb-hcd: Add "tpl-support" property
  [PATCH 11/18] dt-bindings: usb: dwc3: Add interrupt-names property support
  [PATCH 13/18] dt-bindings: usb: dwc3: Add Tx De-emphasis restrictions
  [PATCH 17/18] dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
- Set FL-adj of the amlogiv,meson-g12a-usb controller with value 0x20 instead
  of completely removing the property.
- Drop the patch:
  [PATCH 02/18] dt-bindings: usb: usb-hcd: Add "wireless" maximum-speed
                property value
  since "wireless" speed type is depracated due to lack of the device
  supporting it.
- Drop quotes from around the compat string constant.
- Discard '|' from the property descriptions, since we don't need to preserve
  the text formatting.
- Convert abbreviated form of the "maximum-speed" enum constraint into
  the multi-lined version of the list.
- Fix the DW USB3 "clock-names" prop description to be refererring to the
  enumerated clock-names instead of the ones from the Databook.
- Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
  since additionalProperties/unevaluatedProperties are going to be mandary
  for each binding.
- Use "oneOf: [dwc2.yaml#, snps,dwc3.yaml#]" instead of the bulky "if:
  properties: compatibe: ..." statement.
- Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes
  of the Qualcomm DWC3 DT nodes.
- Add new patches:
  [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
  [PATCH 19/20] arch: dts: Fix xHCI DT nodes name
  [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name

Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Drop the patches:
  [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
  [PATCH 19/20] arch: dts: Fix xHCI DT nodes name
  [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
  as they are going to be submitted in the framework of a dedicated patchset.
- Drop the patch:
  [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
  since it's going to be replaced with the driver/dts fixup and moved to a
  dedicated patchset.
- Apply usb-xhci.yaml# schema for the DWC USB3 node only if the controller is
  supposed to work as either host or otg.

Link: https://lore.kernel.org/linux-usb/20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru
Changelog v4:
- Get the patch
  [PATCH 11/17] dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
  back, since we can't discard the deprecated prefix from the driver.
- Discard the block scalar style modifier "|" from the interrupts property
  description.
- Split the generic USB controller properties into three schemas: Generic USB
  controllers, USB Host controllers and USB OTG controllers.

Link: https://lore.kernel.org/linux-usb/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru
Changelog v5:
- Add "snps,dis-split-quirk" property to the DWC USB3 DT schema.
- Add a text to the
  [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to DT schema
  patch log about the small change in the clock-related properties bindings
  with respect to the original binding file.
- Discard duplicated "additionalProperties" from the usb-hcd.yaml schema.
- Make sure dr_mode exist in DW USB3 node to apply the USB-gadget-only schema.
- Add a new patch:
  [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate DWC3 sub-node
  since the Intel Keem Bay DWC3 bindings has been just added.

Link: https://lore.kernel.org/linux-usb/20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru
Changelog v6:
- Fix typo in the commit log:
  [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate DWC3 sub-node
  Qualcomm sub-node should be called as Intel eem Bay sub-node.
- Fix identations in the "usb-phy" property definition.
- Fix identations in the "maximum-speed" property definition.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Roger Quadros <rogerq@ti.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (19):
  dt-bindings: usb: usb-hcd: Detach generic USB controller properties
  dt-bindings: usb: Convert generic USB properties to DT schemas
  dt-bindings: usb: usb-drd: Add "otg-rev" property constraints
  dt-bindings: usb: Add "ulpi/serial/hsic" PHY types
  dt-bindings: usb: usb-hcd: Add "tpl-support" property
  dt-bindings: usb: Add generic "usb-phy" property
  dt-bindings: usb: Convert xHCI bindings to DT schema
  dt-bindings: usb: xhci: Add Broadcom STB v2 compatible device
  dt-bindings: usb: renesas-xhci: Refer to the usb-xhci.yaml file
  dt-bindings: usb: Convert DWC USB3 bindings to DT schema
  dt-bindings: usb: dwc3: Add interrupt-names property support
  dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
  dt-bindings: usb: dwc3: Add Tx De-emphasis constraints
  dt-bindings: usb: dwc3: Add Frame Length Adj constraints
  dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value
  dt-bindings: usb: meson-g12a-usb: Validate DWC2/DWC3 sub-nodes
  dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
  dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
  dt-bindings: usb: intel,keembay-dwc3: Validate DWC3 sub-node

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |   6 +-
 .../devicetree/bindings/usb/dwc3.txt          | 128 -------
 .../devicetree/bindings/usb/generic-xhci.yaml |  65 ++++
 .../devicetree/bindings/usb/generic.txt       |  57 ---
 .../bindings/usb/intel,keembay-dwc3.yaml      |   9 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   9 +-
 .../bindings/usb/renesas,usb-xhci.yaml        |   4 +-
 .../devicetree/bindings/usb/snps,dwc3.yaml    | 332 ++++++++++++++++++
 .../bindings/usb/ti,keystone-dwc3.yaml        |   4 +-
 .../devicetree/bindings/usb/usb-drd.yaml      |  78 ++++
 .../devicetree/bindings/usb/usb-hcd.yaml      |  19 +-
 .../devicetree/bindings/usb/usb-xhci.txt      |  41 ---
 .../devicetree/bindings/usb/usb-xhci.yaml     |  42 +++
 .../devicetree/bindings/usb/usb.yaml          |  60 ++++
 14 files changed, 600 insertions(+), 254 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
 create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml

-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
