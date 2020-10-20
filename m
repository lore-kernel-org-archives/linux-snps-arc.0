Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8848EC433E7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 12:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F97D22265
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 12:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KpGqtGcZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F97D22265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=58xRbstN7MRdD88I25EBow3sQKEPAkusAiQZpontqcc=; b=KpGqtGcZm6dnFBZfwRMboIVmb
	7WW3nTbnu+5VM0N1Nk5PFDV/+CcfF1d5/aWVK7MrHOZOQqgxRpOa5BBipmPaB/ipmrwm8SL7c3pOk
	r5186gVye4Q4SHGiE7X1QywMfug5Ri08jO/YNUUjQfjOQK2Q7WjOkjbLFSdzaIQs4a1wZfgXTMFB+
	BinImhyngfonVBGsLStXySzLTaxs4UXOxJy7QXG4PsinFjKpwymwfLb8f7gcpEGSETQG0vC4GMig5
	jTMuWiV36r+QK13ZBdI50FV4v1rLd1VLgPDn6lAQvOHZzAgkjmiszmp+kOzAIvDNuuKi8IYb5JKEK
	lxdyqqYXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUqrQ-0007XC-U5; Tue, 20 Oct 2020 12:35:29 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUqrA-0007Q0-Ee; Tue, 20 Oct 2020 12:35:18 +0000
Received: by mail-wr1-f68.google.com with SMTP id b8so1948814wrn.0;
 Tue, 20 Oct 2020 05:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K0ziud5U7z2Be3d39hiZg1oazX3EmquJNPRbj25dtTg=;
 b=lEoOsBb9vznitSx6uBaJ7Iy+l2FJRPgj/y7LaYbhY9WC6EpLX8De6cw3zv5A8B0ih/
 Ul6AoS5/94lrNKHcw1Yne0XWuXzwu4DuAmE4lT7QSLYUjPkpzJxQygzH8l++TwAsRmPP
 lC1MD+FDHnc207c0qbAgYp46M0h+dZRr4IvGuVp0IYVBFbG8rLTFpT8kMdkkvt+i9zOL
 WXKLHP/Q2snC/WE+fBLMZjQHP7fkdB/K0rWdR7WspX0eYtRuyRo/qhuselGcauw/wCF+
 7iGXl+huyfOArGmggYzoRe3bmVwvZB4JvIH/rc6Q8/whfSeQBH7647rvY6ysKPcZEy75
 Q2BQ==
X-Gm-Message-State: AOAM530cr2rS1u7JAIltNPy4Bko0nzOQZvCfh+tTxZ9MDkIxscpH0WLw
 kC4xjHjkktOp/u5KGVvxaWM=
X-Google-Smtp-Source: ABdhPJzItdVZsGvx1zFnzZFr5qmOriiBF1A5jL8niYXLbDo1Jr3pvxQ9WttgwmR+Hj9OE0w00JY/Zw==
X-Received: by 2002:adf:f246:: with SMTP id b6mr3280040wrp.111.1603197311141; 
 Tue, 20 Oct 2020 05:35:11 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id a17sm3212629wra.29.2020.10.20.05.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:35:09 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:35:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 06/29] arc: dts: Harmonize EHCI/OHCI DT nodes name
Message-ID: <20201020123506.GE127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-7-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_083512_589928_FFDD3DB0 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 devicetree@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-usb@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 02:59:36PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  arch/arc/boot/dts/axc003.dtsi        | 4 ++--
>  arch/arc/boot/dts/axc003_idu.dtsi    | 4 ++--
>  arch/arc/boot/dts/axs10x_mb.dtsi     | 4 ++--
>  arch/arc/boot/dts/hsdk.dts           | 4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
