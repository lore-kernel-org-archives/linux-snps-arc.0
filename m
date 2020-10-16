Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37630C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B03F420FC3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CO09czG6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B03F420FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hPpNv/kXwM98jwdlm4CuTLyjrwGkb00YKl4np0R/gGQ=; b=CO09czG6jsxEUDQUf5Joz1iXV
	d2kBt7S4eHNZw/NB6K37/++JZp3aGaIZIme/7AJF8SLPmFwO8LLN2/Ys2ECmThlop5i4ah3sMaBN1
	MvmZCWmnaVp8DdDvrFPl3dBhHN36B0iy+kd53yvDqHiPXngLvM1tGcO5ogWVjCkX7fxYJv2/XmFP9
	i4SQIFBaGVRcF24nXUE4sSFgVRP88RWlP2CtKNGmBUYmyHlifIR0ZEQ1B4awq0h7Zb/oUHb2lcwvQ
	1IE67nz6g1nnRg+Wk+mOV0Qkpy3nDg/jQ2MxkzehU0F+gmw0zeC3O6dG8DaJutARC2HJxpxHneJEe
	MMELIlpdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUsh-00025b-A9; Fri, 16 Oct 2020 18:55:11 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUsN-0001uQ-4U; Fri, 16 Oct 2020 18:54:52 +0000
Received: by mail-oi1-f194.google.com with SMTP id l85so3534674oih.10;
 Fri, 16 Oct 2020 11:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zvMrptKy4dN1SB2yXfhRT5/2zicQozsWBFp3boC0/4A=;
 b=NCJ1HjLbIq+ImFcu46eySKwJUrMgHVmFqLLvMUSg+trmjdcC/xgGr+Crzd7xWY2Kbh
 psaglTPEuAbIAbRMWgy5jjT+wXzZitVbubTYr4vhLtOgxrnCtHg2hYwsFpKbrkTW+h2h
 ERgdSvseW57I4+pQxcP01bbfrEIv6lJuuja/i1H+Uh5MXiUFRmG/ZgyOsS10zDNK8/sG
 YQRl9f1VPUrUB6hXr2gZ7FZPs+HzYZyL9OKkQoFjWC1iahod4G+wByOE5UB1Pb09rL4C
 V2qCcE5XUFvw1QFthVXFc2AEgrItp7nWpg9uCh6Ct3Pe/tmmYy3hkI4annt2Cu5wPpnO
 VYvg==
X-Gm-Message-State: AOAM533rEylJKd08V6XsdwQYpvsI1NEPF8qs86LeXdWJZUcOvmgcIFuo
 vSaiTiHy72xRWWaZo8p8vg==
X-Google-Smtp-Source: ABdhPJwQ5SzIeBajSNHp8WX+Z/226S6zLuIqiQtpDekHPyQyGxK5/tr2qhLgDAShhSioe6Tiyt355Q==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr3181413oif.133.1602874484098; 
 Fri, 16 Oct 2020 11:54:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a82sm1232617oii.44.2020.10.16.11.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:54:43 -0700 (PDT)
Received: (nullmailer pid 1740107 invoked by uid 1000);
 Fri, 16 Oct 2020 18:54:42 -0000
Date: Fri, 16 Oct 2020 13:54:42 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 14/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj
 property value
Message-ID: <20201016185442.GA1740059@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145451_213302_CC53E66C 
X-CRM114-Status: GOOD (  14.20  )
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
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 13:13:56 +0300, Serge Semin wrote:
> An empty snps,quirk-frame-length-adjustment won't cause any change
> performed by the driver. Moreover the DT schema validation will fail,
> since it expects the property being assigned with some value. So set
> fix the example by setting a valid FL-adj value in accordance with
> Neil Armstrong comment.
> 
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> ---
> 
> Note the same problem is in the DT source file
> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
