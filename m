Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F56BC43457
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:49:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1B76212CC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vURy2niP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1B76212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=was58zvEySL8INTy7hq0Z0UesZhk/xdwSOPKLFDJiLM=; b=vURy2niP0lvVQfFNcvAPz4Z27
	uCay+PEptO88ug5HsBHdeXKa3eLue68P41CcMIuooRqnKhg6rEgVRbBb9HUZGWfPsEnt8mE1MNkh6
	fVrKoE7yX9vBkkqnxLWKq9QoOscNMkoYx7fc8XVfqgVo3ZvGQABggUwY5hCVC/gTYiFlvfsGeLidL
	simtfNYi0CnyShfof5QrFlYJP1xsz4k23+bABHzsLzh1v2NDZIbm1jQ45PUZBBjy0TPVMvQkJnY/A
	FPMGNvshnjWHAlmr1URyxlUeRznX2QqEHr0uKkMQZLp0pr8EnHKZbh33RYPDtF3gJd3TeoW4Ygk+2
	2hMMhgVzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUn8-0000Bp-74; Fri, 16 Oct 2020 18:49:26 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUn5-0000AT-HH; Fri, 16 Oct 2020 18:49:24 +0000
Received: by mail-oi1-f193.google.com with SMTP id l85so3518902oih.10;
 Fri, 16 Oct 2020 11:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3MxugCiE5y0heSpZifDkccjElq8hTuw4iGDrR5HUSmI=;
 b=k6tJukAnPBpFSmDC/N6x3KrLGZcgCn1y7fQYQdEMbdVPqUQNAlfXpaE3NKJEoSww71
 tdkanV2JTECg9SNw6nRh7riw0tat8h4Iwa8w5pK32tTmQqL5wgwbeJrZu36oM628W55i
 Jr59fSIWOv2PpJ82BEQfa8iwpVM1EmqGz6z6S24Zbg/yhVecBjaV/VsFkHUJWys7HQ5M
 VNfcld12OEpJVau8J2gf5/WT+MH3HbNjWVPoenbR7QScnuUFN7k+SNNins0TRilKAHPF
 L/szldhnHOa4VMRXKt2u4e/llW7v8mC0WH2tL9YSiG427sGJM7bcSMv8DFOlNw8vAgHY
 i5nw==
X-Gm-Message-State: AOAM532oyiT9SynpsvOXd1J/KU8l2I1x7+IRUh8pI1jzVDpSV+MHAlLG
 X2yOCqcOsEbWtNYXdvJoBw==
X-Google-Smtp-Source: ABdhPJxhlHWdR759W2/ZwO3kHuI+wtcySV279kCyDwV40mkUK/8z3O06wkP5ssZVrgQY5g1y7yDEXA==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr3170755oif.133.1602874162686; 
 Fri, 16 Oct 2020 11:49:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d11sm1192131otf.44.2020.10.16.11.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:49:22 -0700 (PDT)
Received: (nullmailer pid 1732283 invoked by uid 1000);
 Fri, 16 Oct 2020 18:49:21 -0000
Date: Fri, 16 Oct 2020 13:49:21 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 06/20] dt-bindings: usb: Convert xHCI bindings to DT schema
Message-ID: <20201016184921.GA1732241@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_144923_587830_CBE2F2BF 
X-CRM114-Status: GOOD (  17.36  )
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
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 13:13:48 +0300, Serge Semin wrote:
> Currently the DT bindings of Generic xHCI Controllers are described by means
> of the legacy text file. Since such format is deprecated in favor of the
> DT schema, let's convert the Generic xHCI Controllers bindings file to the
> corresponding yaml files. There will be two of them: a DT schema for the
> xHCI controllers on a generic platform and a DT schema validating a generic
> xHCI controllers properties. The later will be used to validate the xHCI
> controllers, which aside from some vendor-specific features support the
> basic xHCI functionality.
> 
> An xHCI-compatible DT node shall support the standard USB HCD properties
> and custom ones like: usb2-lpm-disable, usb3-lpm-capable,
> quirk-broken-port-ped and imod-interval-ns. In addition if a generic xHCI
> controller is being validated against the DT schema it is also supposed to
> be equipped with mandatory compatible string, single registers range,
> single interrupts source, and is supposed to optionally contain up to two
> reference clocks for the controller core and CSRs.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
>   since additionalProperties/unevaluatedProperties are going to be mandary
>   for each binding.
> ---
>  .../devicetree/bindings/usb/generic-xhci.yaml | 63 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-xhci.txt      | 41 ------------
>  .../devicetree/bindings/usb/usb-xhci.yaml     | 42 +++++++++++++
>  3 files changed, 105 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
