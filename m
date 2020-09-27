Return-Path: <SRS0=tRi/=DE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AF4C4346E
	for <linux-snps-arc@archiver.kernel.org>; Sun, 27 Sep 2020 06:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C2B2388B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 27 Sep 2020 06:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5IzGcDT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C2B2388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/z0cviWR5iEbIJxsUZAOReA0Tw4W7uFm3KIiNH8lCqs=; b=d5IzGcDTyNwhYU9hk5fyFSVU1
	+enMQaeU/L/HemLKeLX6sU2aCQxUynXhUcXagmpHui2PJpc6Uq2XDXxzorhTYjRVH1epX7uSlOLYR
	wlVIf3t44Oj+yEBUzn7w91KGYrBfqoCDCp5YXTzjpPnx2pNYWuoKiBeoQ8pICnkUoE47+nAEX9LTv
	HGVjp43YcK4dd71BnmZkErLmlwA+2veBvDTxLTzeGXcX2UdkIQgYI4r43zn/sPR0xl3sjKU9Gt9yy
	09PSstEj4olawAXEbE714f13A1uknctI+alH0OXU5WAf3ISsEDqVDcLM0zVjH3NzjgQBXhae16DOf
	f3Zk6RjQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMQV7-0001Lu-Cr; Sun, 27 Sep 2020 06:49:37 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMQV3-0001Kw-V0
 for linux-snps-arc@lists.infradead.org; Sun, 27 Sep 2020 06:49:35 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 41C6E69F3BB150381954;
 Sun, 27 Sep 2020 14:49:23 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.253) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Sun, 27 Sep 2020 14:49:14 +0800
Subject: Re: [PATCH v6 0/6] irqchip: dw-apb-ictl: support hierarchy irq domain
To: Marc Zyngier <maz@kernel.org>, Vineet Gupta <vgupta@synopsys.com>, "Rob
 Herring" <robh+dt@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>, devicetree
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>
References: <20200924071754.4509-1-thunder.leizhen@huawei.com>
 <160104911402.38543.3098076840902954515.b4-ty@kernel.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <f6436e0d-dbed-5455-134f-e209f2a3b131@huawei.com>
Date: Sun, 27 Sep 2020 14:49:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <160104911402.38543.3098076840902954515.b4-ty@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_024934_909372_209A993A 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Haoyu Lv <lvhaoyu@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Libin <huawei.libin@huawei.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 2020/9/25 23:54, Marc Zyngier wrote:
> On Thu, 24 Sep 2020 15:17:48 +0800, Zhen Lei wrote:
>> v5 --> v6:
>> 1. add Reviewed-by: Rob Herring <robh@kernel.org> for Patch 4.
>> 2. Some modifications are made to Patch 5:
>>    1) add " |" for each "description:" property if its content exceeds one line,
>>       to tell the yaml keep the "newline" character.
>>    2) add "..." to mark the end of the yaml file.
>>    3) Change the name list of maintainers to the author of "snps,dw-apb-ictl.txt"
>> 	 maintainers:
>> 	-  - Marc Zyngier <marc.zyngier@arm.com>
>> 	+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>>    4) add "maxItems: 1" for property "reg".
>>    5) for property "interrupts":
>> 	 interrupts:
>> 	-    minItems: 1
>> 	-    maxItems: 65
>> 	+    maxItems: 1
>>    6) move below descriptions under the top level property "description:"
>> 	description: |
>> 	  Synopsys DesignWare provides interrupt controller IP for APB known as
>> 	  dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs
>> 	  with APB bus, e.g. Marvell Armada 1500. It can also be used as primary
>> 	  interrupt controller in some SoCs, e.g. Hisilicon SD5203.
>>
>> [...]
> 
> Applied to irq/irqchip-next, thanks!

Thank you very much. You have provided a lot of valuable review of this patch series.

> 
> [1/6] genirq: Add stub for set_handle_irq() when !GENERIC_IRQ_MULTI_HANDLER
>       commit: ea0c80d1764449acf2f70fdb25aec33800cd0348
> [2/6] irqchip/dw-apb-ictl: Refactor priot to introducing hierarchical irq domains
>       commit: d59f7d159891466361808522b63cf3548ea3ecb0
> [3/6] irqchip/dw-apb-ictl: Add primary interrupt controller support
>       commit: 54a38440b84f8933b555c23273deca6a396f6708
> [4/6] dt-bindings: dw-apb-ictl: Update binding to describe use as primary interrupt controller
>       commit: 8156b80fd4885d0ca9748e736441cc37f4eb476a
> 
> I have dropped patch 5 as it doesn't have Rob's Ack yet (and is not that
> critical) as well as patch 6 which is better routed via the ARC tree.

OK. I will continue talking to Rob about patch 5. Rob suggested me to remove below allOf, but I have not
done it. If the allOf should be removed, the 6/6 will be discarded.
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#

> 
> Cheers,
> 
> 	M.
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
