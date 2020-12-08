Return-Path: <SRS0=HtfL=FM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DD4C433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Dec 2020 15:21:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 347A723A7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Dec 2020 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 347A723A7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d9cza106ruUzUQ3qQxGftCrgXD0WKif6UXdlBcTzWeQ=; b=iK7YgqIlYWAomtstKjh/FPxEQ
	x5cWpydD5boeX76sC/K567USn1P7Rjs3N5LNlQCUxfm+h1L0JzkioLiJVHcsnliXfxuvVHqMPoP3z
	8ffBWO+swY/U4uLlEfMqavz0YgQJ1dtF5y2uLPwDxA7on/Sa+c8/CZz+cJ4GS9L1W6PNsJ1HFSPvY
	zmX+9ukbPEKXVl4qwpLO+s/SB3kQ0FjKflCgzKd9gvponFYhVot8TpWYkKZc3OgWtyak/JM5rJ5za
	RORwsraYoWCBVCDJmQ2AzfdhHD64CmESyq1W7p2CFook7mP68bvbb84j3F3yZgtZSRMQOevvgcpdR
	Bfj5rbqow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmeo3-0004HJ-At; Tue, 08 Dec 2020 15:21:35 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmenw-0004FJ-M4; Tue, 08 Dec 2020 15:21:29 +0000
Received: by mail-ot1-f66.google.com with SMTP id o11so13409060ote.4;
 Tue, 08 Dec 2020 07:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IQ3hrRr5CR/EHc+P2sk3O7yO90fJ2PV9jiKrnTl/JOE=;
 b=cED9qvzqCuyeVl946Z1E/oWm6c568GLeh8RSfdu0bNm4nvr+XZKdCz3Z8pqhN7vM6f
 N0FZ5EJX6LG3Su8c+3KXNZefvclQcEqDLgJgZPzM5LrjzF4uthF8ZOzGRvCWzF6qBG+J
 HTKvqoCCKVk02AEufF+K43Vcld4Rdpmih03i3qYwLZOUMljsuli8zCMXWi/VIkiFqxYe
 hYaK1GWQCG4ZWS9eDn2GNzFoADLmR8AKS/wZr6WNjhpIrjyJCiQ0rUgMysZlYmSnoFyM
 7OlYeAW6PAiuDy6F04XA+UZdm/jiOrNPrc/6mHA6yiKSs0TUjIcJs9V2Qzkw/OMwUXna
 gdtg==
X-Gm-Message-State: AOAM532WFg68A3p/VokKitjLINpqmugddhWlqkdMVCxY+ChLXcvJ2qdn
 7qjjC3TzCvPcenMC1gnVDQ==
X-Google-Smtp-Source: ABdhPJzmCHNnVAHVBS3T6eGsSQKp+szBNnE+KgDyZOtKt+lyLKF1btlAQoWaO2PnCHLoZUrZlxBiKg==
X-Received: by 2002:a05:6830:1352:: with SMTP id
 r18mr16663484otq.73.1607440887454; 
 Tue, 08 Dec 2020 07:21:27 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u130sm3717886oib.53.2020.12.08.07.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 07:21:25 -0800 (PST)
Received: (nullmailer pid 2539592 invoked by uid 1000);
 Tue, 08 Dec 2020 15:21:23 -0000
Date: Tue, 8 Dec 2020 09:21:23 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 10/19] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201208152123.GA2539227@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-11-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_102128_739571_256C218C 
X-CRM114-Status: GOOD (  22.08  )
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
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, 05 Dec 2020 18:24:17 +0300, Serge Semin wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
