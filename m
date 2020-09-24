Return-Path: <SRS0=2kue=DB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE21CC4346E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 03:27:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4291F23600
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 03:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PKxGAR8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4291F23600
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u7HS0dsEu+rp9Uc/yrpsv6yEBZj9lrVUlbhoC2bq+Uo=; b=PKxGAR8k+SnAiHk2UvxK/926Y
	HmoDHkIYSTdNgfe0tkwZGXOxQzcYtAszg+bRGAOrVR7Kl+rNeLaabGQGtr+BrIqyYXsEQFB8bCwAi
	nXzJ/hSold7ol9aw8UPq+JEehq37TmGMydjcXsKQFToZ4V9cS14Bhs/XgbpqVoelvaL705u7rELS2
	nFo8WDJfab3LzkeNsohh8cOLbGLaXswOI1OvRVoehf5Bz1NxDHV4VADGY1Hcw/Gk78DlDTmiPJ0rU
	VQfois35MDMJ2lqqH1oEHULQB1Ba4P+EjXoBF11vbOvRDsbsH6vCZFq3uZ4Fb+SZGZSUm4wtGxi5b
	IpXpfVgNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLHud-0002Ed-LY; Thu, 24 Sep 2020 03:27:15 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLHuW-0002DN-Gp
 for linux-snps-arc@lists.infradead.org; Thu, 24 Sep 2020 03:27:13 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BAD5DE1925281BB33692;
 Thu, 24 Sep 2020 11:26:55 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.253) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 24 Sep 2020 11:26:45 +0800
Subject: Re: [PATCH v5 5/6] dt-bindings: dw-apb-ictl: convert to json-schema
To: Rob Herring <robh@kernel.org>
References: <20200918112202.3418-1-thunder.leizhen@huawei.com>
 <20200918112202.3418-6-thunder.leizhen@huawei.com>
 <20200923204911.GA1271664@bogus>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <c5ba167c-2c66-66ec-9d0c-fe6a5755166f@huawei.com>
Date: Thu, 24 Sep 2020 11:26:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200923204911.GA1271664@bogus>
Content-Language: en-US
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_232712_325219_59B97BD1 
X-CRM114-Status: GOOD (  27.26  )
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



On 2020/9/24 4:49, Rob Herring wrote:
> On Fri, Sep 18, 2020 at 07:22:01PM +0800, Zhen Lei wrote:
>> Convert the Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
>> binding to DT schema format using json-schema.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  .../interrupt-controller/snps,dw-apb-ictl.txt      | 43 -------------
>>  .../interrupt-controller/snps,dw-apb-ictl.yaml     | 75 ++++++++++++++++++++++
>>  2 files changed, 75 insertions(+), 43 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
>> deleted file mode 100644
>> index 2db59df9408f4c6..000000000000000
>> --- a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
>> -
>> -Synopsys DesignWare provides interrupt controller IP for APB known as
>> -dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs with
>> -APB bus, e.g. Marvell Armada 1500. It can also be used as primary interrupt
>> -controller in some SoCs, e.g. Hisilicon SD5203.
>> -
>> -Required properties:
>> -- compatible: shall be "snps,dw-apb-ictl"
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region starting with ENABLE_LOW register
>> -- interrupt-controller: identifies the node as an interrupt controller
>> -- #interrupt-cells: number of cells to encode an interrupt-specifier, shall be 1
>> -
>> -Additional required property when it's used as secondary interrupt controller:
>> -- interrupts: interrupt reference to primary interrupt controller
>> -
>> -The interrupt sources map to the corresponding bits in the interrupt
>> -registers, i.e.
>> -- 0 maps to bit 0 of low interrupts,
>> -- 1 maps to bit 1 of low interrupts,
>> -- 32 maps to bit 0 of high interrupts,
>> -- 33 maps to bit 1 of high interrupts,
>> -- (optional) fast interrupts start at 64.
>> -
>> -Example:
>> -	/* dw_apb_ictl is used as secondary interrupt controller */
>> -	aic: interrupt-controller@3000 {
>> -		compatible = "snps,dw-apb-ictl";
>> -		reg = <0x3000 0xc00>;
>> -		interrupt-controller;
>> -		#interrupt-cells = <1>;
>> -		interrupt-parent = <&gic>;
>> -		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> -	};
>> -
>> -	/* dw_apb_ictl is used as primary interrupt controller */
>> -	vic: interrupt-controller@10130000 {
>> -		compatible = "snps,dw-apb-ictl";
>> -		reg = <0x10130000 0x1000>;
>> -		interrupt-controller;
>> -		#interrupt-cells = <1>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
>> new file mode 100644
>> index 000000000000000..70c12979c843bf0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interrupt-controller/snps,dw-apb-ictl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
>> +
>> +maintainers:
>> +  - Marc Zyngier <marc.zyngier@arm.com>
> 
> Usually this would be an owner for this IP block, not the subsystem 
> maintainer.

OK, I will change it to the author of the file "snps,dw-apb-ictl.txt".


> 
>> +
>> +description:
>> +  Synopsys DesignWare provides interrupt controller IP for APB known as
>> +  dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs
>> +  with APB bus, e.g. Marvell Armada 1500. It can also be used as primary
>> +  interrupt controller in some SoCs, e.g. Hisilicon SD5203.
>> +
>> +allOf:
>> +  - $ref: /schemas/interrupt-controller.yaml#
> 
> You can drop this, it's already applied based on node name.
But if we drop this, the "snps,dw-apb-ictl.yaml" can not require that the node name
must match '^interrupt-controller(@[0-9a-f,]+)*$'. The problem of Patch 6/6 was
discovered by this.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: snps,dw-apb-ictl
>> +
>> +  interrupt-controller: true
>> +
>> +  reg:
>> +    description:
>> +      Physical base address of the controller and length of memory mapped
>> +      region starting with ENABLE_LOW register.
> 
> Need to define how many reg regions (maxItems: 1).

OK, I will add it.

> 
>> +
>> +  interrupts:
>> +    description:
>> +      Interrupt reference to primary interrupt controller.
>> +
>> +      The interrupt sources map to the corresponding bits in the interrupt
>> +      registers, i.e.
>> +      - 0 maps to bit 0 of low interrupts,
>> +      - 1 maps to bit 1 of low interrupts,
>> +      - 32 maps to bit 0 of high interrupts,
>> +      - 33 maps to bit 1 of high interrupts,
>> +      - (optional) fast interrupts start at 64.
>> +    minItems: 1
>> +    maxItems: 65
> 
> 65 connections to the primary interrupt controller? I think this is for 
> the child interrupts? If so, move to #interrupt-cells description 
> instead.
Oh, yes. The property "interrupts" here describes which interrupts are used in the
primary interrupt controller. We don't known how many will be connected but at least one.
I will remove "maxItems: 65", it's my mistake.

Property "#interrupt-cells" describes how many cells of one "interrupts" item. So I will
move these descriptions under the top property "properties:"

> 
>> +
>> +  "#interrupt-cells":
>> +    description:
>> +      Number of cells to encode an interrupt-specifier.
> 
> Drop. No need to redefine common properties.

This is useful. See below, I add "const: 1" to require that the value of
"#interrupt-cells" can only be one.

#interrupt-cells = <1>;

I followed the description in "snps,dw-apb-ictl.txt".
-- #interrupt-cells: number of cells to encode an interrupt-specifier, shall be 1

> 
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +
>> +examples:
>> +  - |
>> +    /* dw_apb_ictl is used as secondary interrupt controller */
>> +    aic: interrupt-controller@3000 {
>> +        compatible = "snps,dw-apb-ictl";
>> +        reg = <0x3000 0xc00>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +        interrupt-parent = <&gic>;
>> +        interrupts = <0 3 4>;
>> +    };
>> +
>> +    /* dw_apb_ictl is used as primary interrupt controller */
>> +    vic: interrupt-controller@10130000 {
>> +        compatible = "snps,dw-apb-ictl";
>> +        reg = <0x10130000 0x1000>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +    };
>> -- 
>> 1.8.3
>>
>>
> 
> .
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
