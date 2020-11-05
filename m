Return-Path: <SRS0=YnoV=EL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB675C4741F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 21:23:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3762F20724
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 21:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGAUXVRs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fp79djYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3762F20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZEg7pnzZrH7VoWd3bcaDtAphh/eVZ/otAUzUAjWiScg=; b=TGAUXVRscYUFXD+1NRG9l8Q7S
	fv6BEwEA12WCOmAkevXrheXK6IukrzYgV5H93rue3BjpWp6btyBMR26v/IC1SmuOh5lmxt7nj5r+A
	uxXHLp2a3ss2iwPDRQsOXpnjCrzQBibzUZ+9dQK9nJjhR5IRWZGOT/LW7vvRpG0gUjTv3hTrHYuq1
	QkkQdS52oKcaC+27yqtPbzleUMgDWzr/68bK6XtvmkqRqo5jndn2ccUD0e6XgeLmV+0l94n0YhAo2
	/k93pptBP19l2renudkSnJU6AABZBLbgHHEM+Nimp8VjeG0Ap5QG1exzbqPZ7vLw8CNRklK/VTv5v
	ru/i98eFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kamim-0004KA-18; Thu, 05 Nov 2020 21:23:04 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kami3-0003xB-6X
 for linux-snps-arc@lists.infradead.org; Thu, 05 Nov 2020 21:22:28 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 323CCC008F;
 Thu,  5 Nov 2020 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604611338; bh=fyTwVAwOCEBuyIL7L7IGZXFLyc22o/eT5cCTL6DoEOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fp79djYQXBxpi7P9zD1Vm/AtB4p8IwXLEFI+QOmEiNqEN+LrWhL5+EZoyyF1B4HAf
 Verx9uVJLdLecFX2RKsyIZNDcS2wZslp/49PcccfsRdI9tm7LC/1bTSP9F/+X2g5tC
 2W5yZYO1ybs/u0x98bAfi/QxjZMtay2VVE3T93R4cK9/bhbtU+WRO26FBlr6Jk5OXf
 yhL7U3a2KR+QpLjJ885k3MvLixURASLjLO5wLzICfhNJibS8N4U1MvzUnHMbRm8A3W
 6c03tF4ZyQI3LWN/9CaQf98/DvRoc7m4tmcVM8fsSaIIdt9mv1iV5ZTV9G4HFhD1SO
 BV90YlLJjpNew==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id B6D04A006F;
 Thu,  5 Nov 2020 21:22:17 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/3] drivers/irqchip: Remove EZChip NPS interrupt controller
Date: Thu,  5 Nov 2020 13:22:09 -0800
Message-Id: <20201105212210.1891598-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105212210.1891598-1-vgupta@synopsys.com>
References: <20201105212210.1891598-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_162219_595228_C30D1D25 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Marc Zyngier <maz@kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

NPS platform has been removed from ARC port and there are no in-tree
users of it now. So RIP !

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 drivers/irqchip/Kconfig     |   7 --
 drivers/irqchip/Makefile    |   1 -
 drivers/irqchip/irq-eznps.c | 165 ------------------------------------
 3 files changed, 173 deletions(-)
 delete mode 100644 drivers/irqchip/irq-eznps.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c6098eee0c7c..7920c3a3017d 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -389,13 +389,6 @@ config LS_SCFG_MSI
 config PARTITION_PERCPU
 	bool
 
-config EZNPS_GIC
-	bool "NPS400 Global Interrupt Manager (GIM)"
-	depends on ARC || (COMPILE_TEST && !64BIT)
-	select IRQ_DOMAIN
-	help
-	  Support the EZchip NPS400 global interrupt controller
-
 config STM32_EXTI
 	bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 94c2885882ee..0ac93bfaec61 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -86,7 +86,6 @@ obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
 obj-$(CONFIG_MVEBU_SEI)			+= irq-mvebu-sei.o
 obj-$(CONFIG_LS_EXTIRQ)			+= irq-ls-extirq.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
-obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
diff --git a/drivers/irqchip/irq-eznps.c b/drivers/irqchip/irq-eznps.c
deleted file mode 100644
index 2a7a38830a8d..000000000000
--- a/drivers/irqchip/irq-eznps.c
+++ /dev/null
@@ -1,165 +0,0 @@
-/*
- * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
- *
- * This software is available to you under a choice of one of two
- * licenses.  You may choose to be licensed under the terms of the GNU
- * General Public License (GPL) Version 2, available from the file
- * COPYING in the main directory of this source tree, or the
- * OpenIB.org BSD license below:
- *
- *     Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *      - Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *
- *      - Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- */
-
-#include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
-#include <linux/irqchip.h>
-#include <soc/nps/common.h>
-
-#define NPS_NR_CPU_IRQS 8  /* number of interrupt lines of NPS400 CPU */
-#define NPS_TIMER0_IRQ  3
-
-/*
- * NPS400 core includes an Interrupt Controller (IC) support.
- * All cores can deactivate level irqs at first level control
- * at cores mesh layer called MTM.
- * For devices out side chip e.g. uart, network there is another
- * level called Global Interrupt Manager (GIM).
- * This second level can control level and edge interrupt.
- *
- * NOTE: AUX_IENABLE and CTOP_AUX_IACK are auxiliary registers
- * with private HW copy per CPU.
- */
-
-static void nps400_irq_mask(struct irq_data *irqd)
-{
-	unsigned int ienb;
-	unsigned int irq = irqd_to_hwirq(irqd);
-
-	ienb = read_aux_reg(AUX_IENABLE);
-	ienb &= ~(1 << irq);
-	write_aux_reg(AUX_IENABLE, ienb);
-}
-
-static void nps400_irq_unmask(struct irq_data *irqd)
-{
-	unsigned int ienb;
-	unsigned int irq = irqd_to_hwirq(irqd);
-
-	ienb = read_aux_reg(AUX_IENABLE);
-	ienb |= (1 << irq);
-	write_aux_reg(AUX_IENABLE, ienb);
-}
-
-static void nps400_irq_eoi_global(struct irq_data *irqd)
-{
-	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
-
-	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
-
-	/* Don't ack GIC before all device access attempts are done */
-	mb();
-
-	nps_ack_gic();
-}
-
-static void nps400_irq_ack(struct irq_data *irqd)
-{
-	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
-
-	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
-}
-
-static struct irq_chip nps400_irq_chip_fasteoi = {
-	.name		= "NPS400 IC Global",
-	.irq_mask	= nps400_irq_mask,
-	.irq_unmask	= nps400_irq_unmask,
-	.irq_eoi	= nps400_irq_eoi_global,
-};
-
-static struct irq_chip nps400_irq_chip_percpu = {
-	.name		= "NPS400 IC",
-	.irq_mask	= nps400_irq_mask,
-	.irq_unmask	= nps400_irq_unmask,
-	.irq_ack	= nps400_irq_ack,
-};
-
-static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
-			  irq_hw_number_t hw)
-{
-	switch (hw) {
-	case NPS_TIMER0_IRQ:
-#ifdef CONFIG_SMP
-	case NPS_IPI_IRQ:
-#endif
-		irq_set_percpu_devid(virq);
-		irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
-					 handle_percpu_devid_irq);
-		break;
-	default:
-		irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
-					 handle_fasteoi_irq);
-		break;
-	}
-
-	return 0;
-}
-
-static const struct irq_domain_ops nps400_irq_ops = {
-	.xlate = irq_domain_xlate_onecell,
-	.map = nps400_irq_map,
-};
-
-static int __init nps400_of_init(struct device_node *node,
-				 struct device_node *parent)
-{
-	struct irq_domain *nps400_root_domain;
-
-	if (parent) {
-		pr_err("DeviceTree incore ic not a root irq controller\n");
-		return -EINVAL;
-	}
-
-	nps400_root_domain = irq_domain_add_linear(node, NPS_NR_CPU_IRQS,
-						   &nps400_irq_ops, NULL);
-
-	if (!nps400_root_domain) {
-		pr_err("nps400 root irq domain not avail\n");
-		return -ENOMEM;
-	}
-
-	/*
-	 * Needed for primary domain lookup to succeed
-	 * This is a primary irqchip, and can never have a parent
-	 */
-	irq_set_default_host(nps400_root_domain);
-
-#ifdef CONFIG_SMP
-	irq_create_mapping(nps400_root_domain, NPS_IPI_IRQ);
-#endif
-
-	return 0;
-}
-IRQCHIP_DECLARE(ezchip_nps400_ic, "ezchip,nps400-ic", nps400_of_init);
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
