Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE83BC433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:56:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C23620FC3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bf5Vc4YG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WB47sAIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C23620FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BSsmZ9n0OsldbkW1wczsxU3BCb60QkZI0NyPIwXnLfc=; b=Bf5Vc4YGe+nnRWxqZgWtWsM8l
	m99GLrfkm6FQVqDDrLkMBYjWd3xfWI1rj/WkXlaVL4erqp2/O3dKfLSmUeZcGrNzj9VOkFazZhR55
	R8cfE+zCjvvmTAp371NzHUdcV7aPGVMXwkSDtYbZGuIUbvUhAAWg88WZAwcUwsqfvtFCiKUYAwXi+
	GibWmJgNSwDpLpniArINJqcXSTw55aFw24tpmHSCNPE8vbS+IBi2IiGK+yng/kWh8lNhFcHA/hcxr
	GOFpkxCpY+O1gfscTA/5OWfukvKXRrXE6Ke4PKQiZV+/x12sAfONpky71lkJmRPL9IMLFt8KRWQQe
	J/hBBXhAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUtV-0002R3-Jz; Fri, 16 Oct 2020 18:56:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUtF-0002Jd-DE; Fri, 16 Oct 2020 18:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1qsbroh8jyH1La6q3n8nR798td9FmfS1E+IS46iSd8Y=; b=WB47sAIyczinprz4KYwka517ZW
 z+PI5YdpwzfFlwXOj+WkkyBwMaoFuqihmoB7A0SF7mOesAuT9KVWqfN3wGX6dkioCKNFEVZWxOhdh
 4Ubj3AbDEaCFP7gQUh4lAnJAiKuD3fxBJVvGqoe46Z6CaRq5K+vFEPSGMk+TyEpMo8y+QppYdky45
 PoAv5vj93P6NNGr1Z5SncrnP2neh7lkmsTc6qnu4/9gLuWal6CL5Vu+CLSc31VAvsOuD2fNsAmUqY
 7/xz8RFav+OVr4tR9Hh2soyeDk82VYcCEtecdwN9X89I6vsnnOlyyiPo//AHLMaGlocmsjq18KCtG
 YnxXMK/Q==;
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUtB-0006cv-OI; Fri, 16 Oct 2020 18:55:44 +0000
Received: by mail-ot1-f66.google.com with SMTP id m22so3384338ots.4;
 Fri, 16 Oct 2020 11:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1qsbroh8jyH1La6q3n8nR798td9FmfS1E+IS46iSd8Y=;
 b=uIhrXHL3mx5y+eujTWOeHc735frI7xsRzpxhRh588g6Xhcyy9NSGjYg63ec0JgTG7P
 Y6uUTkjjulW0wnpvJ3mOH4VAkLmE75M/90Ea7KvOlARO8V3rztL2v90wPJNGocTGMrW9
 1bJ3j4wRNK9OreQgUMuD9UZLubC8SG+dPepYKfWFIjfYAWuXyX70ANKKSNZctSIt1Ow5
 SSpB7rc8wWGmDy3zfbRFkzmMBKfADyfqB6Q2pb5tWzjBY/F9OX2/cz51mv6Q1iLDuGAh
 DYPSyt/B6FwihT1n+0UTATKC5o2msAD129e1M3SjsYOpyunzCUfffcNRgqo8PG3Q8YL1
 Vlew==
X-Gm-Message-State: AOAM533T6M36sY1v2pt7WitDWqZ5BIlfaawXnvBOVCdoinwyYnZJFKcq
 0S4YEXYAK0vkcHDPPgiJgg==
X-Google-Smtp-Source: ABdhPJyNJLnYhDVNfMr5gJcHIknRErh64x3+ylvRK0oSof5GJesuJTLIUcPjJE1UUw/Qlq2TlHLyzA==
X-Received: by 2002:a9d:7752:: with SMTP id t18mr3718386otl.341.1602874538699; 
 Fri, 16 Oct 2020 11:55:38 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w3sm1380171oop.4.2020.10.16.11.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:55:38 -0700 (PDT)
Received: (nullmailer pid 1741601 invoked by uid 1000);
 Fri, 16 Oct 2020 18:55:37 -0000
Date: Fri, 16 Oct 2020 13:55:37 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 17/20] dt-bindings: usb: qcom, dwc3: Validate DWC3 sub-node
Message-ID: <20201016185537.GA1741555@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_195542_013955_60501569 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org,
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

On Wed, 14 Oct 2020 13:13:59 +0300, Serge Semin wrote:
> Qualcomm msm8996/sc7180/sdm845 DWC3 compatible DT nodes are supposed to
> have a DWC USB3 compatible sub-node to describe a fully functioning USB
> interface. Let's use the available DWC USB3 DT schema to validate the
> Qualcomm DWC3 sub-nodes.
> 
> Note since the generic DWC USB3 DT node is supposed to be named as generic
> USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
> regexp and fix the DT node example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes.
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
