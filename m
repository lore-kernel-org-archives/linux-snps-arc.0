Return-Path: <SRS0=L1eD=DC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15720C4363D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Sep 2020 15:55:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE3A206D4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Sep 2020 15:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJJYyEXR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpbfOezw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE3A206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=svpeYLxas9c3Wfhne0WtpgGvhELufuE30QYYqn97Kq8=; b=WJJYyEXRXAe8DVYBQM36OXa9i
	2HUL/ddQU4bieaDRTpyThrS0T7tTXFu6YUHBVHkL1BymMqlTDceREbwcTP0mkGo2vMHOzRjooSp43
	7uIMw+NTomQt/Yn2FEGyl0CuQiBHp/rESxrqbWvgvCN2CAu4gWQkrf3KXmybX15gKpaU/56i/vJXr
	vMj2lUzWBJDGH5JjdyCNUjcYh1m34q3RuCxrlKWEpAyKBMwb+CVlprVAgL1adhijzt9YxrjMx93Oc
	B6z8RiHdom1Aw1Wzn7HSRxuEyLAieVFoJz+TDp6oLdmVeJHmfV1JlMML7ekbzoIjS5DpRYwnFN6hI
	ekWUKXWRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLq4J-00040u-27; Fri, 25 Sep 2020 15:55:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLq4G-0003z9-Kx
 for linux-snps-arc@lists.infradead.org; Fri, 25 Sep 2020 15:55:29 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 276D221741;
 Fri, 25 Sep 2020 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601049327;
 bh=ZOaMTpjmL0zyawSe6TesNRPIJMd8LiPQDHGoQQoPA9k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DpbfOezwca7Q+jKjYXy+IngxuRfB2l0oJhJKOipIgoZOtqTejdpCrvavFmfJwutm2
 KZTJj6kpqa3YmO4PvwT0wae57xcvfMuiYRCU99FvmQ4sAE7KEPtpaQVL/LL6IFru5D
 qWCpCdhGHRc9kV9UmRc1vfxy+hkfWPGWXV5Ta7co=
Received: from [185.69.144.225] (helo=localhost.localdomain)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kLq4D-00EuVG-7e; Fri, 25 Sep 2020 16:55:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Rob Herring <robh+dt@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 0/6] irqchip: dw-apb-ictl: support hierarchy irq domain
Date: Fri, 25 Sep 2020 16:54:50 +0100
Message-Id: <160104911402.38543.3098076840902954515.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924071754.4509-1-thunder.leizhen@huawei.com>
References: <20200924071754.4509-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.69.144.225
X-SA-Exim-Rcpt-To: vgupta@synopsys.com, thunder.leizhen@huawei.com,
 robh+dt@kernel.org, abrodkin@synopsys.com, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jason@lakedaemon.net,
 tglx@linutronix.de, wangkefeng.wang@huawei.com, lvhaoyu@huawei.com,
 sebastian.hesselbarth@gmail.com, huawei.libin@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_115528_815639_7A8653BD 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, 24 Sep 2020 15:17:48 +0800, Zhen Lei wrote:
> v5 --> v6:
> 1. add Reviewed-by: Rob Herring <robh@kernel.org> for Patch 4.
> 2. Some modifications are made to Patch 5:
>    1) add " |" for each "description:" property if its content exceeds one line,
>       to tell the yaml keep the "newline" character.
>    2) add "..." to mark the end of the yaml file.
>    3) Change the name list of maintainers to the author of "snps,dw-apb-ictl.txt"
> 	 maintainers:
> 	-  - Marc Zyngier <marc.zyngier@arm.com>
> 	+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>    4) add "maxItems: 1" for property "reg".
>    5) for property "interrupts":
> 	 interrupts:
> 	-    minItems: 1
> 	-    maxItems: 65
> 	+    maxItems: 1
>    6) move below descriptions under the top level property "description:"
> 	description: |
> 	  Synopsys DesignWare provides interrupt controller IP for APB known as
> 	  dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs
> 	  with APB bus, e.g. Marvell Armada 1500. It can also be used as primary
> 	  interrupt controller in some SoCs, e.g. Hisilicon SD5203.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/6] genirq: Add stub for set_handle_irq() when !GENERIC_IRQ_MULTI_HANDLER
      commit: ea0c80d1764449acf2f70fdb25aec33800cd0348
[2/6] irqchip/dw-apb-ictl: Refactor priot to introducing hierarchical irq domains
      commit: d59f7d159891466361808522b63cf3548ea3ecb0
[3/6] irqchip/dw-apb-ictl: Add primary interrupt controller support
      commit: 54a38440b84f8933b555c23273deca6a396f6708
[4/6] dt-bindings: dw-apb-ictl: Update binding to describe use as primary interrupt controller
      commit: 8156b80fd4885d0ca9748e736441cc37f4eb476a

I have dropped patch 5 as it doesn't have Rob's Ack yet (and is not that
critical) as well as patch 6 which is better routed via the ARC tree.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
