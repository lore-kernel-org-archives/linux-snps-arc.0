Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EDEC5517A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 19:16:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576FF206B6
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 19:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zxxam+GJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576FF206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Sk+P30PXEeGjRSHDpBf3KfC5YuvoWIgJPq+HYr74Kc=; b=zxxam+GJZEsBSPB3er9AGKIAy
	f27Curd7M8FPUe4igUHDhV9wN8z9GA/bOdvBB0L+KmcMfRxCbUMTMz1hQ6Y3DUhPjB0ay6fPQ+wPR
	aXvSPLqcxUtzMSmcSZj1DLeOk/XLh3rUypnQ8vm3SD2XzSsCEf5ndt1yimHDS9UC6DXrH5gArjB3N
	QOqfTFy9XXIqfx7khQFY/maQaEB322EyT5w8qXY6wnspmX1GgfS3pa1KMZC3pXrYYft9k4HCKmLq3
	Jc76AvZHOuXnxNTWlh4BsVn5/AUkMpOhBpRWXnsjRNCViRhmzQwBTc5b+er5lLBCHJ61QYD87bnqT
	vAR6ty++g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcvbu-0005hj-Ct; Wed, 11 Nov 2020 19:16:50 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcvbo-0005gn-Vf; Wed, 11 Nov 2020 19:16:47 +0000
Received: by mail-oi1-f196.google.com with SMTP id t16so3384334oie.11;
 Wed, 11 Nov 2020 11:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AiCDPZgcTf3GX/z2zx/26J8ErQhTL1mnCpMM32GGzw4=;
 b=ZN8lEMQHtZaLXWDkdq4NaQvAwtNcTuwJv41GBOWtoGudwLKNZ0ATrQBeKys4d8AAXn
 jsTV5w8lQWGA+Au9Ldyy7Ldahg+CHlId2l3unG6YrEp9S6CAl5los55XQCcOhLoMwTjZ
 wFnB8+P445TpMPeNjjcu95wVLUlFSgtO3IyDphyrQ8YNN2F6SgVzLoMLqvF0JDipUKh8
 NYWYw/ngL+XIbs6dMMJiARjAibP4cp6UOUH+VC/JZafn3QwMrbaaxIAs7VXXhLveVzkE
 BMLYGkD8BDTvTuxGKt7XzOMFDfkRfFeoPPIbuPf5iW6X5YiWHyMCOkEei0YMiq+6J4ke
 yh9Q==
X-Gm-Message-State: AOAM530tC5VRcO8Y+nMiKIjFd+tQlkEFALyArr9VTWmnyCjBzpTxaDka
 nqIHXCuQXrNUsW2abFi5QA==
X-Google-Smtp-Source: ABdhPJwyi016mtmjmTLTqVQpJJDCJFBGadh4UUgCNqobL85eUP5paFNnEC8U07pacXIsSPdIILspgQ==
X-Received: by 2002:aca:72ca:: with SMTP id p193mr3299201oic.9.1605122202551; 
 Wed, 11 Nov 2020 11:16:42 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n81sm588991oif.53.2020.11.11.11.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 11:16:41 -0800 (PST)
Received: (nullmailer pid 1857962 invoked by uid 1000);
 Wed, 11 Nov 2020 19:16:40 -0000
Date: Wed, 11 Nov 2020 13:16:40 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201111191640.GA1857205@bogus>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_141645_037472_0D948A91 
X-CRM114-Status: GOOD (  19.97  )
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

On Wed, 11 Nov 2020 12:08:36 +0300, Serge Semin wrote:
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
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/usb-hcd.yaml:17:1: [error] duplication of key "additionalProperties" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 113, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 123, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 723, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 440, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 257, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "additionalProperties" with value "True" (original value: "True")
  in "<unicode string>", line 17, column 1

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1398034

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
