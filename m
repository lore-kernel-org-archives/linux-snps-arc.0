Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFFCC433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:54:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA868212CC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vuMIKaLN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA868212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HYG/hDTASopnCZ0L13l5eQwHt9PNq2B+qdcTKoqHLH0=; b=vuMIKaLNeu+uAKkSDT4sZoZza
	lTDRKidtbrez6tYYBbY3rktbEOxAVtzDXq7omMuv9AIDgKgvKF/IU2geZcxS07uedb18PZhH1r9DP
	Yz3yD1qWo5xMlMmhNC/f0veXD/PebyW3Jg6U5ghBSnJH83hhN6zIs79SxXcjHExTMZWfEE07IXRdL
	B4Z6hUBmOifmVNZuYAgC4lb+5i+ft/c5gl3s7twoyVtX3fqFEdJ+vlOFEA1dvw4/nDHi//1nbyxUO
	w8FxiJeIO7+bojKAQVsYxqZ7fS8/oTv+08FYtXX7HQWqQTfJmPGveBI3gKe/RSRrG+IqTV74ommHi
	Ad/GAujng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUri-0001hj-Tg; Fri, 16 Oct 2020 18:54:10 +0000
Received: from mail-oo1-f68.google.com ([209.85.161.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUrb-0001dt-P5; Fri, 16 Oct 2020 18:54:08 +0000
Received: by mail-oo1-f68.google.com with SMTP id c25so847935ooe.13;
 Fri, 16 Oct 2020 11:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2SJo91FUryiudrvp7hFXXd3itA6M64t3t+PTG337Wos=;
 b=bzcY8hTSL9Q7rmfa1Ir7wtuibCt5ILfemNu52rSVkC8Dl/wDFZDKlYsc7Dvp+2zMtn
 +sJ6DBblTja5LhpDRCGERI6Y4w/s3GnOL98gyYVW2HCfAsJqHmsM3tZ6nG8OL0q9p4Hi
 2xjLzBIYRpbH2mwbPCXkBgIAoKknKh6E2ye0+8PnEZn3IhRabTNSM1Si++QtYfnGVWKR
 Cp3TUrPlxutRhiQ6s8slzozzCA4xZAyqQFBXLE7QGgZWHkwuUg2TC9mZ+rcYwEVRL9qV
 VwCzrVrwM8oCZWzzXSQKjzT8adrvwh+nc3eQS6qwdNFw5iUVLkgtWCV2KV3OCBsdrqGq
 xHTg==
X-Gm-Message-State: AOAM530721MYS0+YHXsZqZqqw97A9IHp2IJlQcHQHAvlNaN6Dn5s1rSh
 i2bToPCcP0TSP2gGGvqSgA==
X-Google-Smtp-Source: ABdhPJxqrZ90dBQRwNY763mNG9iHYX8vq1NLO807gpJ9dzO8ZYI7ue+E+B9W403xLk4jO317PbFvMA==
X-Received: by 2002:a4a:be14:: with SMTP id l20mr3781334oop.27.1602874443081; 
 Fri, 16 Oct 2020 11:54:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k6sm1204239otp.33.2020.10.16.11.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:54:02 -0700 (PDT)
Received: (nullmailer pid 1739020 invoked by uid 1000);
 Fri, 16 Oct 2020 18:54:01 -0000
Date: Fri, 16 Oct 2020 13:54:01 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 12/20] dt-bindings: usb: dwc3: Add Tx De-emphasis
 restrictions
Message-ID: <20201016185401.GA1738966@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-13-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145403_867002_35AC4AA5 
X-CRM114-Status: GOOD (  11.81  )
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
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, 14 Oct 2020 13:13:54 +0300, Serge Semin wrote:
> In accordance with the driver comments the PIPE3 de-emphasis can be tuned
> to be either -6dB, -2.5dB or disabled. Let's add the de-emphasis
> property restriction so the DT schema would make sure the controller DT
> node is equipped with correct value.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/tunned/tuned"
> - Grammar fix: remove redundant "or" conjunction.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
