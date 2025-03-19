Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A1AC35FFA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Mar 2025 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fj52+m6Cowk2zxYHtZF/TJAYQJhIkebQh0PxyDisu/M=; b=WC9XQ8hyQlLYOj
	IJwJ9NvFCRRkGSP0ij3Vb7d88WNuu7ycuDXWOp2n8VViX4KPDJuCrcvsOef8Flx3nGWpNk5ZesKhb
	Ntx0xzzFD0e7YqtG4sFhgbJOCxtwWGOm+mA+hPIll2PZARXSZLKqKchxOuRDwETp0NGaRfGaPfQlY
	syqiMgqtkJ5TR1OA5rRGbsOZmxAJypTNPFqWIZV7JGmxATzWzTfXDB/xnxEX2dtEEQUJs6cny87XR
	mWscp9P9PAQ7MUUmVIvXvcuY8cGj7zDndMHsK5Qn9lHpUaCu/KvPrP7VVduZGUmgeYVPq5NT9dHfa
	5qfrcfRqw++apsZtkezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupqY-00000008Vli-3gTB;
	Wed, 19 Mar 2025 09:36:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuplh-00000008USu-09MT
	for linux-snps-arc@lists.infradead.org;
	Wed, 19 Mar 2025 09:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C44E61607;
	Wed, 19 Mar 2025 09:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A25C4CEEE;
	Wed, 19 Mar 2025 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376679;
	bh=geXQPeT6Ko/A+eBHGZJ7ocWnSItb0Cs6pjE+xVOGMOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4m2YTZ8OjLf+TmKDNW5RsCAiPOC0LiIdFlAEIdw2q97LLMBs4hxW2zjFFq8xqWr7
	 N8maUQYfmeitpGcDqhoRga72NKT/vDb/tNXvHXIabLnp4OzxESyNWMFj/mwm+aA7ss
	 dyyYCHW+vwjlKKp4VU6TbEoUXli5fCLyUsgVKVQPC8LPjkfplkPNnwh3px9rbvRPAS
	 hHa0I3vR7+nTFoJo9WDOcVU7r0ChYyakH3bKEW0OpefBJqKBarYZMb1wS7zgzkpaOi
	 HSpqRonxcjqI5y5yLJIu4d71rIwWhDp2vIuP4WFThDoT9+qyDDTs+xkKxIlDEKYVCs
	 aUI0BmIMSHmzQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 13/57] irqdomain: arc: Switch to irq_domain_create_linear()
Date: Wed, 19 Mar 2025 10:29:06 +0100
Message-ID: <20250319092951.37667-14-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/kernel/intc-arcv2.c   | 2 +-
 arch/arc/kernel/intc-compact.c | 5 +++--
 arch/arc/kernel/mcip.c         | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index fea29d9d18d6..809edc59af25 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -170,7 +170,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
-	root_domain = irq_domain_add_linear(intc, nr_cpu_irqs, &arcv2_irq_ops, NULL);
+	root_domain = irq_domain_create_linear(of_fwnode_handle(intc), nr_cpu_irqs, &arcv2_irq_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
 
diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
index 1d2ff1c6a61b..1b159e9e0234 100644
--- a/arch/arc/kernel/intc-compact.c
+++ b/arch/arc/kernel/intc-compact.c
@@ -112,8 +112,9 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
 	if (parent)
 		panic("DeviceTree incore intc not a root irq controller\n");
 
-	root_domain = irq_domain_add_linear(intc, NR_CPU_IRQS,
-					    &arc_intc_domain_ops, NULL);
+	root_domain = irq_domain_create_linear(of_fwnode_handle(intc),
+					       NR_CPU_IRQS,
+					       &arc_intc_domain_ops, NULL);
 	if (!root_domain)
 		panic("root irq domain not avail\n");
 
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index cdd370ec9280..02b28a9324f4 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -391,7 +391,8 @@ idu_of_init(struct device_node *intc, struct device_node *parent)
 
 	pr_info("MCIP: IDU supports %u common irqs\n", nr_irqs);
 
-	domain = irq_domain_add_linear(intc, nr_irqs, &idu_irq_ops, NULL);
+	domain = irq_domain_create_linear(of_fwnode_handle(intc), nr_irqs,
+					  &idu_irq_ops, NULL);
 
 	/* Parent interrupts (core-intc) are already mapped */
 
-- 
2.49.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
