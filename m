Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6351DC433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:34:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D810520EDD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwNwgujO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D810520EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sOXOJ6o9mHrrQg8cvIpMNPAuII5NN2XP7AQCc142/7c=; b=IwNwgujODHxSmmAyXT0sisDHY
	pH8eY/L26lN7wwKb9TfW5s3SZCauukFwH5ByfxTJHbVhYFq1dyNkiOrweAPiwVOf3jX4G7XBYN94+
	Ob2/g8taU2tXE2hjidUSTcNjwv5DrNd/6XqyBOA8bwl/SisIOv4EirNymVWxJNmEZKq0Ez7DLRac3
	t0gnQjooy/w3naohisdLLhcv4b6xsIc2gO2RiKMDFdZ+eBSv2pwTv1tVDuV0Ly/+ERSqbt6yhD6Ii
	W+CA3xhnPFIIUpYNpK3JZEVcoSWbF3Hi4YIKOoWYiArMUFA2GO+irEu0mQY02Nby7ijbr47EznZut
	izp5Z/FQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUYT-0006uK-2S; Fri, 16 Oct 2020 18:34:17 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUYQ-0006tW-TE; Fri, 16 Oct 2020 18:34:15 +0000
Received: by mail-ot1-f65.google.com with SMTP id f22so728791ots.2;
 Fri, 16 Oct 2020 11:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qwu3JG9+LDlewH987hNzyQoOEX0CL8g7zvaZjjCcw4U=;
 b=aPxkOAYgYp9LHVSJzbTqG9pfGZ4Xas1wF7twCNiM44KnhrXD+Mcz9TRZOSykrlfIDv
 j+ae8s8MVXQPV39g1Kimj73NNEDgbZwTQhpJ3RI7L/ipMh1TWaUp95oxxr/eHaNGpvd6
 nkHgHXMoKXK7HlOwKfyPjdZSzvB/6uYeQR2lTLpv8Ny5kGpYvU8sGve7XusfSO/DnA/5
 NyT6hgTVxogHpJ3tevbtTiXoyowtL7BgsmSXV8lt0Op/UDzIyJJeyEuS76Vj89R6uKGo
 R50C8dzGk323cBg17fEj1aEKEG2HmkxkypdWBTI6UwuZZr5ADaEMjPpJgS1FdrrLgLHL
 zFig==
X-Gm-Message-State: AOAM532s3z15ayQ6BsxSNU0N0UcAV7jigqFPhVARot2E2HEjyH9GG6+u
 VF/3HIIje5ojy5b99+riHg==
X-Google-Smtp-Source: ABdhPJyi6z0hP/x6L+MrsJNmQGndEN2hAnyiGpicmxYQV/nKNfR9ytGgBHm+fPvoXX+6vbcG4GvIAA==
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr3447418oth.215.1602873254082; 
 Fri, 16 Oct 2020 11:34:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m23sm1354610ooq.30.2020.10.16.11.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:34:13 -0700 (PDT)
Received: (nullmailer pid 1699483 invoked by uid 1000);
 Fri, 16 Oct 2020 18:34:12 -0000
Date: Fri, 16 Oct 2020 13:34:12 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 03/20] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic"
 PHY types
Message-ID: <20201016183412.GA1699346@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-4-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_143414_961268_104B356E 
X-CRM114-Status: GOOD (  12.86  )
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 13:13:45 +0300, Serge Semin wrote:
> Aside from the UTMI+ there are also ULPI, Serial and HSIC PHY types
> that can be specified in the phy_type HCD property. Add them to the
> enumeration of the acceptable values.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/PHY types can be/PHY types that can be"
> - Drop quotes from around the string constants.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
