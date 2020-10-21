Return-Path: <SRS0=wYiN=D4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2825BC388F9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Oct 2020 03:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4B222249
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Oct 2020 03:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6xlR4a6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZI0rmJbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4B222249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OUkCVTyjAJaZPwPzWjLtU7CnhefEsjSPZVU50vrFbnM=; b=T6xlR4a6l4MOgRSO5fGAfaZZl
	Y19muJeWPBoXNv5ZRtELpQVnHelIFWYNRKp2hRoSFdeF+qePg/APYLA42TmjOnGgQyTleI+PBRZ/a
	Th62giPczAY/3rXiRhJewU9JftdjS3WE9Rn9JvDNJ0vE7umy8AIr5NgBGIy5l0/564/KGLL2WNRh0
	J5Vxw1rP/KGS5kHbezGB9JWbq93DzrjYxXlrQcUNkPQ5mkhQBpJRiF54eOEaD25pC4DHHSJm0dlLr
	4l7hc/qi88SmljixvqUrWmMCFF1kxUt5BIqjyKSeg44RT1PogoLdJSkUQt/X+2P8piAYtlbHZZKVL
	HBiQyDrOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV4P0-0006Hr-Bh; Wed, 21 Oct 2020 03:03:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV4Ov-0006GO-CI; Wed, 21 Oct 2020 03:02:59 +0000
X-UUID: 3d380af0c14b418d94bb348ed53d86cc-20201020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/iKtVrC60W8Ht9PLV1xcIWqrBacl7AEML6GCLswWhVg=; 
 b=ZI0rmJbSc502+KEHyzWx3eMLTENriBq/ykEYvKZav8jDLKBM6SetJnci8q3HifMLdM9WSLw2W8dm42i5ZN9cL8415ZAwgrVWfRXF10J1DEpbJcZqVx67Yx8pCmScwmuUsS4qAmChOPnOiN9C2vwwNWFuowhcinzbQ8hBgRqkL8Y=;
X-UUID: 3d380af0c14b418d94bb348ed53d86cc-20201020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 232452330; Tue, 20 Oct 2020 19:02:49 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Oct 2020 20:00:42 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Oct 2020 11:00:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Oct 2020 11:00:36 +0800
Message-ID: <1603249236.31607.9.camel@mhfsdcap03>
Subject: Re: [PATCH v3 01/16] dt-bindings: usb: usb-hcd: Convert generic USB
 properties to DT schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Wed, 21 Oct 2020 11:00:36 +0800
In-Reply-To: <20201020112101.19077-2-Sergey.Semin@baikalelectronics.ru>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-2-Sergey.Semin@baikalelectronics.ru>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3C612C300D75B9D840779466513725D6819DC7FF11D1B86F2C1C754B59618B642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_230257_541453_6602D6D3 
X-CRM114-Status: GOOD (  34.30  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Tue, 2020-10-20 at 14:20 +0300, Serge Semin wrote:
> The generic USB HCD properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert it' content into the USB HCD DT schema properties so all USB DT
          ^ its?
> nodes would be validated to have them properly utilized.
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
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 ------------
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 88 +++++++++++++++++++
Do we need change the file name or modify it's title?
the title is "Generic USB Host Controller Device Tree Bindings", but
some generic properties, such as, dr_mode, usb-role-switch, otg related
ones, are usually used by DRD controller, this may cause some confusion.

>  2 files changed, 88 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
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
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 7263b7f2b510..ee7ea205c71d 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -22,9 +22,97 @@ properties:
>      description:
>        Name specifier for the USB PHY
>  
> +  maximum-speed:
> +   description:
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
> +  dr_mode:
> +    description:
> +      Tells Dual-Role USB controllers that we want to work on a particular
> +      mode. In case this attribute isn't passed via DT, USB DRD controllers
> +      should default to OTG.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [host, peripheral, otg]
> +
> +  phy_type:
> +    description:
> +      Tells USB controllers that we want to configure the core to support a
> +      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected. In case
> +      this isn't passed via DT, USB controllers should default to HW
> +      capability.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [utmi, utmi_wide]
> +
> +  otg-rev:
> +    description:
> +      Tells usb driver the release number of the OTG and EH supplement with
> +      which the device and its descriptors are compliant, in binary-coded
> +      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
> +      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
> +      0x0200 or above.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  companion:
> +    description: Phandle of a companion device
> +    $ref: /schemas/types.yaml#/definitions/phandle
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
>  examples:
>    - |
>      usb {
>          phys = <&usb2_phy1>, <&usb3_phy1>;
>          phy-names = "usb";
>      };
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

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
