Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544E9C43457
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 20:18:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE582224D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 20:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TgDDoDg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE582224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AB4P4PhYmUn22YfFhi7WZBUZHk0I74Mq2QdUQaX4edI=; b=TgDDoDg+tsMNJH0NVt6tUCGOn
	PnWTdqJMzSvTxqcQ3sx6aFKJEzQtioVsD1gJX5hM5k/mH/rVEzLahzpczbvHwbI8+h9ZYLOYol+VB
	3QLCRUSnXfyzo5modJZspmNB9NM9EwN7DJ8Fg11dwEzHc1aedeAMnHoHbDuZMihWX/xL5i55JQgmj
	h49IN8BQNdbvu40tw3vnqiFYqXwkbQFVAhM5U1/m2WGaKelHGXoBfC0cWJs4un6eel8Qx4QRxdhHH
	yniTbiJ658wf/m3XiNVXm0m3x7Dzaf2O6uCxIchpwRyD23SqsxgaudbQ9QGwsRybdUivdfKZzWG67
	cd383wQDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSnED-0007hC-MP; Wed, 14 Oct 2020 20:18:29 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSnE8-0007fz-LB; Wed, 14 Oct 2020 20:18:25 +0000
Received: by mail-ej1-f67.google.com with SMTP id ce10so353440ejc.5;
 Wed, 14 Oct 2020 13:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0MyUw0Y3gJD9KhX/3YhqYIS6k+1q8f/JNR3G4Oc+mO0=;
 b=BsaRNQJbEsHWX5ka+ZHr9uLwaAvz4NCMK8TbaDOuu0ArFVSx6yQVNN89itsXrwHDfz
 u1KkdaT0IobaNpfcVLZetuWqj15vPZ7u2PW87vUDjpetsVdtmQK3szur5MSMX5Q0OWci
 ZTdPA2TbUCIKpR/MNaJOGN8TlFvaZR7I+XWX+0/UQsjc4YYcLj5O6M4LmwKIp9tcaSli
 m84T4D/mLjv0KlSFV07s1dfofx9e8VjqWNmJS7X4bIPdw5BJ2AhjzTNtvvyulwbKKJg8
 R52gaefVSXHBIAiv9kBOSbKpmFxwrZepUNap9uOgiHUlLIW9nWwiQk/IdjQqkz5kfKF6
 NFuA==
X-Gm-Message-State: AOAM533UgyXN1PdgCjWniBdXMRv330KjgAXelmzIshfXhozXm5eWBWP4
 /F0mk8ERjzpH28ZSmXqCTXI=
X-Google-Smtp-Source: ABdhPJyD9mvSdzTeswKoJSSkNRNYZJV/A491oP4RLt7gITN4T+XTScFWRX+EpK8W5zlRYXEzJ8uEig==
X-Received: by 2002:a17:906:1e45:: with SMTP id
 i5mr798232ejj.203.1602706702595; 
 Wed, 14 Oct 2020 13:18:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id i18sm222556ejr.59.2020.10.14.13.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 13:18:21 -0700 (PDT)
Date: Wed, 14 Oct 2020 22:18:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3
 compatible string
Message-ID: <20201014201818.GA6926@kozik-lap>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_161824_700723_A192DC0A 
X-CRM114-Status: GOOD (  10.46  )
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

On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> expects the DWC USB3 DT node to have the compatible string with the
> "synopsys" vendor prefix. Let's add the corresponding compatible string to
> the controller DT schema, but mark it as deprecated seeing the Synopsys,
> Inc. is presented with just "snps" vendor prefix.

Instead of adding deprecated schema just correct the DTSes to use snps.
The "synopsys" is not even in vendor prefixes.

Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
