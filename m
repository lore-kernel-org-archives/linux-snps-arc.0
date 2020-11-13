Return-Path: <SRS0=Jm8S=ET=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F0EC388F9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Nov 2020 06:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0A12078B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Nov 2020 06:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l7zTelOL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RiYT6Erx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0A12078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2CWvejYPLibUGAKgpRxD45l4nibtdmQvw6gL9SyryIY=; b=l7zTelOLgko9WMPPxD115oONJ
	YlnTJzGMj0ltg89Znpqhzpa/7cpeBxUhUAZdbaKOT4NC/6ZKEeozSvi51cGTx2JHd5TMEj4TeXzo+
	52L7Xt7hzchXoVYvN1nBrLKNQlLfKKcVJrCLSee0qeCkHuxdaZ49kw8vEdorejL67xD2CrjZ3pyG8
	Bxhjzms8m6WuTf18y8ygMfAuMH6cSQ8qhoaBTBg5Oxb9+xRbXHCBfdh1I9f65ptICMYIS0g7IIa9X
	PAwMQ4Oo1tV2V3fbui3fIv0Hra28PTyxD1eSVTkeFou2qSea4fEPTZ803OfFnlplGGIgVtA/N36CP
	QGnBjgX7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdSCK-0007WS-CW; Fri, 13 Nov 2020 06:04:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdSCF-0007Vj-M5; Fri, 13 Nov 2020 06:04:33 +0000
X-UUID: 7135201b33484d7abca788e6f1e5cbc4-20201112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ir233lDJkicbZtH4igG3ioOgvXcy46PlSo6Vzwnmbug=; 
 b=RiYT6ErxaVwinryGNxuPlkJJNWCeBzyUiGNM3wgDEQjQc4ncQnqf2fumKrcqZzoUTLvTNFqoSXJKITpxewUIq4mzTt5J8hRWxJIPYtwPhwJxPD5DvSfb1w0YtrLXz+bSsqBg2jwWxc0f2MEUgKIHubTLDftfQ6oW3XnmMYS/OOI=;
X-UUID: 7135201b33484d7abca788e6f1e5cbc4-20201112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1376257542; Thu, 12 Nov 2020 22:04:26 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 22:04:24 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Nov 2020 14:04:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Nov 2020 14:04:19 +0800
Message-ID: <1605247459.31607.23.camel@mhfsdcap03>
Subject: Re: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date: Fri, 13 Nov 2020 14:04:19 +0800
In-Reply-To: <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35256F855D28B8E9938E1E871FD37442AB0633F28C0BB20F747BFD0A0256B7812000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_010432_475751_960906A0 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, 2020-11-11 at 12:08 +0300, Serge Semin wrote:
> There can be three distinctive types of the USB controllers: USB hosts,
> USB peripherals/gadgets and USB OTG, which can switch from one role to
> another. In order to have that hierarchy handled in the DT binding files,
> we need to collect common properties in a common DT schema and specific
> properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> dedicated for the USB host controllers only, let's move some common
> properties from there into the usb.yaml schema. So the later would be
> available to evaluate all currently supported types of the USB
> controllers.
> 
> While at it add an explicit "additionalProperties: true" into the
> usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> properties is going to be get mandatory soon.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created as a result of the comment left
>   by Chunfeng Yun in v3
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 7263b7f2b510..81f3ad1419d8 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -9,18 +9,10 @@ title: Generic USB Host Controller Device Tree Bindings
>  maintainers:
>    - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  
> -properties:
> -  $nodename:
> -    pattern: "^usb(@.*)?"
> +allOf:
> +  - $ref: usb.yaml#
>  
> -  phys:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    description:
> -      List of all the USB PHYs on this HCD
> -
> -  phy-names:
> -    description:
> -      Name specifier for the USB PHY
> +additionalProperties: true
This seems already added by the applied patch 6a0e321ea735 "dt-bindings:
Explicitly allow additional properties in common schemas"

>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
> new file mode 100644
> index 000000000000..941ad59fbac5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +
> +select: false
> +
> +properties:
> +  $nodename:
> +    pattern: "^usb(@.*)?"
> +
> +  phys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      List of all the USB PHYs on this HCD
> +
> +  phy-names:
> +    description:
> +      Name specifier for the USB PHY
> +
> +additionalProperties: true
> +
> +...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
