Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E3EC433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:53:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04E220FC3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yGrHdnEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04E220FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nPCZOfj9Zy5JgJtij7V0CnxMCiM6YToF+pqXevKIOR0=; b=yGrHdnEpQorzMBLOiNz59LVFb
	6+Qn/VQiBeEw01V8cL6p9kLeeDZq/zAkSZF+Zd01Uz1jomXBKLiuKok/gGGuQdyMPS3c7PzaiYmLz
	XKywcThEUGFdnlDlsdhN+mcjRCmAQinuNIHlgUXyD4EA/wu+x8VDFOT28NPXKz7WYehAZ7PQ0R0ug
	Ml+fpi8XRP3AUIkrrtHyGQlBx8a9dDtP0U5tP0YAyHfuRFjBrBot6SJodJno7hxfAkMgarhiNYGzm
	ind+/OgAm1DSPr/n9opnBYiX+EmimzYw4BpuxIrPuuyoq2a9PIJQ9y4rRa2vVHlmH0wVQzyoWCN5l
	yNEGsKz1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUrS-0001aU-Ga; Fri, 16 Oct 2020 18:53:54 +0000
Received: from mail-oo1-f65.google.com ([209.85.161.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUrH-0001W8-8i; Fri, 16 Oct 2020 18:53:44 +0000
Received: by mail-oo1-f65.google.com with SMTP id z1so865460ooj.3;
 Fri, 16 Oct 2020 11:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/BLMOeuNPLg/1+rmux5PnQpwOXbVITQef6gQqf/xRV4=;
 b=SBAMPwAvwTd+Rx2Ll6VLBy/yVkuXpquy/ORS3gK8XO4FQ7GY5QZEl1OEicwYRygVWZ
 fkP3/9O+YvGXik9qagFLfok4KLJmkE/O1Jpx8O7FUftgJCTv/RimNwEGfItY3OQl4i7f
 rnUk3ijFnah7LgxCGqFwlG6pV7iCsKvV32I936B54vAdfbODdQGA29kIWl1wc0s5RL0u
 +ktjz+Ld3wXWk172X7UFcM3jhyeYCPJ+mCiVRJX2i2Z2adIGYy5OdyWIXFmx9Dq2CQKf
 3Eqdw9Eiv8fftfXJKx+WgQltEk3a5zMt/kU5Pt8tYzxnb7nsuVmXk+uO++Gqu9YxAuI+
 GoQA==
X-Gm-Message-State: AOAM533ALKJQ1FWrjFQ1+34YHVBriC/I6PWK4WeM6c8bGXQia4MUvcB/
 U6DA43Rz2k1BRa5qvSX8BQ==
X-Google-Smtp-Source: ABdhPJxtoraofuhC22sxyo8Q42rEuTESh7JvVkC+ACDOtuWNWIg2F8VJBGdmwUM7JkujSl0LOdhDaw==
X-Received: by 2002:a4a:e93a:: with SMTP id a26mr3885560ooe.58.1602874422546; 
 Fri, 16 Oct 2020 11:53:42 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm1194275otr.25.2020.10.16.11.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:53:41 -0700 (PDT)
Received: (nullmailer pid 1738434 invoked by uid 1000);
 Fri, 16 Oct 2020 18:53:40 -0000
Date: Fri, 16 Oct 2020 13:53:40 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3
 compatible string
Message-ID: <20201016185340.GA1734346@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
 <20201014201818.GA6926@kozik-lap>
 <20201014213554.turskjyuntk35syj@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014213554.turskjyuntk35syj@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145343_342794_1CB59EDF 
X-CRM114-Status: GOOD (  15.70  )
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
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Thu, Oct 15, 2020 at 12:35:54AM +0300, Serge Semin wrote:
> On Wed, Oct 14, 2020 at 10:18:18PM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> > > The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> > > expects the DWC USB3 DT node to have the compatible string with the
> > > "synopsys" vendor prefix. Let's add the corresponding compatible string to
> > > the controller DT schema, but mark it as deprecated seeing the Synopsys,
> > > Inc. is presented with just "snps" vendor prefix.
> > 
> 
> > Instead of adding deprecated schema just correct the DTSes to use snps.
> > The "synopsys" is not even in vendor prefixes.
> 
> Yeah, it's not, but the driver and some dts'es use it this way. I am not sure
> that the solution suggested by you is much better than mine. So let's hear the
> Rob'es opinion out in this matter. @Rob, what do you think?

I think we should fix the dts files given there's only 5.

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
