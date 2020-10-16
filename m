Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423E0C43467
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1470214DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aq/PIuCW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1470214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OMVEeCV/AncczAZcOy0ynQktbiC3CKYDV0ScQWg4zoE=; b=aq/PIuCWn7DixCC0Nmqy/hjFM
	FTtbp5jBysnDv8gsPqSpQEAGZS4qiDedO0CsdrqOa+iYqFv4RmWmgO/bvcqKurMYWxbJBwk0eabyV
	/hJZNyb+XC58vlx6kpW2vJ04R1fF2XQdN+nqYZUSeUyAWhp19I4Y+AXoKu+9sZoieCQNVRycvsicO
	KhUQ+HQ7uhPD7eIwsuuRqZeiywPOm8lvGKU3s4vHCIQlbdizRZEXCnfc9wSiTK+fhlC1wQWOHkgmY
	fd4YXpBx6wiOhdbxMQek59+4vhZjss4207DLfCr+vntxqgJbedXe5NF261w5Zwwbt7uvDn5Ph3AjN
	8BXbHSasg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUns-0000Oo-17; Fri, 16 Oct 2020 18:50:12 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUnq-0000Ns-Mt; Fri, 16 Oct 2020 18:50:11 +0000
Received: by mail-ot1-f68.google.com with SMTP id e20so3327377otj.11;
 Fri, 16 Oct 2020 11:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tsEFGFDEJB33aFAr/ryJhZmR4NK4qeJppeYiZlNUE6k=;
 b=FnBOhFlC1sKhguP/u8pKXj5d/Kwsy7PYmsRuwnLCjutyzYTH7sse3Yh5PXAPMgrYW0
 QQGuJugRM9o1k35Y/j3gQnUoUdVwhovOjsglwmNhlASxuhM3IxSfrAwJgX7Dzu1kipLv
 z7xk6wZWCsA3FREF+LFqemPunqNs5+le/1HyOMOl0CKHWvh3Z0Q37ojCrJ45Kdm+KqcE
 Tn06jMBid987sgIEtfaQhWfJiy6eKYqWCcEbR2FWSuUx5X16l9SYcleQ6F1nZOQleQZJ
 AsDB65fF8AvRhEf5s6c+7ar/GigpBybdQVzpdXYZgtLQmhrpTSHpd1mlEpSiqu7R9RBw
 Zrwg==
X-Gm-Message-State: AOAM530TvPmjDd4j6AJAXB39chkIPfGUhOO4WelVBoztXQEsYKSBrYga
 6XPJQlUMN5xFOaN/zLeHig==
X-Google-Smtp-Source: ABdhPJwf1V8jGj40xsK56aM87EAIEjSM8YWRrCdA3QZNoYzUf4866Tswq3wAkcC4d06N05OwEMwF9Q==
X-Received: by 2002:a9d:6c16:: with SMTP id f22mr3379029otq.173.1602874209610; 
 Fri, 16 Oct 2020 11:50:09 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l138sm1260817oih.32.2020.10.16.11.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:50:09 -0700 (PDT)
Received: (nullmailer pid 1733506 invoked by uid 1000);
 Fri, 16 Oct 2020 18:50:07 -0000
Date: Fri, 16 Oct 2020 13:50:07 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 08/20] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Message-ID: <20201016185007.GA1733460@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-9-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145010_793445_C4AAF29B 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, 14 Oct 2020 13:13:50 +0300, Serge Semin wrote:
> With minor peculiarities (like uploading some vendor-specific firmware)
> these are just Generic xHCI controllers fully compatible with its
> properties. Make sure the Renesas USB xHCI DT nodes are also validated
> against the Generic xHCI DT schema.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
