Return-Path: <SRS0=3D0g=C3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE39AC43463
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Sep 2020 11:23:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B5921D42
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Sep 2020 11:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2jG0MiD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B5921D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UW/BlUxmX+tZgPLRNIL+SgeINN1DyvoHzt6amyeN3gA=; b=D2jG0MiDc8D6IpanXOslUk3T6
	uNjZxGjuCLuBWcWaYY6eKKkm6OLulHUOZUNtdAGIsQ9RqSbhLssS2v7sSPUbr07izFB6v4incMt4i
	lK92wbgqz9Ev+leJUT3nm8D8/7HQc93c0EQ8WefopzaW0oqjOkFNTt2O0Xg6MDdzAgueaZW4Ji6T3
	ly2KmMy2omzRIAmPNBtnUvyAXTqic3h+MTzJo2+7Fkm4t7TmAL2elG2GFiAtXfaOYiZNfVfO8il/0
	WxbPK4rvLsg3GmrKwV8VIWImEFi3XelixHzizin8kSQD2g9yU1SRTceJtrKPyafp7UytbYi2HUqB4
	KTVbMevng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJETp-0001yH-Hf; Fri, 18 Sep 2020 11:23:05 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJETk-0001vf-4x
 for linux-snps-arc@lists.infradead.org; Fri, 18 Sep 2020 11:23:02 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 225C0F4620A62FDC9C63;
 Fri, 18 Sep 2020 19:22:57 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.253) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 19:22:48 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>, linux-snps-arc
 <linux-snps-arc@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/6] dt-bindings: dw-apb-ictl: support hierarchy irq domain
Date: Fri, 18 Sep 2020 19:22:00 +0800
Message-ID: <20200918112202.3418-5-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200918112202.3418-1-thunder.leizhen@huawei.com>
References: <20200918112202.3418-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_072300_425998_9C608A08 
X-CRM114-Status: GOOD (  10.67  )
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

Add support to use dw-apb-ictl as primary interrupt controller.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 .../bindings/interrupt-controller/snps,dw-apb-ictl.txt     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
index 086ff08322db94f..2db59df9408f4c6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,dw-apb-ictl.txt
@@ -2,7 +2,8 @@ Synopsys DesignWare APB interrupt controller (dw_apb_ictl)
 
 Synopsys DesignWare provides interrupt controller IP for APB known as
 dw_apb_ictl. The IP is used as secondary interrupt controller in some SoCs with
-APB bus, e.g. Marvell Armada 1500.
+APB bus, e.g. Marvell Armada 1500. It can also be used as primary interrupt
+controller in some SoCs, e.g. Hisilicon SD5203.
 
 Required properties:
 - compatible: shall be "snps,dw-apb-ictl"
@@ -10,6 +11,8 @@ Required properties:
   region starting with ENABLE_LOW register
 - interrupt-controller: identifies the node as an interrupt controller
 - #interrupt-cells: number of cells to encode an interrupt-specifier, shall be 1
+
+Additional required property when it's used as secondary interrupt controller:
 - interrupts: interrupt reference to primary interrupt controller
 
 The interrupt sources map to the corresponding bits in the interrupt
@@ -21,6 +24,7 @@ registers, i.e.
 - (optional) fast interrupts start at 64.
 
 Example:
+	/* dw_apb_ictl is used as secondary interrupt controller */
 	aic: interrupt-controller@3000 {
 		compatible = "snps,dw-apb-ictl";
 		reg = <0x3000 0xc00>;
@@ -29,3 +33,11 @@ Example:
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	/* dw_apb_ictl is used as primary interrupt controller */
+	vic: interrupt-controller@10130000 {
+		compatible = "snps,dw-apb-ictl";
+		reg = <0x10130000 0x1000>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
-- 
1.8.3



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
