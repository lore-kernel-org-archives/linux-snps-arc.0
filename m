Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD6EC10F14
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 19:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E4720854
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 19:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIpmMZQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E4720854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfTAWTbJ65r7bXQiUpyu+yRfWK4ApAFJbmP11t6nBS8=; b=HIpmMZQTRZ5f9D
	Do+qTDgGSsi8S4y5tqFmXPx6CjVEAV/9R1b/N7pVnBYwfqnWc/zi2V30+8HhohHRBctFqiVMDSLkm
	u7CZn5tJsGmVzb49qKV3CzdQ4UBsr77XejfDzhJ0H3nyNJ18RGdzoRnrJnBJnU8rRhO3IOTLYMDDh
	e/zTbhouKWcCBxY8jJFzZBIRZ+RKx1e2I0Oz5eu57zYFlPnV7LdUt9DbU+MdE2imhLiYPMWP8fsnO
	+A1Evcm0nvulEcCpE3iJzHHWnB3RTcX4apeYpDSS7a0CpRo8HSpLnTNg5xQXul0+fI8F3NP3MewkY
	5eumAVemQbItcB4Ism0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKSLC-0001Rd-OR; Tue, 15 Oct 2019 19:18:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKSLA-0001Q8-E4
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 19:18:41 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iKSL3-00067i-36; Tue, 15 Oct 2019 21:18:33 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/34] ARC: Use CONFIG_PREEMPTION
Date: Tue, 15 Oct 2019 21:17:51 +0200
Message-Id: <20191015191821.11479-5-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_121840_611948_ECE72863 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Vineet Gupta <vgupta@synopsys.com>, tglx@linutronix.de,
 linux-snps-arc@lists.infradead.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
Both PREEMPT and PREEMPT_RT require the same functionality which today
depends on CONFIG_PREEMPT.

Switch the entry code over to use CONFIG_PREEMPTION.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arc/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 72be01270e246..1f6bb184a44db 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -337,11 +337,11 @@ ENTRY(ret_from_exception)
 resume_kernel_mode:
 
 	; Disable Interrupts from this point on
-	; CONFIG_PREEMPT: This is a must for preempt_schedule_irq()
-	; !CONFIG_PREEMPT: To ensure restore_regs is intr safe
+	; CONFIG_PREEMPTION: This is a must for preempt_schedule_irq()
+	; !CONFIG_PREEMPTION: To ensure restore_regs is intr safe
 	IRQ_DISABLE	r9
 
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 
 	; Can't preempt if preemption disabled
 	GET_CURR_THR_INFO_FROM_SP   r10
-- 
2.23.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
