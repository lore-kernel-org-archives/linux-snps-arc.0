Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FD6C433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:54:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CC820FC3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNdQMlB/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CC820FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u/6CK7RgZT8837RVFZNOKYGxefVDgPAaE4mZUbgDbJI=; b=oNdQMlB/fadlErcqUCb7+cCJM
	cz42/KIQ1JlVuLUzFjiJev+9bnfTByEnuuzOUYUwJ/jCvwuFU5HurhetroJud4hO5EDgZBG84WzA5
	UgBL9fGsFIKRL4qo6/6DueOcb3AR4svnT+hAQn29gsxPPBPwJgnqogoyVtSqJIuPt2LZyX5YKBrv9
	zo4pbLXmWolZHQl7KyxnbooKMmdM8dLRnw6muofUzIy2Z2Vd3wVgs0bK0iDMtycE0HP1OIvRBBeVl
	2S2MePxW47JhxP6v2E3xBzohXG25cipnmP4nAVkSi0CyibjGU7lKDFSyyL3Q9zqzRq+x3Mf1BsN7N
	x7gyh9chA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUs4-0001pS-Fn; Fri, 16 Oct 2020 18:54:32 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUrq-0001ji-8m; Fri, 16 Oct 2020 18:54:19 +0000
Received: by mail-oo1-f66.google.com with SMTP id x1so850803ooo.12;
 Fri, 16 Oct 2020 11:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rJzbPAxzg6ilw2UkQ6tAV4yqkzoyoHPXjWkUniuz3xs=;
 b=O7cMZ3nbHpWwPEHH0ZfuM/+txTftzDgz2P1rwvLQ8O55uwJERZwfS3HcYxRGcbbltB
 qPOSnNs9EdasR2O3MbOsUGXCxH29M5RXraeaer2VO5hvUOf4XpAKAIyzJA47klHevyqi
 y7J+vhK5Wv3Zi7zyvUEvZdbswmvJR5rLo5Ey63V8ufoq7Ykq0YI/EziSgPdonU2VFHs2
 TDXrDyTcIhATvBOBzzVQAjE5oGeN2k71/CH8nj6KtlYRPTE7lHabBbwUIv0KH2NrYjbu
 3LCrjerZmFOJU3VAosxQeaB26WlvX5LIzcKK2pKjyo9v7xcxy9JwKht2IQhUe+W7OkeV
 trKA==
X-Gm-Message-State: AOAM533OKFzNvpkDe19O5jw/2MN2ZXWwYYEEHfdaQ0a1obO5vMHBc3XF
 I61cc54dqB/+esVWAf6vWg==
X-Google-Smtp-Source: ABdhPJxHQw8SwIo5pxcTDGGAB6KVAXfb74xhoP1dlxCV0EYXTwri1nV7bGwspN7IGCzr6tBvWECjQQ==
X-Received: by 2002:a4a:be14:: with SMTP id l20mr3781868oop.27.1602874457029; 
 Fri, 16 Oct 2020 11:54:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 15sm1393723ooy.36.2020.10.16.11.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:54:16 -0700 (PDT)
Received: (nullmailer pid 1739428 invoked by uid 1000);
 Fri, 16 Oct 2020 18:54:15 -0000
Date: Fri, 16 Oct 2020 13:54:15 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 13/20] dt-bindings: usb: dwc3: Add Frame Length Adj
 restrictions
Message-ID: <20201016185415.GA1739379@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-14-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-14-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_145418_458395_1F0FDDD3 
X-CRM114-Status: GOOD (  11.73  )
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
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, 14 Oct 2020 13:13:55 +0300, Serge Semin wrote:
> In accordance with the IP core databook the
> snps,quirk-frame-length-adjustment property can be set within [0, 0x3F].
> Let's make sure the DT schema applies a correct restriction on the
> property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
