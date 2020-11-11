Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59079C56201
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:22:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01BC2067D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DiTmrdn3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01BC2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2TvbmUFkhiB2nsbjT1EtEcFkhW6b1tsxpVY3bL7CEzA=; b=DiTmrdn3aTB6iLR1hrqxr2wPh
	9ei+3AtPhq5xv4Fr2XDkZ+vX2vYYCZ5UYZnpCjnseebz2Ti5ieWz/l0bUkx5AN45jc4HCydsF9sby
	4afmfA1holIm4a8YztSKTNb3XC8FzWdHTGd7vSKkb4nmMMkhm99nsKZEtZbGc3AaS4Z427ia29aCj
	xEhatZTyn5CPfCoZBwK+d6Yji+IZOP2AOdLBVOfS5tsxlHvWBEN4zv6/htXmoLp/2Gfzd6j2foVn/
	fQTtnwkLzMN0yCYQL5YD9XoXjs0y3Fe8lpjQmtwIzYOh+gcc9zK/XKpodZtmeBEBi0gAPCl7ttO0L
	gqfXhH37g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmKP-0002ns-Pb; Wed, 11 Nov 2020 09:22:09 +0000
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmEz-00008B-Td; Wed, 11 Nov 2020 09:16:39 +0000
Received: by mail-ej1-f65.google.com with SMTP id me8so1748136ejb.10;
 Wed, 11 Nov 2020 01:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5GcEmhwwM9IRtfJDyYsg4AcdXZ2r4D6ZuT6XDfsXG3U=;
 b=AIrzXEH/6qzG8sO5HWUXrTMytNt9jynB78wdza9iOf/bm+yMmel+3oE9qzprl/wK+a
 PLbNoeDEGmapyA+02H3TKckLs/CqS5GyUbTn6kfNaPjpiDhoVFtf+0WOZ9Eq48j59zh+
 bky6aZbuYdMMvNQFd/LonYiE31kO/XUapwDFsweWxceiag5s2fzyKpKbOkMZ4wGJx/GQ
 H5M4n1iUeKMaeaMvm4PbWNOmVPMzP5rL0PmK3HUaWCPeBrTry91zfX8FfcC0CkO7uoLP
 cOkcnVt6vA9J6N6FSLvqqCE+tPZK+ggYj1ZbA+lF/xH3N4UKWMfOsFUW/PNrboRsdeJw
 UUTg==
X-Gm-Message-State: AOAM532Q527N5pENijceEbHvf0ywiPEMbqsUwwI8xKyGGBnmOw/AbUcl
 qkUk44TDpa5mk/LSw3KbFy8=
X-Google-Smtp-Source: ABdhPJwnk3jD93uxeY/uvOhBZvJMTv9+ToMcbWATfaaN/gyNNy295JDWNoeMCMqf8CBghVZn1l5k+Q==
X-Received: by 2002:a17:906:7a11:: with SMTP id
 d17mr20705465ejo.153.1605086190784; 
 Wed, 11 Nov 2020 01:16:30 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id nd5sm597535ejb.37.2020.11.11.01.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:16:29 -0800 (PST)
Date: Wed, 11 Nov 2020 10:16:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201111091628.GC4050@kozik-lap>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_041634_118154_810F9F06 
X-CRM114-Status: GOOD (  26.43  )
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
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-snps-arc@lists.infradead.org,
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

On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
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
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
>  2 files changed, 303 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> deleted file mode 100644
> index d03edf9d3935..000000000000
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -synopsys DWC3 CORE
> -
> -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> -      as described in 'usb/generic.txt'
> -
> -Required properties:
> - - compatible: must be "snps,dwc3"
> - - reg : Address and length of the register set for the device
> - - interrupts: Interrupts used by the dwc3 controller.
> - - clock-names: list of clock names. Ideally should be "ref",
> -                "bus_early", "suspend" but may be less or more.
> - - clocks: list of phandle and clock specifier pairs corresponding to
> -           entries in the clock-names property.
> -
> -Exception for clocks:
> -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> -  one of the following:
> -    "cavium,octeon-7130-usb-uctl"
> -    "qcom,dwc3"
> -    "samsung,exynos5250-dwusb3"
> -    "samsung,exynos5433-dwusb3"
> -    "samsung,exynos7-dwusb3"
> -    "sprd,sc9860-dwc3"
> -    "st,stih407-dwc3"
> -    "ti,am437x-dwc3"
> -    "ti,dwc3"
> -    "ti,keystone-dwc3"
> -    "rockchip,rk3399-dwc3"
> -    "xlnx,zynqmp-dwc3"

What happened with this part of dtschema? It sees you removed it.

Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
