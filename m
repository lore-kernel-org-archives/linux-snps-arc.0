Return-Path: <SRS0=IY7X=FO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32965C4361B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Dec 2020 03:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E666422CA2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Dec 2020 03:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E666422CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rdC98xQsc0Kz2wdggVbCKun8D64fJZeYEfLBQ+lO8/c=; b=kTdhrsZQSiLoTjRHNaIa/J0ys
	5yei4tzjlgWBnoTJwOQEOrgvGqEuhGjSzOadngGuZeD8CSEilUpOpYHY9GQA4cEKaoiA9T7tFu1qm
	Eth9NJhwSq+aHI2tdyW+oleL//GZho2ikkuk4P9H785Ve4EhNdIYIvyCmYL2RdNMpqnWpPH9X1oSK
	DHDAgFIQAcpKkz2Ud/0qyrtosldYPrYDTLWDooCBuPiRmAMhvGmSFikHpuZsDELjTbsZc2KHfqPDM
	RZevCuXCJ0YL5oXyGUKmYBugbm54L5/b2GbJmQuaXnatxAKZBf0bG5ak3x7krLFqH3Iv2Dl6TL2k3
	Q5Ez5Gd9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCYo-0002UK-3x; Thu, 10 Dec 2020 03:24:06 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCYl-0002TG-MF; Thu, 10 Dec 2020 03:24:04 +0000
Received: by mail-ot1-f68.google.com with SMTP id b62so3612175otc.5;
 Wed, 09 Dec 2020 19:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BPV+mbc7aH16lyR1Iy3IK6IHtEQI7lxOlNJLzhXVprg=;
 b=FGb9jDfsdrElVclrgGYLYEryKU2MSMapig/6rFEbeYwyuWK5v1JuLxf9eD92+Q+Rf9
 QPMjLBbw5jWtUSwk9HFVsP3gwbqFRDLws6k6Rwq2A0Sf1s533H5M03zZvbX3ERlkzA5B
 so4wIq6Bq0KzXH6weapAFzFrLfs7qdt7ZPDD0VN1P5UskROF561czdy8WT2/nSIOqsXt
 GUyL3NJwS24K0tiKUleci11lR0SdjioFJIp4mMEWMDxXBa5VmeVnVM7yOM2OVKFGLQ5H
 s4zvRKpy+U+zEv1D27Jn2hDWURvZt7fC463C7V9mcMEPU1kxPQ5SW8ETHs4QFMYLuI1P
 ZiAQ==
X-Gm-Message-State: AOAM532KMuzVeA25V3OBa1vPjb5s7smZKI0OJhWoNj0xTOck+93uFULO
 Wy6LyJUOqrwZ1YcuXsUGag==
X-Google-Smtp-Source: ABdhPJxHS5abRR5IlwX+r1rqFuy3fjpJvhGxKQY1kv5d7hwo6ynHH2We4bKSmeX6t6ufoe/klKpb4w==
X-Received: by 2002:a9d:5f9a:: with SMTP id g26mr4523870oti.241.1607570643083; 
 Wed, 09 Dec 2020 19:24:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r204sm334552oif.0.2020.12.09.19.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:24:01 -0800 (PST)
Received: (nullmailer pid 1590264 invoked by uid 1000);
 Thu, 10 Dec 2020 03:23:59 -0000
Date: Wed, 9 Dec 2020 21:23:59 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 01/19] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201210032359.GA1590225@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_222403_805911_CC1E0101 
X-CRM114-Status: GOOD (  16.56  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, 05 Dec 2020 18:24:08 +0300, Serge Semin wrote:
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
> 
> Changelog v5:
> - Discard duplicated additionalProperties property definition.
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
