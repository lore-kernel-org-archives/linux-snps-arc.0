Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADDCC43467
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:49:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D62320FC3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Q+4U34I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D62320FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xxm2oSEggJIXOdz+cIq3R0zO5UJAIV9dclmEZpW0Uz0=; b=3Q+4U34IFStcBwFfYUUwvGSPX
	3wX9dFejEu1yfawCV9xAjMWJGI+jaYRiwQN9icKeGEwFd7WzNn1BDK2MYbrTlJ9gUtN3rOVu2ynEi
	PFbyql/ZHwhaFMYZXQCHZdsLuxLjvbZx/QwENkpvyPKJK8NlwdUiDoWpL7z/s3CwSs/bmQ1Ag6/0+
	Qc9h77hpOBhBi/Nj2kdRyUxVU/k6Tp0M73IrVwcbFZC+Q3AqdjA8QFad+wToQjU+yBUSSyKWsxDjc
	OzyVT4hbLy4nID+Yr8lwh0uOVFMyYBL9kll4MwjuMhgASrm0urm69uJI43wM/I96eVNCcaAjv27Ud
	7u5zwakbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUne-0000Ji-4B; Fri, 16 Oct 2020 18:49:58 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUnZ-0000Hr-T2; Fri, 16 Oct 2020 18:49:56 +0000
Received: by mail-ot1-f65.google.com with SMTP id m22so3367448ots.4;
 Fri, 16 Oct 2020 11:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+7rk6mULs7E7giUj43cA1IP/FNs4mrAUMdNjX3XPy9Q=;
 b=TDisfCN8BODK07wfSCZZGpez9sdYrCAVL9Z2QXkN2R0bZ5R+oNb8eT1wbdRVfKRvaG
 A/K9Mw7YoyXH6tebhJohnK+JcGz78cbaTd22QAK/9K4VKK516Zq2RjwJFmrINAxmTxt4
 2ey9PVoiPPkXFMEuW4d8+2odVD4T2kARqOl1d9cORaVQeuxz77KYlKPywl+coGkbIL3v
 ERl/jN6HlKnB82PcZf7lIkbiCERqX8iVOeDdEXzxOe8NvtpRqRS1XVty3qEWooTQf0u2
 zM2t85gbRV9leoEngcGHt6mZ88Ay6eCWblheqDOWypydtNFdQZ9DGnpE/zarWd96HfDt
 Oe3g==
X-Gm-Message-State: AOAM530vsOynuTbYKLzdg4fiAtg/zg5s1cxzhXIDDoSwmpNHAghJEyOg
 bkYCHSJA2RnqArNzYUMTXQ==
X-Google-Smtp-Source: ABdhPJwhDAteawNmw6uR+cUrj6Q9kHmeXiVaLKCaqkOS9AtmXWCjKDSR7JcUL4/bZsjQu3uW2S135A==
X-Received: by 2002:a05:6830:10d3:: with SMTP id
 z19mr3806259oto.295.1602874193111; 
 Fri, 16 Oct 2020 11:49:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h14sm1214366otl.0.2020.10.16.11.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:49:52 -0700 (PDT)
Received: (nullmailer pid 1733036 invoked by uid 1000);
 Fri, 16 Oct 2020 18:49:51 -0000
Date: Fri, 16 Oct 2020 13:49:51 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 07/20] dt-bindings: usb: xhci: Add Broadcom STB v2
 compatible device
Message-ID: <20201016184951.GA1732957@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-8-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_144953_983331_A84EB306 
X-CRM114-Status: GOOD (  12.06  )
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

On Wed, 14 Oct 2020 13:13:49 +0300, Serge Semin wrote:
> For some reason the "brcm,xhci-brcm-v2" compatible string has been missing
> in the original bindings file. Add it to the Generic xHCI Controllers DT
> schema since the controller driver expects it to be supported.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/generic-xhci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
