Return-Path: <SRS0=efrZ=DA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E92C4727F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 20:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D3602376E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 20:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fTuoE63o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D3602376E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O/bor9oS21nDEyc+kkP67hVQShCbHme41uDTZ19ft6U=; b=fTuoE63o4zNLttHo8ExA0DNLQ
	hGEJgz/BGjiDsiGnwj7aSx+TF9f3CdN42TWk5p0I/xDeqSxRI9Kj4U5hDBREBNO7vYR7HMT84D8FK
	veYWfkmyImkmuQx74gQBksQH7UcvNyHNz352cQ2Ql14X1zM/uZbeiTohfeLXAGhztM2Kh6Ic6Qr2g
	wyuKnVEx7n9yAoUti6tv3Y+oVIUuuc91d0ROBKnJsuh9nyr8CgIN8/FD8tz2dMVOS7EmQAWv/FLaP
	Ibn64dNqhIBBMj1KYL5iWgDHvbJVdfPmEVRXFmaQNI0Mba3bj1SDyDbEVNoSASjiwHwOrT5l0VEmj
	72hw+Wglw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLBhU-0008Vg-66; Wed, 23 Sep 2020 20:49:16 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBhS-0008VG-21
 for linux-snps-arc@lists.infradead.org; Wed, 23 Sep 2020 20:49:15 +0000
Received: by mail-il1-f193.google.com with SMTP id s88so948404ilb.6
 for <linux-snps-arc@lists.infradead.org>; Wed, 23 Sep 2020 13:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hbPN0IsTe/AzYliyDTAEb4gLEMtnTq3id+26NLSo9hs=;
 b=YJhlSf99LriFOyXNe0XXBXJiZsp3lpywztvpIcqJDd22vNs/HnXN0ZR6Dawc4xqfhz
 6g30PD4F1ZTwtQ15Ipj7NmBZViu8CTLQf/7f2j2PmUlO5LRpJjGHuDunlHlLwX+mhGj5
 5xeQj7CGrFDJPesXFmUZrKKsVyVEFUR2QtHiJGA9EE9ipjeqkjqdYitFv9gMrdjRzICD
 9u54ysDldTAKOiy9PjPiETkUFR+rfteEjTnGu8sL4xFnOHNEVtUMGzwUR+x3zEFsOSJc
 A5Df+IA/OuOMCwYFZkr9Xpt77XqPcw9aQ285hmDKHQm7JDSLXahye3rciTj5yZj5vMJs
 xTcw==
X-Gm-Message-State: AOAM530L8FHc8oM0AFKqBmQngLsR9l0sZMp9hL58QOi856lQm08C6XSr
 tsmMhUV9kDFF0ryENpbKmQ==
X-Google-Smtp-Source: ABdhPJx2NYFLXdhLRlVGU3qRt4AeTTUVd5Jg+bpArf4OM3OVNhdYph/XlROi4NQ5tYzY7v5uuT+5eA==
X-Received: by 2002:a92:405d:: with SMTP id n90mr1372340ila.58.1600894153546; 
 Wed, 23 Sep 2020 13:49:13 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r8sm409462iot.51.2020.09.23.13.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:49:12 -0700 (PDT)
Received: (nullmailer pid 1281407 invoked by uid 1000);
 Wed, 23 Sep 2020 20:49:11 -0000
Date: Wed, 23 Sep 2020 14:49:11 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: dw-apb-ictl: convert to json-schema
Message-ID: <20200923204911.GA1271664@bogus>
References: <20200918112202.3418-1-thunder.leizhen@huawei.com>
 <20200918112202.3418-6-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918112202.3418-6-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_164914_124132_E2E9E4F1 
X-CRM114-Status: GOOD (  25.89  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Libin <huawei.libin@huawei.com>,
 Vineet Gupta <vgupta@synopsys.com>, Haoyu Lv <lvhaoyu@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2020 at 07:22:01PM +0800, Zhen Lei wrote:
> Convert the Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
> binding to DT schema format using json-schema.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  .../interrupt-controller/snps,dw-apb-ictl.txt      | 43 -------------
>  .../interrupt-controller/snps,dw-apb-ictl.yaml     | 75 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
> deleted file mode 100644
> index 2db59df9408f4c6..000000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
> -
> -Synopsys DesignWare provides interrupt controller IP for APB known as
> -dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs with
> -APB bus, e.g. Marvell Armada 1500. It can also be used as primary interrupt
> -controller in some SoCs, e.g. Hisilicon SD5203.
> -
> -Required properties:
> -- compatible: shall be "snps,dw-apb-ictl"
> -- reg: physical base address of the controller and length of memory mapped
> -  region starting with ENABLE_LOW register
> -- interrupt-controller: identifies the node as an interrupt controller
> -- #interrupt-cells: number of cells to encode an interrupt-specifier, shall be 1
> -
> -Additional required property when it's used as secondary interrupt controller:
> -- interrupts: interrupt reference to primary interrupt controller
> -
> -The interrupt sources map to the corresponding bits in the interrupt
> -registers, i.e.
> -- 0 maps to bit 0 of low interrupts,
> -- 1 maps to bit 1 of low interrupts,
> -- 32 maps to bit 0 of high interrupts,
> -- 33 maps to bit 1 of high interrupts,
> -- (optional) fast interrupts start at 64.
> -
> -Example:
> -	/* dw_apb_ictl is used as secondary interrupt controller */
> -	aic: interrupt-controller@3000 {
> -		compatible = "snps,dw-apb-ictl";
> -		reg = <0x3000 0xc00>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		interrupt-parent = <&gic>;
> -		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> -	};
> -
> -	/* dw_apb_ictl is used as primary interrupt controller */
> -	vic: interrupt-controller@10130000 {
> -		compatible = "snps,dw-apb-ictl";
> -		reg = <0x10130000 0x1000>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
> new file mode 100644
> index 000000000000000..70c12979c843bf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/snps,dw-apb-ictl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
> +
> +maintainers:
> +  - Marc Zyngier <marc.zyngier@arm.com>

Usually this would be an owner for this IP block, not the subsystem 
maintainer.

> +
> +description:
> +  Synopsys DesignWare provides interrupt controller IP for APB known as
> +  dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs
> +  with APB bus, e.g. Marvell Armada 1500. It can also be used as primary
> +  interrupt controller in some SoCs, e.g. Hisilicon SD5203.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

You can drop this, it's already applied based on node name.

> +
> +properties:
> +  compatible:
> +    const: snps,dw-apb-ictl
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    description:
> +      Physical base address of the controller and length of memory mapped
> +      region starting with ENABLE_LOW register.

Need to define how many reg regions (maxItems: 1).

> +
> +  interrupts:
> +    description:
> +      Interrupt reference to primary interrupt controller.
> +
> +      The interrupt sources map to the corresponding bits in the interrupt
> +      registers, i.e.
> +      - 0 maps to bit 0 of low interrupts,
> +      - 1 maps to bit 1 of low interrupts,
> +      - 32 maps to bit 0 of high interrupts,
> +      - 33 maps to bit 1 of high interrupts,
> +      - (optional) fast interrupts start at 64.
> +    minItems: 1
> +    maxItems: 65

65 connections to the primary interrupt controller? I think this is for 
the child interrupts? If so, move to #interrupt-cells description 
instead.

> +
> +  "#interrupt-cells":
> +    description:
> +      Number of cells to encode an interrupt-specifier.

Drop. No need to redefine common properties.

> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +examples:
> +  - |
> +    /* dw_apb_ictl is used as secondary interrupt controller */
> +    aic: interrupt-controller@3000 {
> +        compatible = "snps,dw-apb-ictl";
> +        reg = <0x3000 0xc00>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 3 4>;
> +    };
> +
> +    /* dw_apb_ictl is used as primary interrupt controller */
> +    vic: interrupt-controller@10130000 {
> +        compatible = "snps,dw-apb-ictl";
> +        reg = <0x10130000 0x1000>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };
> -- 
> 1.8.3
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
