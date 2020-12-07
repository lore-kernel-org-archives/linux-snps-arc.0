Return-Path: <SRS0=A0w3=FL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C00C4361B
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 09:35:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97ABF2311A
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 09:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97ABF2311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MzlhWPvzu+axI1dy/A15aUp0TefjK26pnXVDvprfqq8=; b=DQV+OYV4psf4q8ssKjoWd54je
	8NStADMeyPxBIb6Iiqa6zKz7C/9r9q+MDt5kWSqI4gstDBiIH5Q9ajfpsMFDkhk92gUS/o7cGj/6g
	sQ5lMjRfGpHYGqWCbQwfh31LiVwnuyb2ybAYXystFqJneH/rP7n2+ewV3JbMkouHQfY9XgosSk04N
	EzqsiskDJ+VGRzq1FTvnrrNaYnxgehFIBGYTrwUwz25+9uVUTkC5DqYPBQFnXJ9nEvxos7aG7ZT0T
	jfkt7puyDyIxV6BkK1FpCOWDpBuL6xR8VcPix7I2N+f13NYgejPzjfcIhcLRT+UuwEWjMfydzAAxt
	N384X7tKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmCva-0005Ug-DE; Mon, 07 Dec 2020 09:35:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmCvN-0005Px-BG; Mon, 07 Dec 2020 09:35:19 +0000
X-UUID: a573ff0baf2d4425b59a2878985ea12e-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PzXAt74ogdSVvHGMlNFXOX2qEwkVCLrOs16Lzlq64es=; 
 b=OV3sIbBr1/oGinAkIaXn9mQPEugTeqY4fbZ0B4iEDJ35M5ukreEfI+9XMt/F8oMQ3oSb2HYGffDGqAszfifoIjtQhkxXBSBQQqzN3KlxtwJ1sImYxj3BbS8gyVDgaf+UopVbr8n48KnUjkrKRHtF1SEKwTg+WKvQEZrsliu+C+s=;
X-UUID: a573ff0baf2d4425b59a2878985ea12e-20201207
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2143493230; Mon, 07 Dec 2020 01:35:13 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 01:35:11 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Dec 2020 17:35:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Dec 2020 17:35:05 +0800
Message-ID: <1607333707.18575.4.camel@mhfsdcap03>
Subject: Re: [PATCH v5 10/19] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Mon, 7 Dec 2020 17:35:07 +0800
In-Reply-To: <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AEB5FF3D303205152315F12801E2B2247DEE288D20E6EED68AE982586109AE1D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_043517_613448_487B5154 
X-CRM114-Status: GOOD (  24.17  )
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
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
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
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note 1. we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
> 
> Note 2. The clock-related properties are marked as optional to match the
> DWC USB3 driver expectation and to improve the bindings mainainability
> so in case if there is a glue-node it would the responsible for the
> clocks initialization.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' from the descriptions, since we don't need to preserve
>   the text formatting in any of them.
> - Drop quotes from around the string constants.
> - Fix the "clock-names" prop description to be referring the enumerated
>   clock-names instead of the ones from the Databook.
> 
> Changelog v3:
> - Apply usb-xhci.yaml# schema only if the controller is supposed to work
>   as either host or otg.
> 
> Changelog v4:
> - Apply usb-drd.yaml schema first. If the controller is configured
>   to work in a gadget mode only, then apply the usb.yaml schema too,
>   otherwise apply the usb-xhci.yaml schema.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more
>   time.
> 
> Changelog v5:
> - Add "snps,dis-split-quirk" property to the DWC USB3 DT schema.
> - Add a commit log text about the clock-related property changes.
> - Make sure dr_mode exist to apply the USB-gadget-only schema.
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 128 -------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 312 ++++++++++++++++++
>  2 files changed, 312 insertions(+), 128 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> deleted file mode 100644
> index 1aae2b6160c1..000000000000
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -synopsys DWC3 CORE
> -
[...]
> +
> +  clock-names:
> +    contains:
> +      anyOf:
> +        - enum: [bus_early, ref, suspend]
> +        - true
> +
> +  usb-phy:
> +   minItems: 1
indentation: expected 4
> +   items:
> +     - description: USB2/HS PHY
> +     - description: USB3/SS PHY
> +
> +  phys:
> +    minItems: 1
> +    items:
> +      - description: USB2/HS PHY
> +      - description: USB3/SS PHY
> +
> +  phy-names:
> +    minItems: 1
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
[...]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
