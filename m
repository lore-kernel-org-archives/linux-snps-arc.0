Return-Path: <SRS0=GYWY=OO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8A2C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Sep 2021 02:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A57760F6F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Sep 2021 02:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A57760F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ucS4C3CoJCvkcWG4UewxdMyC19AmdDdbz9jCtdiQz00=; b=dBV1NmLWtle52O
	8wFIBd6A/SkyQMCo6XXzYmiH2cR0fMXxzK67Eu3tcE38XpLCaM0PEgzDggHBJmOfj1sReUGs0GEZn
	9+ON27qjqrxvYCwQWI2ZwhDyAq8Z/0JDY1C+2bZCuL2y8sc2le1SGkwnGIRK+gpylb0rUo1KZpUO5
	LbIwjmRDev8Elrz6xeS3mcdZXIYte8r6iVQZBDlm2DkB4o185MsQaFhAvD7c23maNYk9QbtDaNaGx
	i8VEI/XMZrxnOpecv1OLBIob1HnwPr29INR0UcaLQVijivMHw3aodl4kZpojYDS01zM3It+AgsqHU
	LnU9N0Z4hyQ1+S9Rukow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTadX-00Ctpt-1u; Fri, 24 Sep 2021 02:08:27 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTadW-00Ctpd-3d; Fri, 24 Sep 2021 02:08:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Subject: [PATCH v2] clocksource: arc_timer: eliminate redefined macro error
Date: Thu, 23 Sep 2021 19:08:25 -0700
Message-Id: <20210924020825.20317-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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

In drivers/clocksource/, 3 drivers use "TIMER_CTRL_IE" with 3 different
values.  Two of them (mps2-timer.c and timer-sp804.c/timer-sp.h) are
localized and left unmodifed.

One of them uses a shared header file (<soc/arc/timers.h>), which is
what is causing the "redefined" warnings, so change the macro name in
that driver only. Also change the TIMER_CTRL_NH macro name.
Both macro names are prefixed with "ARC_" to reduce the likelihood
of future name collisions.

In file included from ../drivers/clocksource/timer-sp804.c:24:
../drivers/clocksource/timer-sp.h:25: error: "TIMER_CTRL_IE" redefined [-Werror]
   25 | #define TIMER_CTRL_IE           (1 << 5)        /*   VR */
../include/soc/arc/timers.h:20: note: this is the location of the previous definition
   20 | #define TIMER_CTRL_IE           (1 << 0) /* Interrupt when Count reaches limit */

Fixes: b26c2e3823ba ("ARC: breakout timer include code into separate header")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
---
v2: prefix both TIMER_CTRL_xx macros with ARC_ (suggested by
    Shahab Vahedi <Shahab.Vahedi@synopsys.com>

 drivers/clocksource/arc_timer.c |    6 +++---
 include/soc/arc/timers.h        |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

--- linux-next-20210917.orig/include/soc/arc/timers.h
+++ linux-next-20210917/include/soc/arc/timers.h
@@ -17,8 +17,8 @@
 #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
 
 /* CTRL reg bits */
-#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
-#define TIMER_CTRL_NH	        (1 << 1) /* Count only when CPU NOT halted */
+#define ARC_TIMER_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
+#define ARC_TIMER_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
 
 #define ARC_TIMERN_MAX		0xFFFFFFFF
 
--- linux-next-20210917.orig/drivers/clocksource/arc_timer.c
+++ linux-next-20210917/drivers/clocksource/arc_timer.c
@@ -225,7 +225,7 @@ static int __init arc_cs_setup_timer1(st
 
 	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMERN_MAX);
 	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
-	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER1_CTRL, ARC_TIMER_CTRL_NH);
 
 	sched_clock_register(arc_timer1_clock_read, 32, arc_timer_freq);
 
@@ -245,7 +245,7 @@ static void arc_timer_event_setup(unsign
 	write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
 	write_aux_reg(ARC_REG_TIMER0_CNT, 0);	/* start from 0 */
 
-	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER0_CTRL, ARC_TIMER_CTRL_IE | ARC_TIMER_CTRL_NH);
 }
 
 
@@ -294,7 +294,7 @@ static irqreturn_t timer_irq_handler(int
 	 *      explicitly clears IP bit
 	 * 2. Re-arm interrupt if periodic by writing to IE bit [0]
 	 */
-	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | ARC_TIMER_CTRL_NH);
 
 	evt->event_handler(evt);
 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
