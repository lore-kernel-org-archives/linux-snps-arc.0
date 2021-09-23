Return-Path: <SRS0=XnSr=ON=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB5CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 03:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ED7A60FE6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 03:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ED7A60FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pmfL2+bWAyvsk7KzEtrzXsjgHFzgClOHsmVn1QFZQSM=; b=D+OjxYesNSx0n2
	xRNtNpIHuqBpt9F2ZFlnRR+5an/NT3dZc0kM6rgG15Z2A/GeX3bAf4nksr2YpqZ6KXPZdNmaopnFi
	LTrbRyewXedcs5XVFvu0aSnsNfLrP8gg9RlTyvicQU5BD5xtm22kWYGfp4WKd40o5Z9Ah9Qf4IT/t
	QOKIpnQ8S30G/2I/lVYDJsQfswH1wvpWuUwXMnIytT2FeqqyUeAoPrm69j58i2AU19KUAmkfTXz+d
	AkKj+VDEoXdf1FyhSXADiAE7zwoz96QZRpMovzcRkDsmTHd1zQv34+zO9U3AaNqAv2BrsUMbjxv8V
	YDtg6aBoldk3gzJufVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTFFV-00A9I5-4E; Thu, 23 Sep 2021 03:18:13 +0000
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTFFT-00A9Hk-B8; Thu, 23 Sep 2021 03:18:11 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] clocksource: arc_timer: eliminate redefined macro error
Date: Wed, 22 Sep 2021 20:18:08 -0700
Message-Id: <20210923031808.5945-1-rdunlap@infradead.org>
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
that driver only.

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
---
 drivers/clocksource/arc_timer.c |    2 +-
 include/soc/arc/timers.h        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210917.orig/include/soc/arc/timers.h
+++ linux-next-20210917/include/soc/arc/timers.h
@@ -17,7 +17,7 @@
 #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
 
 /* CTRL reg bits */
-#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
+#define TIMER_CTRL_IEN	        (1 << 0) /* Interrupt when Count reaches limit */
 #define TIMER_CTRL_NH	        (1 << 1) /* Count only when CPU NOT halted */
 
 #define ARC_TIMERN_MAX		0xFFFFFFFF
--- linux-next-20210917.orig/drivers/clocksource/arc_timer.c
+++ linux-next-20210917/drivers/clocksource/arc_timer.c
@@ -245,7 +245,7 @@ static void arc_timer_event_setup(unsign
 	write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
 	write_aux_reg(ARC_REG_TIMER0_CNT, 0);	/* start from 0 */
 
-	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IEN | TIMER_CTRL_NH);
 }
 
 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
