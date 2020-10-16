Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8D3C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:34:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9956A2084C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a49H+1xx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9956A2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wu7Q8fNjnnMcIkYrBFWktHMv7mci682E75sKxIRCGxE=; b=a49H+1xx+KbI06CrXY8D/j613
	AZfk81ycVN7iG/U5Z8LsTqzi0lCj+shCdEPG8H8Wm7AtnAm0PDwFwFB6xfOTlfy1gbci97wSSUGZl
	T5in3rDTlEG7anqDggnKNYBKlPg2SF+Koiwf3s5DcFxPbq8NqY7yRByDnvZ4ouVEsYVjxhye5WeoW
	pU7o+gEfPBNCH5wgfmRHJu/FQz4z5G39foyGoKViu2mW51EROzXLRlJ+I4ZFZmvGaAvEpfmKWhIsF
	eMyPZJOkNbFfsSZpMfstfGzrjNnnfzOIeGvZodG8IAgCDnsj8WF6c6f6s2l4KIY5arehh0MwNP1JM
	JfpWLWmjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUYA-0006rz-Ny; Fri, 16 Oct 2020 18:33:58 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUY6-0006rB-Cz; Fri, 16 Oct 2020 18:33:55 +0000
Received: by mail-oi1-f193.google.com with SMTP id w141so3500288oia.2;
 Fri, 16 Oct 2020 11:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UDTtNlOGm1HvWwHnEyl2J0aIGj7blB2zVqE4G+OLkzg=;
 b=FVkJ8ejhtVptBs6wpY6YcFW9oZ9UQMV43yfxmZ6+xEB6Hww5uMYZxB3fW9ooZRdUfR
 /9CIXTaSG4v8yJkU17leHh03RBLNF4dIdJhs9ViEbNz0afugVPtvTt1IVtQIWS7/K9qZ
 y2AyNaaxVR5jKK5aNna4UCLe7rNvhXUkzdXVtI3FRQ9gLTWmjTcOeeftvZXXfafPu5Fw
 mec3doRzEJswbIzRISRqUPEuC+1xlqBiqIGz25hoV0J4GMiTCyyqma59yFuIn0xY9vxG
 qb66BT7Cs5zT19kTAUuN+Bp3xsNLDfulTxqPBlUWDwuGo37UqzfrlmJsim4grGr7dhGo
 WI0w==
X-Gm-Message-State: AOAM530M640K2N0GMPvgdrbePWfAXJNtbRZqDpNcUTgwWThWXZJ/kZHN
 /iw9PkWcBZ1V2LjdTccFyMu/WcIPqQ==
X-Google-Smtp-Source: ABdhPJwJMxgjSojEb765Vf9jtXqW2AE6c488Kfu3npxryBaa3nw0GZZPQdSCsowUayDeivmee8U+9w==
X-Received: by 2002:aca:4485:: with SMTP id r127mr3224405oia.160.1602873233618; 
 Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z25sm1314185oot.23.2020.10.16.11.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
Received: (nullmailer pid 1698948 invoked by uid 1000);
 Fri, 16 Oct 2020 18:33:51 -0000
Date: Fri, 16 Oct 2020 13:33:51 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 02/20] dt-bindings: usb: usb-hcd: Add "otg-rev" property
 restriction
Message-ID: <20201016183351.GA1698901@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-3-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_143354_449187_D8A9E63A 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, 14 Oct 2020 13:13:44 +0300, Serge Semin wrote:
> There are only four OTG revisions are currently supported by the kernel:
> 0x0100, 0x0120, 0x0130, 0x0200. Any another value is considered as
> invalid.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
