Return-Path: <SRS0=51Ju=DF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9767C47420
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 18:26:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55613207C4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 18:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HeT8/Avw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55613207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jzIk7T3YrWctD3+OYs7fsiqZ9GICGlTG94eGtoJQw+0=; b=HeT8/Avw18NhHSrlaV2O6EQ83
	L/xX896MpoDD2jmMV1F01BNK5VY2KivQT3AlByxrUJEoUtXH0OXvFbvJdLPsx1Y0/boZl750p2l4V
	aRjNtg0h56Dm3UfT7jmlOUVJUoBX1Lw4OLHC8US5iud6BRSmFzfWYNR5BMlm3CbjWdVcORl75cZj2
	rDpygAUj4HDsUWySBxs8GK7W7KJsVkoWv/bp1MNsYMuIqcpXJthL+ZAHXL29z3T9pJmN3ofV82hcF
	mwRDI7V/HpWkB95N5ThufuDfsdM5pRbf5AntHFq8OEW2nxCTISjRjSIP+2uP0ps/3waHivcLFjLig
	uQNGF+dfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMxrN-0006ko-CA; Mon, 28 Sep 2020 18:26:49 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMxrL-0006kH-AB
 for linux-snps-arc@lists.infradead.org; Mon, 28 Sep 2020 18:26:48 +0000
Received: by mail-ot1-f67.google.com with SMTP id m13so1886570otl.9
 for <linux-snps-arc@lists.infradead.org>; Mon, 28 Sep 2020 11:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G1vwfsWv+nq29PSP/iaujHaq9i9b/1+o4mAfvtqnkwo=;
 b=qMq6stzS2cAOLSSMUOJCgXoHikl6+hiMafO5LtRdJIFXpjwNYV25MiiC9teR3i0HbO
 zJ8zF2jzXC32KqlyHjCRC+i119lTGaTLtItIDThYJkEzQbfMzL5Ua68/LRbh8kBtmYlo
 zXb1fEhITF4ccEcrk3uRKuF6/cLavPTcxRG+y9wazJeaEwHksF67RIRD0WuyMSA7jnHp
 qeLUslNlOB34+RNVy7hVMNsPkAUs3EPs5gjztBVjclfjys9xskxFwxAoeEMkRsJlu/aJ
 WWFl7wAeyEJkPlqluYgmAjcgx43luUdOE59Lu4CFepDp3X45ExeIRiOhVAAdW370Kqcn
 be9g==
X-Gm-Message-State: AOAM5315VKmQsHfUjLBhW5RpmekPM9EzxpZfEDzVLhJwxW1YJS7UNK40
 vEnl1Z95KqkGIwcwo5fdAQ==
X-Google-Smtp-Source: ABdhPJzYAL9LwZzfn2QuSt+o6WBf2CTQqamn+zjxWQUMfB3YNQVhCn8BpjzmmQF5xSIIjJ5DUgbCfw==
X-Received: by 2002:a9d:4c0a:: with SMTP id l10mr208079otf.166.1601317606779; 
 Mon, 28 Sep 2020 11:26:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s124sm382104oig.6.2020.09.28.11.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 11:26:46 -0700 (PDT)
Received: (nullmailer pid 3035690 invoked by uid 1000);
 Mon, 28 Sep 2020 18:26:45 -0000
Date: Mon, 28 Sep 2020 13:26:45 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: dw-apb-ictl: convert to json-schema
Message-ID: <20200928182645.GA3030999@bogus>
References: <20200924071754.4509-1-thunder.leizhen@huawei.com>
 <20200924071754.4509-6-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924071754.4509-6-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_142647_377344_304A35F4 
X-CRM114-Status: GOOD (  24.98  )
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

On Thu, Sep 24, 2020 at 03:17:53PM +0800, Zhen Lei wrote:
> Convert the Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
> binding to DT schema format using json-schema.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  .../interrupt-controller/snps,dw-apb-ictl.txt      | 43 -------------
>  .../interrupt-controller/snps,dw-apb-ictl.yaml     | 74 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 43 deletions(-)
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
> index 000000000000000..1b05d36b5f7b943
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/snps,dw-apb-ictl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
> +
> +maintainers:
> +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> +
> +description: |
> +  Synopsys DesignWare provides interrupt controller IP for APB known as
> +  dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs
> +  with APB bus, e.g. Marvell Armada 1500. It can also be used as primary
> +  interrupt controller in some SoCs, e.g. Hisilicon SD5203.
> +
> +  The interrupt sources map to the corresponding bits in the interrupt
> +  registers, i.e.
> +  - 0 maps to bit 0 of low interrupts,
> +  - 1 maps to bit 1 of low interrupts,
> +  - 32 maps to bit 0 of high interrupts,
> +  - 33 maps to bit 1 of high interrupts,
> +  - (optional) fast interrupts start at 64.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Don't need this. It's already selected based on node name.

> +
> +properties:
> +  compatible:
> +    const: snps,dw-apb-ictl
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    description: |
> +      Physical base address of the controller and length of memory mapped
> +      region starting with ENABLE_LOW register.
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Interrupt reference to primary interrupt controller.

May not be primary. Could be another level in the middle. In any case, 
it's outside the scope of this binding, so just drop description.

> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    description: Number of cells to encode an interrupt-specifier.

Can drop this.

> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'

additionalProperties: false

> +
> +examples:
> +  - |
> +    /* dw_apb_ictl is used as secondary interrupt controller */
> +    aic: interrupt-controller@3000 {

Drop unused label (aic).

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

Same here.

> +        compatible = "snps,dw-apb-ictl";
> +        reg = <0x10130000 0x1000>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };
> +...
> -- 
> 1.8.3
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
