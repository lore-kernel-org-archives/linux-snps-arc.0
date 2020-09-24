Return-Path: <SRS0=2kue=DB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4F8C47428
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 07:19:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFC82376F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 07:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUVI5BiV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFC82376F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mYbQCe5znuh6t+q7/zorFTKHfikssENZIts6fszp6vg=; b=sUVI5BiVHpxhLeoTsnQ68PqPy
	Q3Gw//lCstLmgXFP3ZgHYuKJpbWaQF/FjftzT0Qzw+oHWKI4RTOm5apIIs+Tp2xkH2NGngBO15Yn9
	NONjZQXP+65/4IgEFnUp4U10dz20gIm9z485R163kKXA77WqzS66pC+w1KdD8ZMT3354c19JTsNjD
	H+4Wxrc0pF/PqxLX1SDQAyGO79xWk753HCtAwtsWFWDAMckXkYhTMK0kAArj9HqTHjK/r4QFdGzsz
	VDsuLlmQANMMTTvcI30oCzN76HSLGlncEEeYXWNYnb3Sq8rIheIlgvPkApcj76gZ0z2Ypz2bZ+q5n
	CHDUin7vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLLXg-0004Wy-2r; Thu, 24 Sep 2020 07:19:48 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLLXa-0004TE-6d
 for linux-snps-arc@lists.infradead.org; Thu, 24 Sep 2020 07:19:45 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1842825956AD73B710B;
 Thu, 24 Sep 2020 15:19:37 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.253) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 15:19:26 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>, linux-snps-arc
 <linux-snps-arc@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/6] irqchip: dw-apb-ictl: prepare for support hierarchy
 irq domain
Date: Thu, 24 Sep 2020 15:17:50 +0800
Message-ID: <20200924071754.4509-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200924071754.4509-1-thunder.leizhen@huawei.com>
References: <20200924071754.4509-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_031942_595694_B166F7F5 
X-CRM114-Status: GOOD (  12.14  )
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
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Libin <huawei.libin@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Rename some functions and variables in advance, to make the next patch
looks more clear. The details are as follows:
1. rename dw_apb_ictl_handler() to dw_apb_ictl_handle_irq_cascaded().
2. change (1 << hwirq) to BIT(hwirq).

In function dw_apb_ictl_init():
1. rename local variable irq to parent_irq.
2. add "const struct irq_domain_ops *domain_ops = &irq_generic_chip_ops",
   then replace &irq_generic_chip_ops in other places with domain_ops.

No functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Tested-by: Haoyu Lv <lvhaoyu@huawei.com>
---
 drivers/irqchip/irq-dw-apb-ictl.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-dw-apb-ictl.c b/drivers/irqchip/irq-dw-apb-ictl.c
index e4550e9c810ba94..5458004242e9d20 100644
--- a/drivers/irqchip/irq-dw-apb-ictl.c
+++ b/drivers/irqchip/irq-dw-apb-ictl.c
@@ -26,7 +26,7 @@
 #define APB_INT_FINALSTATUS_H	0x34
 #define APB_INT_BASE_OFFSET	0x04
 
-static void dw_apb_ictl_handler(struct irq_desc *desc)
+static void dw_apb_ictl_handle_irq_cascaded(struct irq_desc *desc)
 {
 	struct irq_domain *d = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -43,7 +43,7 @@ static void dw_apb_ictl_handler(struct irq_desc *desc)
 			u32 virq = irq_find_mapping(d, gc->irq_base + hwirq);
 
 			generic_handle_irq(virq);
-			stat &= ~(1 << hwirq);
+			stat &= ~BIT(hwirq);
 		}
 	}
 
@@ -73,12 +73,13 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
 	void __iomem *iobase;
-	int ret, nrirqs, irq, i;
+	int ret, nrirqs, parent_irq, i;
 	u32 reg;
+	const struct irq_domain_ops *domain_ops = &irq_generic_chip_ops;
 
 	/* Map the parent interrupt for the chained handler */
-	irq = irq_of_parse_and_map(np, 0);
-	if (irq <= 0) {
+	parent_irq = irq_of_parse_and_map(np, 0);
+	if (parent_irq <= 0) {
 		pr_err("%pOF: unable to parse irq\n", np);
 		return -EINVAL;
 	}
@@ -120,8 +121,7 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 	else
 		nrirqs = fls(readl_relaxed(iobase + APB_INT_ENABLE_L));
 
-	domain = irq_domain_add_linear(np, nrirqs,
-				       &irq_generic_chip_ops, NULL);
+	domain = irq_domain_add_linear(np, nrirqs, domain_ops, NULL);
 	if (!domain) {
 		pr_err("%pOF: unable to add irq domain\n", np);
 		ret = -ENOMEM;
@@ -146,7 +146,8 @@ static int __init dw_apb_ictl_init(struct device_node *np,
 		gc->chip_types[0].chip.irq_resume = dw_apb_ictl_resume;
 	}
 
-	irq_set_chained_handler_and_data(irq, dw_apb_ictl_handler, domain);
+	irq_set_chained_handler_and_data(parent_irq,
+				dw_apb_ictl_handle_irq_cascaded, domain);
 
 	return 0;
 
-- 
1.8.3



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
