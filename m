Return-Path: <SRS0=IY7X=FO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B1BC4361B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Dec 2020 03:24:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D062313E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Dec 2020 03:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D062313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=clHXmtA4Bx0u/0gx+nfloqJdk+mzgN8M08TkcUdBCbw=; b=bC0V9bcJSwxdJj35HASVl606W
	JPfUI/JReGz2+zMHpXBF8wqlt3YwYaGoQLpC9enSxHYzTWxvehGkNpQc9OGoXFiA4asi3ggR68E9/
	a0wfBMBPmt32j5bQtaHdZoCjlY527ZJWcyxEXSSZ8AW/56FBI/CtNuyFRJgCrt3mnzawhvQGSoocx
	j1Ks7zcE+spdBo47H85uVAIqJezhMGpAWf57fAobnv1D/oRk1BUA1Slivgz80H42tbqwwg+GriGox
	ahQMVXIYnVisfPj1huYCNwURNaBay7yVH0BWztfs5ceiUjtfm73TWLWCFmFme2ManAzFv3SeiuUks
	p0AIzLStA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCZY-0002e8-OH; Thu, 10 Dec 2020 03:24:52 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCZX-0002dS-4d; Thu, 10 Dec 2020 03:24:51 +0000
Received: by mail-oo1-f66.google.com with SMTP id s1so960490oon.2;
 Wed, 09 Dec 2020 19:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SGHystu8KEcuTA0RNExv/VnJoWPktKLvdV3bpnziI/o=;
 b=t/X4eNf2/+iVc2IASbSticUKudXiG4Lk2+YQHm6VB3/zZ1YT+A7z1Upyp6ooE0KeG6
 tdOsC1Nub5jewUwBS2Oqwa3Bo5sVt5dbtQbpaSTgvNS3az7eZ2akEiOC7Cc+wWcCq15W
 GZcfs6u8qmRjqqH+XW8zuan/1zq64MA1uNHW6J7GZc1CJQ/er662Esc32gX7N1afjvFS
 bcY59B66klI8WQv0KVQZhFW6VdXJkXgQen1poW/06yZ9YSSMGqAEaQlaut24uKoxIsnQ
 /H7bZaI1x36ETuzyq4/adOH6V+bimU9vZXTc6brIVsPOETlJexh45TXbteNotJ9coC9G
 6Ybg==
X-Gm-Message-State: AOAM533wCAjYm+66gQ/EsQhb2DD3cOYi5DEpNahYx6ZTi/jOxUUBmO6S
 8rNs4PgDT/bsqlzPAPN7Og==
X-Google-Smtp-Source: ABdhPJxVr0iv7i61NhYxL1VKmCWErqvhvd6h7QtNaiu4n9B+aJ0EfyOf4EsAk/DaMrnShrdMqign7w==
X-Received: by 2002:a4a:6b4d:: with SMTP id h13mr4541165oof.67.1607570690575; 
 Wed, 09 Dec 2020 19:24:50 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q18sm749828ood.35.2020.12.09.19.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:24:49 -0800 (PST)
Received: (nullmailer pid 1591441 invoked by uid 1000);
 Thu, 10 Dec 2020 03:24:48 -0000
Date: Wed, 9 Dec 2020 21:24:48 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 12/19] dt-bindings: usb: dwc3: Add synopsys, dwc3
 compatible string
Message-ID: <20201210032448.GA1591395@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-13-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_222451_213797_70DD64D4 
X-CRM114-Status: GOOD (  12.44  )
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

On Sat, 05 Dec 2020 18:24:19 +0300, Serge Semin wrote:
> The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> expects the DWC USB3 DT node to have the compatible string with the
> "synopsys" vendor prefix. Let's add the corresponding compatible string to
> the controller DT schema, but mark it as deprecated seeing the Synopsys,
> Inc. is presented with just "snps" vendor prefix.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Drop quotes from around the compat string constant.
> 
> Changelog v4:
> - Get the patch back, since we can't discard the deprecated prefix from the
>   driver.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
