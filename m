Return-Path: <SRS0=A0w3=FL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00271C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 16:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E4823787
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Dec 2020 16:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E4823787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DuSk91yzLkbn7YQ1vLESuPOdrlMMs1wluv9hb2huIiU=; b=cGNUCYrtzbdoPaKrqE7pWTYT1
	jRxiI72wX5ieBwSFZkUKmtYIPbgdAf5GPP7x86OBg7SRMCncaxrYcuql4Ke0F52/iEFv/Jg60tbE2
	pOUNaLV/BXnkTbGwJ6Ms1vLQEnF6DdYLGh5ZZFAUIYsZl7NVaOEj2J2cSjea7nChebnZVdTCLSjAt
	V16TqQopZ22iccI+W7ALok1Uj1T48Iy3AkToRGzInq1PTummaL8rwmAnlSyfZ85N7JQAiLwLpedlw
	c28nocEZUIfPRS9iMn4f3AuUVB0ZqWniEmyXueMspTI5iJFSc2ZHsQdQUSBysU/sk7aQzVIUn6aOz
	F1DZYxewg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmJiN-0004RS-PS; Mon, 07 Dec 2020 16:50:19 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJiI-0004Ps-3p; Mon, 07 Dec 2020 16:50:14 +0000
Received: by mail-oi1-f194.google.com with SMTP id 15so4889988oix.8;
 Mon, 07 Dec 2020 08:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sVqHnk5+Qd48rsQgEdxe7AzLNS+jRVeavbI0MHrpgH8=;
 b=G6j7ptQtpE1QNzzRZ+1f5YS7pWK7rcZ0Gj+30EFqcySM8uisB0g2EI+ShgDF2QFlau
 ZD/H5R8ZtBH0+PjHwH8dqpg0hMCcVq9SqoE6R2E4RtsZlK46xlPaXzBnvxB50ipMAbj+
 +yq0ge0Nl225sqwkdbBSyG7TjQ0Ho0x4mIWKJs85hFe1rz+m6sbTKJFZxdILz/guhUEQ
 AOu1rsyz82lkkyxTPEtoDhT8AhGnv91duNOOfQI43VXrnc0/g1yxnPw4zGFBk2HPP709
 eGHTM4TAMIQxpjtfXXK9vROiXs2EJNIJ1EpIExquhd09fLbiA7BvTHyMKDKxCjpxcbNN
 dAQw==
X-Gm-Message-State: AOAM531sQkRRdvlWkey9hFLcTFUlaL2HUQXejsQbnbIRkzbKJ/5hMkp0
 xbXGHHCVGgz3sxgP4lizqw==
X-Google-Smtp-Source: ABdhPJyi1wFJCXTTwPWZTDNSZYVtXEjaTrMTXAL1g/vcuUtmd8ZXTbe7OhMA8bMQ/ovZiNG8xiPfvg==
X-Received: by 2002:aca:ccc1:: with SMTP id
 c184mr10424948oig.121.1607359813295; 
 Mon, 07 Dec 2020 08:50:13 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j62sm2730022otc.49.2020.12.07.08.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:50:12 -0800 (PST)
Received: (nullmailer pid 421441 invoked by uid 1000);
 Mon, 07 Dec 2020 16:50:10 -0000
Date: Mon, 7 Dec 2020 10:50:10 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 01/19] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201207165010.GB420349@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-2-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_115014_191997_7F372617 
X-CRM114-Status: GOOD (  19.29  )
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
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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

On Sat, 05 Dec 2020 18:24:08 +0300, Serge Semin wrote:
> There can be three distinctive types of the USB controllers: USB hosts,
> USB peripherals/gadgets and USB OTG, which can switch from one role to
> another. In order to have that hierarchy handled in the DT binding files,
> we need to collect common properties in a common DT schema and specific
> properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> dedicated for the USB host controllers only, let's move some common
> properties from there into the usb.yaml schema. So the later would be
> available to evaluate all currently supported types of the USB
> controllers.
> 
> While at it add an explicit "additionalProperties: true" into the
> usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> properties is going to be get mandatory soon.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created as a result of the comment left
>   by Chunfeng Yun in v3
> 
> Changelog v5:
> - Discard duplicated additionalProperties property definition.
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/usb-hcd.yaml
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
schemas/usb/usb-hcd.yaml: ignoring, error in schema: 
dt-validate: recursion error: Check for prior errors in a referenced schema
dt-validate: recursion error: Check for prior errors in a referenced schema


See https://patchwork.ozlabs.org/patch/1411574

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
