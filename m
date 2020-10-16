Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7EBC433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:47:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F0DC207BC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BsL6cmbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F0DC207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FpX9jBcMe6RSI/ThgfZqxSlDP6mz18ksQz15r0IbmAI=; b=BsL6cmbAwk4P9hSO7erdvOJ/1
	qGbtMx/zUBhXHuL8pkr1qHctaQJDBs8R8VdjHqxNd0KGRaY3MCJ8gsAQSp7gNqRwhOGADOpmPRR7u
	YXwO2b48vK7yHMZp9qGu+k6C3BO6h/b+klMceeneKSZBxNy+R1jQkGtqx9kxj6K7l9DbObiGw6rmR
	kVkqxE+PCHcwdfkD60RWxlJGGX9PVG0zSBV+CDm/TpMJcBWVPPhwzwoLghdPt+fthNr0+1TENbizh
	dXLzvpYrlodghZf65lnl38hONQPA53OL8GgABmHtdB7KTn8ixTWVbIdHIUnx4feY52PClx8BtNoOg
	a8HhMixuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUlb-0008L6-06; Fri, 16 Oct 2020 18:47:51 +0000
Received: from mail-oo1-f68.google.com ([209.85.161.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUlW-0008Jt-Eb; Fri, 16 Oct 2020 18:47:47 +0000
Received: by mail-oo1-f68.google.com with SMTP id f19so856303oot.4;
 Fri, 16 Oct 2020 11:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ah4l6QAR2mQ0/oHGxUZvIiL/bIHnlL8stCXNgxk0zPU=;
 b=PLpl2OFM4USQOJEgU+kD0usVetAdyXRV4Xqo4wOpszKITiQLptKfvVBOhuI8WbrGDf
 /I1PkKD+cK0DgMdMVbc0dkuYG/TKuCYF/8Vo5GKRi62wkqO+XZ2LEcFuIBhPeJJkDfIx
 3pqkI32JcVFS8YQVBJJpp1OaHojiFkMt+VCseQJAuwfXYxnp6HYgP/codBu6Lpszb74h
 TYs0S9c0UYuS5tWnEdKKYFJ92qzGT05FcTqhy9p9rZ4S8lCEHvVG3Swzxr05dSo/oIqa
 vcgXztwSOWgA7GSapvknRWrFV4qC1xgof7CfRa6DKJL0ZIns/v2l4Rp702FA7ndupl3N
 6ucA==
X-Gm-Message-State: AOAM53379SvfyssR3XIQpTpiLLBniVn7nmt1eF6YCAxmDusRI2o6XZUu
 +uuGo2G0AdKTOc7wN6keYQ==
X-Google-Smtp-Source: ABdhPJwi2sSg9TbyxlBb9FKSGQY3aAdhbGYA8TNts9SijJNIvpVCDN/KL4oZNOHs+2wFaZc9X3ZX/w==
X-Received: by 2002:a4a:e592:: with SMTP id o18mr3759398oov.28.1602874065319; 
 Fri, 16 Oct 2020 11:47:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 189sm1239683oid.40.2020.10.16.11.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:47:44 -0700 (PDT)
Received: (nullmailer pid 1729968 invoked by uid 1000);
 Fri, 16 Oct 2020 18:47:43 -0000
Date: Fri, 16 Oct 2020 13:47:43 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 05/20] dt-bindings: usb: usb-hcd: Add generic "usb-phy"
 property
Message-ID: <20201016184743.GA1729897@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-6-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_144746_536802_D0EDA025 
X-CRM114-Status: GOOD (  15.36  )
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

On Wed, 14 Oct 2020 13:13:47 +0300, Serge Semin wrote:
> Even though the Generic PHY framework is the more preferable way of
> setting the USB PHY up, there are still many dts-files and DT bindings
> which rely on having the legacy "usb-phy" specified to attach particular
> USB PHYs to USB cores. Let's have the "usb-phy" property described in
> the generic USB HCD binding file so it would be validated against the
> nodes in which it's specified. Mark the property as deprecated to
> discourage the developers from using it.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
