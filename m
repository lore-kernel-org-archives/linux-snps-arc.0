Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6B4C388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 15:40:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270EF22247
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 15:40:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hAw0MlvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270EF22247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QjQHE7L4b/Wq5syvp+y2960a/f4G4rTy3Z7zheiH9L4=; b=hAw0MlvNanb1ABRW2GCtAcuW3
	nzip3UKUBYkDVRLESA/NMZ3mLpeLWgjZHUd7q2Za6QBAWhx2Fjl91WnVmv0g9bQQFQrcSQMGR9bHB
	Y/9RtCczKeKDtYOHfZ/gzwcLyr52WR8HU4mNfk+3stq3iSN+5Qtz5txUP/pwtPZ5qpZh8hJguQ7X7
	zT+3cIbqWCzReJeCqlvLw9+LF+fqeFokmQNb1fDyg1fE5RoHb/sHjNFfFyYmvBdLnSvSyTA47aDVy
	X/lSzSMRHV7zZsmtrYkHwOdV9WUsY0IHjGtjdOFbdsb3gX+PkpVRnshtlUOCscR/cXBrCweCMTBDk
	+lnpFO9Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUtkv-000098-6B; Tue, 20 Oct 2020 15:40:57 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtkt-000089-7L; Tue, 20 Oct 2020 15:40:56 +0000
Received: by mail-ot1-f68.google.com with SMTP id n15so2092658otl.8;
 Tue, 20 Oct 2020 08:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bPJ41BbXrVBpKagW0AFLuDG820FKrJowO4JL4r2A7Mg=;
 b=EYc976kvHo38lBbDGNCT1IwFHqacC9zbEpvgzvckd9aL6rdMd/HvEmD1rDBvEbE7Vc
 YA6IHr7u+bPpTxrBeSZa/izztbm7b+Wkyrx9/YZIckyJ4y0BBUq842kbQKub+2eqgxnc
 Hx4kShAZPEd5ECRbe2OYGItDwpbwOawh8I78SRmPYnBuZdRSZpLXiLi58UlH+Psckaih
 OnNDtUBofQ3kL2NTXDM/KYI+rs0N0RLQR7V4t/DCHzxsDWHJlbEe1T2e+gw2DqPyF/uh
 Qjo9BzZdWvewIySRl/2QHfbfJC+ma3zJW5jAYfRuITtYo2EvX7xqtTOT26FiaYZzzdhH
 IC1A==
X-Gm-Message-State: AOAM5304OG08ExpNfs7xB3a590n6lP+liHVB4SDIr7BVY0Oo+nVLv2zB
 M9g8GLdxJyoWWyO+oRuEj9ihjh7ZsA==
X-Google-Smtp-Source: ABdhPJxaxCIP6Kd2pnNLtDOo2/dAgOtLCptI3qgvO+i9WOyGybYr0U/8yYzB9sCXkm1PHVRrZpc3zw==
X-Received: by 2002:a9d:6:: with SMTP id 6mr1983535ota.235.1603208454213;
 Tue, 20 Oct 2020 08:40:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i14sm515801ota.59.2020.10.20.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:40:53 -0700 (PDT)
Received: (nullmailer pid 889399 invoked by uid 1000);
 Tue, 20 Oct 2020 15:40:52 -0000
Date: Tue, 20 Oct 2020 10:40:52 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 09/16] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201020154052.GA889228@bogus>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020112101.19077-10-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_114055_271754_E35DF459 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 14:20:54 +0300, Serge Semin wrote:
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
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 302 ++++++++++++++++++
>  2 files changed, 302 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
