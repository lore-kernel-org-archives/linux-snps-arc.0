Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91959C433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:47:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F017320EDD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0zfEHWYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F017320EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5OZTkX/BRZ+4GWdykBI4aej/ki+LrFSWNI7JS4fF8PQ=; b=0zfEHWYB+EnHzdLIfmWoixwoT
	hvUW3dCWTcw+0+ybNNfFrBU+yMJ6YaH+pHy74lbHzbTSCuoV0OgeRdQesafclMFpK7+GTq7d2NoTn
	Td3RrKa4nw5Q4HzRzGWr/ylW2SsHBlXehV21meTdJsBbp6FIJ8nH/3p8OtRenlYf7dZxKdWs4hHqR
	y5/hP9W8yKd9icRTj3Hs93JDQ76TGP1ciIRlRZG2ApCc1JQD8OhcSK4Fhd4PTENEK8Qcgc1olanu5
	97F9QB30MIdYfZkZjYxoEH8XZhmiSct05tmh0fOIpEZ2eJEgP94fXfCXpZoo+35Yy0pic+6dALKPY
	cU9/Hzwhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUkx-0008H2-Gj; Fri, 16 Oct 2020 18:47:11 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUku-0008GN-AH; Fri, 16 Oct 2020 18:47:09 +0000
Received: by mail-oi1-f196.google.com with SMTP id l85so3511282oih.10;
 Fri, 16 Oct 2020 11:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8zDeag4KGqmKT8c+d4RekR3O6YxnQntnp7Q/reDb+L8=;
 b=qMrci1QJjithZAIKoHkuUJsnAR7IUpacfLP3ck+8LtY+tevzfDAQ2a1fEqP/xRtr8F
 EuMmm3GhiAhij8i/kHWO6wznrVBKCatsDv3djoDYBKnkDBIUe4C2PSEs0oH479DyDDj2
 Tyoom31RQhCuX6xQGNJ9cj9zXIsQgrUp8WFdFJhjXPqyde2r+k7WT49uD3u6XVbgsN+e
 T6LpWxUSQWVYpG6ILwauNFpM+seHXFv+N53RWw2FeprxBjVAznbjsowi+MpkbwGsuuTm
 VivaIVH7OaCke9FN6pJ9KJSgpw9IciJVJBnP5XpnpdCKVR3btp9jBoFVk+U40H76HIE+
 qd7Q==
X-Gm-Message-State: AOAM530WMpKH/RqpoymeNpzhDF6Gh9UZCLU//VDDCaoLZ6iUC6vuSBB6
 0IBadwp/lc2eY29JB1Y2Qw==
X-Google-Smtp-Source: ABdhPJyENso3SKw3F4zLfI0AJYdmFcov/RsupjIYFRIArytE0XwOHw7L8ThI9GD3vqlzQ1CWLvOUKQ==
X-Received: by 2002:a54:438f:: with SMTP id u15mr3503365oiv.162.1602874027264; 
 Fri, 16 Oct 2020 11:47:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k23sm1379873ool.5.2020.10.16.11.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:47:06 -0700 (PDT)
Received: (nullmailer pid 1729036 invoked by uid 1000);
 Fri, 16 Oct 2020 18:47:05 -0000
Date: Fri, 16 Oct 2020 13:47:05 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201016184705.GA1728990@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_144708_360680_E200A7C4 
X-CRM114-Status: GOOD (  12.98  )
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

On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> The host controller device might be designed to work for the particular
> products or applications. In that case its DT node is supposed to be
> equipped with the tpl-support property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
