Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD45C433E7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:33:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68E42084C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 18:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zDBqMbnQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68E42084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sHd/fOW5dzoCjKjuCAjH+be13KaXHmIGSbG1HBeeV6A=; b=zDBqMbnQNaJkrvILVvNIvLbGO
	HGGrY4jc+vup6SG3hit7wv2TfgYOgKCQhOm/Tme0/q8JRWMGpQvUOEnoeovu+Ko5y5c6nof1m9UHj
	aKp+4JCmR8BsluFMfYAxc/OX+W2O/f8BpyxPJWQDx9MTsND75J6DE80p0uvaGvkLAXrxN7b6XNgPk
	uoCzve6y9e9r73LWaN+4DpUzuY0YCIqodiJOsK6bVeDW3D+2E43KS7JEXBuWsvVXKDtSA7kqKIBR6
	Z8AOKKqbCxGj+sCstKEOxQQ4haGfg7GAGti8gH5ffaSwiLrSRHgZdEKegS8/kN7+bS149Dy1MAmt8
	cyTalSJ9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTUXx-0006qe-Bj; Fri, 16 Oct 2020 18:33:45 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTUXv-0006qI-Cd; Fri, 16 Oct 2020 18:33:44 +0000
Received: by mail-ot1-f66.google.com with SMTP id t15so3341216otk.0;
 Fri, 16 Oct 2020 11:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mxGxwsSCY3mfHHfinHvUgIr9QAqE/m7IS136yJ0NQIw=;
 b=qynQTjZmDhUIwCGYZdDC4E76AZRTZnuFuV3LjKW5FFOit2Z/mG1mP3N9NNrwfGwArN
 dHTMwvm4tOIu06UiT7gzWo8stJ8i5OM1dcodys3IeKjN/xvsactMJnq7/03lC59wdDCH
 x+gOlEnuR1E9xVaw+DcrmN01ar+vKLBd8UsG0RvWo5VZbSiusjGP7Ns/8Ry5GdbEfShR
 t3N6gPpeDvS+BXGMWC7YMfYBcS/I3qaqIoFEmbSv/DJh5GWxGYGI6flz7DQJRxvudA3H
 U3Fmre/i5kG7NTDCnPGZzo81/OnQg8QzuxbiJ2Z28H7mNA03ZHqMnJvd99bqb3X4iiLK
 U98g==
X-Gm-Message-State: AOAM533ssUMv759v6BvF9m5YXwDx2r9P22IjoesrGJ0kPSGrwbV4VZi6
 99o9OhJiq7Bc+NgaCP6byQ==
X-Google-Smtp-Source: ABdhPJxK0nBPqpEDEQqhCocwWw4MLZJrj7QLVUvcaVIp7lyur2QYnCKC/D0WCkbo+F7ROcbQWU1Nyg==
X-Received: by 2002:a9d:6d99:: with SMTP id x25mr3399434otp.57.1602873220920; 
 Fri, 16 Oct 2020 11:33:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y4sm1357005oou.38.2020.10.16.11.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:33:40 -0700 (PDT)
Received: (nullmailer pid 1698574 invoked by uid 1000);
 Fri, 16 Oct 2020 18:33:39 -0000
Date: Fri, 16 Oct 2020 13:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 01/20] dt-bindings: usb: usb-hcd: Convert generic USB
 properties to DT schema
Message-ID: <20201016183339.GA1698518@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_143343_444112_5F8FDAD6 
X-CRM114-Status: GOOD (  13.25  )
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

On Wed, 14 Oct 2020 13:13:43 +0300, Serge Semin wrote:
> The generic USB HCD properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert it' content into the USB HCD DT schema properties so all USB DT
> nodes would be validated to have them properly utilized.
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
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 ------------
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
