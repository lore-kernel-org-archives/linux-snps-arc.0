Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1028CC388F9
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 23:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C8D208C3
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 23:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fk9CfXzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C8D208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5b6nNuhwIewQZnY+meC1u8XgLtkxlr+I+yP3PHLaC0o=; b=Fk9CfXzEmIlZ3nK0zA8watqxk
	tCf44OtSgFx725l8l6U7ccXH5YVpYklmDcALWJFWgTJhAgPg1LhnyIKaJULXLnKOguDtipox/2+gR
	6L3nx2/TV3C+xhbZ/w8YZfoStODlpKvJHc4P+tAXdltxT/OtvVHagOCJUQaA34fCz+o9hZP65uF35
	NreYviHfYayjYBAbasI1w0fbpF9GUfuahYN8hZX54Y5vZka+CUKuc64jfDhvoETwuq9576gn1Dg+d
	ODxr0Ft6T4Il0oycoeDbCkV9ZJnLmOId/Ay9qCq2bY+kAGgdC1/AyvkNWvIZESZaN9ZVu2OTs05k6
	uNnsspArA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcRc-0005LC-5O; Sat, 21 Nov 2020 23:37:28 +0000
Received: from mail-yb1-f195.google.com ([209.85.219.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcRY-0005K6-Ew; Sat, 21 Nov 2020 23:37:25 +0000
Received: by mail-yb1-f195.google.com with SMTP id v92so12339684ybi.4;
 Sat, 21 Nov 2020 15:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O6Nr/Rieym0i/OHuod4YgdUg5NHz7ccPxXo1aK1Oha0=;
 b=rMLs/WQn3OJi7BL+KkoZytolMHHQmHDdviViJmka3K7S0vPL2Wk/Sp/M0oALQe3hDq
 GBZQa2qaOd4gKBCAP/rI515NVlexlRX5/nKsGMO6nm/WJx13LEz1T5GFA2NxdDjyfcFB
 vWqTNHsM7mzzQMk5tpbrpxRbM4NQ0Cw/WFc7NXgLnsCXJmp0QLfSIzVPxOT8UfHWaXSl
 X2s85JXbyIGxMtJg/fEPPWVw90uA28yQ+ffQOIi5aEmZNIuhjBZxX2Ajw68JFYnICHby
 WOst++ag8RQNubpxwh1do1hXg0atkKwfTp+LoL3NO+zFj6DPsaVGXXw+lrzLuMU1oI9c
 pyow==
X-Gm-Message-State: AOAM531MhwuAeiu88HY9VM9EvkHVHyR63naMAJ0scFnoL/nJ7aGrl+uB
 wOGFl4rxd+dGX+yZn9Kv48vU3veFjw==
X-Google-Smtp-Source: ABdhPJw3HoleXj4Ds9tiz5eVa//gqnZHEYkUUG/e1jSOlz7u3ljD+0RipYCaATEwmrx6h4HXBMJXYg==
X-Received: by 2002:a05:6830:1283:: with SMTP id
 z3mr18198570otp.323.1605962650796; 
 Sat, 21 Nov 2020 04:44:10 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
 by smtp.gmail.com with ESMTPSA id t5sm3116800oth.16.2020.11.21.04.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:44:10 -0800 (PST)
Received: (nullmailer pid 2067061 invoked by uid 1000);
 Sat, 21 Nov 2020 12:44:03 -0000
Date: Sat, 21 Nov 2020 06:44:03 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 02/18] dt-bindings: usb: Convert generic USB
 properties to DT schemas
Message-ID: <20201121124403.GA2066237@robh.at.kernel.org>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_183724_543618_256622E1 
X-CRM114-Status: GOOD (  17.54  )
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
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, 11 Nov 2020 12:08:37 +0300, Serge Semin wrote:
> The generic USB properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert its content into the generic USB, USB HCD and USB DRD DT
> schemas. So the Generic USB schema will be applicable to all USB
> controllers, USB HCD - for the generic USB Host controllers and the USB
> DRD - for the USB Dual-role controllers.
> 
> Note the USB DRD schema is supposed to work in conjunction with
> the USB peripheral/gadget and USB host controllers DT schemas.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' in all the new properties, since we don't need to preserve
>   the text formatting.
> - Convert abbreviated form of the "maximum-speed" enum restriction into
>   the multi-lined version of the list.
> - Drop quotes from around the string constants.
> 
> Changelog v4:
> - Redistribute the properties between generic ones, USB HCD-specific and
>   USB DRD-specific.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more time.
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 --------------
>  .../devicetree/bindings/usb/usb-drd.yaml      | 77 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  5 ++
>  .../devicetree/bindings/usb/usb.yaml          | 22 ++++++
>  4 files changed, 104 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
