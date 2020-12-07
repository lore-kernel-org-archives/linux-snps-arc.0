Return-Path: <SRS0=A0w3=FL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D47C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 07:45:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0562220B
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 07:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0562220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ByIEuP0URppaHU0mgom0EVigFoJabd9ikzBCRAwJaHY=; b=Az5VK0Dl/5hNkTwJev+Ltik44
	bXn+mHCx8tVMslJK0L8DKjIvE8Yd21r3NhRN9lC1CqtOlZYxhZ2MA36zW9J8kIlDqWgFXJZai2TGx
	wkXsxCPSkYvqh8vk9dLYnr+ckU+/nVI2fbu72kpbMg9jiaE5VNYemeKoq6FNudWk4Z97IprTSTUY5
	+Y/WCdylCqMvsDQKaypQQILUMkNnuJSa/2I7YXwkU3ll/Fa1oUGr8wpuR2BO+9oemvWCnZZTWyXiB
	vbhchlcDzNjvQhCQ7mobdU+V2OE8NM5mIhY8nB5z8rFpX43o8zX8P0e++oYwxZsxAvr4oxTiTCmv8
	T/yj2bIKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmBDB-0005wv-Vz; Mon, 07 Dec 2020 07:45:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmBD6-0005v7-AE; Mon, 07 Dec 2020 07:45:29 +0000
X-UUID: 531a13df5bf84d51ad041a8f08d86bf6-20201206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=snAHE106/hjF33jpWEXGMfG7MfPrCdexgpD0tr8W/SQ=; 
 b=QJLmRxFl5gLWs9XmtFKh/y8x7QSwBisBpGue0nA1RpKkBtcAoT4Zqb/XVXyklQjGekWHqABtwxMsLAtz8Nfw68MIJk0L6k7wDV2bKgTahvvrT9S/ST9Ln4/tTFFtCdxiCLmMkdyAHslxGJJg+ZsRwqsZWeZEKz7xyth3Xz9YtHo=;
X-UUID: 531a13df5bf84d51ad041a8f08d86bf6-20201206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 585881044; Sun, 06 Dec 2020 23:45:16 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Dec 2020 23:37:33 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Dec 2020 15:37:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Dec 2020 15:37:27 +0800
Message-ID: <1607326648.18575.1.camel@mhfsdcap03>
Subject: Re: [PATCH v5 02/19] dt-bindings: usb: Convert generic USB
 properties to DT schemas
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Mon, 7 Dec 2020 15:37:28 +0800
In-Reply-To: <20201205152427.29537-3-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-3-Sergey.Semin@baikalelectronics.ru>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3B289835ADF57348A25DA89E25AF73D6C01E6B8DFB1D51B22FB40FCB875FB5BF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_024528_917400_93B7E63A 
X-CRM114-Status: GOOD (  33.72  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, 2020-12-05 at 18:24 +0300, Serge Semin wrote:
> The generic USB properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert its content into the generic USB, USB HCD and USB DRD DT
> schemas. So the Generic USB schema will be applicable to all USB
> controllers, USB HCD - for the generic USB Host controllers and the USB
> DRD - for the USB Dual-role controllers.
> 
> Note the USB DRD schema is supposed to work in conjunction with
> the USB peripheral/gadget and USB host controllers DT schemas.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changelog v2:
> - Discard '|' in all the new properties, since we don't need to preserve
>   the text formatting.
> - Convert abbreviated form of the "maximum-speed" enum restriction into
>   the multi-lined version of the list.
> - Drop quotes from around the string constants.
> 
> Changelog v4:
> - Redistribute the properties between generic ones, USB HCD-specific and
>   USB DRD-specific.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more time.
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 --------------
>  .../devicetree/bindings/usb/usb-drd.yaml      | 77 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  5 ++
>  .../devicetree/bindings/usb/usb.yaml          | 22 ++++++
>  4 files changed, 104 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> deleted file mode 100644
> index ba472e7aefc9..000000000000
> --- a/Documentation/devicetree/bindings/usb/generic.txt
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Generic USB Properties
> -
> -Optional properties:
> - - maximum-speed: tells USB controllers we want to work up to a certain
> -			speed. Valid arguments are "super-speed-plus",
> -			"super-speed", "high-speed", "full-speed" and
> -			"low-speed". In case this isn't passed via DT, USB
> -			controllers should default to their maximum HW
> -			capability.
> - - dr_mode: tells Dual-Role USB controllers that we want to work on a
> -			particular mode. Valid arguments are "host",
> -			"peripheral" and "otg". In case this attribute isn't
> -			passed via DT, USB DRD controllers should default to
> -			OTG.
> - - phy_type: tells USB controllers that we want to configure the core to support
> -			a UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is
> -			selected. Valid arguments are "utmi" and "utmi_wide".
> -			In case this isn't passed via DT, USB controllers should
> -			default to HW capability.
> - - otg-rev: tells usb driver the release number of the OTG and EH supplement
> -			with which the device and its descriptors are compliant,
> -			in binary-coded decimal (i.e. 2.0 is 0200H). This
> -			property is used if any real OTG features(HNP/SRP/ADP)
> -			is enabled, if ADP is required, otg-rev should be
> -			0x0200 or above.
> - - companion: phandle of a companion
> - - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
> -			is the basic function of real OTG except you want it
> -			to be a srp-capable only B device.
> - - srp-disable: tells OTG controllers we want to disable OTG SRP, SRP is
> -			optional for OTG device.
> - - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> -			optional for OTG device.
> - - usb-role-switch: boolean, indicates that the device is capable of assigning
> -			the USB data role (USB host or USB device) for a given
> -			USB connector, such as Type-C, Type-B(micro).
> -			see connector/usb-connector.yaml.
> - - role-switch-default-mode: indicating if usb-role-switch is enabled, the
> -			device default operation mode of controller while usb
> -			role is USB_ROLE_NONE. Valid arguments are "host" and
> -			"peripheral". Defaults to "peripheral" if not
> -			specified.
> -
> -
> -This is an attribute to a USB controller such as:
> -
> -dwc3@4a030000 {
> -	compatible = "synopsys,dwc3";
> -	reg = <0x4a030000 0xcfff>;
> -	interrupts = <0 92 4>
> -	usb-phy = <&usb2_phy>, <&usb3,phy>;
> -	maximum-speed = "super-speed";
> -	dr_mode = "otg";
> -	phy_type = "utmi_wide";
> -	otg-rev = <0x0200>;
> -	adp-disable;
> -};
> diff --git a/Documentation/devicetree/bindings/usb/usb-drd.yaml b/Documentation/devicetree/bindings/usb/usb-drd.yaml
> new file mode 100644
> index 000000000000..f3a64c46dcd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb-drd.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb-drd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic USB OTG Controller Device Tree Bindings
> +
> +maintainers:
> +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +
> +properties:
> +  otg-rev:
> +    description:
> +      Tells usb driver the release number of the OTG and EH supplement with
> +      which the device and its descriptors are compliant, in binary-coded
> +      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
> +      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
> +      0x0200 or above.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  dr_mode:
> +    description:
> +      Tells Dual-Role USB controllers that we want to work on a particular
> +      mode. In case this attribute isn't passed via DT, USB DRD controllers
> +      should default to OTG.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [host, peripheral, otg]
> +
> +  hnp-disable:
> +    description:
> +      Tells OTG controllers we want to disable OTG HNP. Normally HNP is the
> +      basic function of real OTG except you want it to be a srp-capable only B
> +      device.
> +    type: boolean
> +
> +  srp-disable:
> +    description:
> +      Tells OTG controllers we want to disable OTG SRP. SRP is optional for OTG
> +      device.
> +    type: boolean
> +
> +  adp-disable:
> +    description:
> +      Tells OTG controllers we want to disable OTG ADP. ADP is optional for OTG
> +      device.
> +    type: boolean
> +
> +  usb-role-switch:
> +    description:
> +      Indicates that the device is capable of assigning the USB data role
> +      (USB host or USB device) for a given USB connector, such as Type-C,
> +      Type-B(micro). See connector/usb-connector.yaml.
> +
> +  role-switch-default-mode:
> +    description:
> +      Indicates if usb-role-switch is enabled, the device default operation
> +      mode of controller while usb role is USB_ROLE_NONE.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [host, peripheral]
> +    default: peripheral
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    usb@4a030000 {
> +        compatible = "snps,dwc3";
> +        reg = <0x4a030000 0xcfff>;
> +        interrupts = <0 92 4>;
> +        usb-phy = <&usb2_phy>, <&usb3_phy>;
> +        maximum-speed = "super-speed";
> +        dr_mode = "otg";
> +        phy_type = "utmi_wide";
> +        otg-rev = <0x0200>;
> +        adp-disable;
> +    };
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 81f3ad1419d8..52cc84c400c0 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -12,6 +12,11 @@ maintainers:
>  allOf:
>    - $ref: usb.yaml#
>  
> +properties:
> +  companion:
> +    description: Phandle of a companion device
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>  additionalProperties: true
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
> index 941ad59fbac5..991c02725e2b 100644
> --- a/Documentation/devicetree/bindings/usb/usb.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb.yaml
> @@ -24,6 +24,28 @@ properties:
>      description:
>        Name specifier for the USB PHY
>  
> +  phy_type:
> +    description:
> +      Tells USB controllers that we want to configure the core to support a
> +      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected. In case
> +      this isn't passed via DT, USB controllers should default to HW
> +      capability.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [utmi, utmi_wide]
> +
> +  maximum-speed:
> +   description:
indent: two blank space, like v4

> +     Tells USB controllers we want to work up to a certain speed. In case this
> +     isn't passed via DT, USB controllers should default to their maximum HW
> +     capability.
> +   $ref: /schemas/types.yaml#/definitions/string
> +   enum:
> +     - low-speed
> +     - full-speed
> +     - high-speed
> +     - super-speed
> +     - super-speed-plus
> +
>  additionalProperties: true
>  
>  ...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
