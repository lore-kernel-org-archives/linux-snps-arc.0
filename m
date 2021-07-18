Return-Path: <SRS0=qQBs=MK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57774C636CA
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Jul 2021 20:36:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C85610A2
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Jul 2021 20:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C85610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ngf+xC1OqKl9Di8MxP1SbCyRLbwbgq4IQUeV4PPZIBk=; b=xYhhIwFbt8mCRX
	FzYaTks046SCvKuY/EJckmQvWSZaaVqSp1isj8ZIY+SeCf7AAoWcyTN6BoSDh9Xjb6zZMJgw02Wrm
	3cSj7FvaWgcjlxpoqQ1PpZ/o+RJr6DNfVawgTsF3z/Zsaz0gP/J1rG4Q/tOMxWH3nPg4Co4xHmpn3
	yfYE+BFdC/tzjHl3JxPqwK1fz8u3zg6W7y2qTupIiZp5Lcybhk34vFsjKSs0jDgwKT+x+WZhXCQPb
	pibM5Pljz0F4Y5L5qem98Bbdfp+LzxF85hxwWKAwl+RZHBUz9+rqkiUjcA50F3r6gzQEMCqheCX51
	qWG4XKrPN1N5STs8H+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5DWd-0080Jc-Jg; Sun, 18 Jul 2021 20:36:35 +0000
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5DWc-0080J7-ME; Sun, 18 Jul 2021 20:36:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Subject: [PATCH] arc: rename arc_timer's TIMER_CTRL_IE to avoid redefinition
Date: Sun, 18 Jul 2021 13:36:32 -0700
Message-Id: <20210718203632.3982-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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

There are 2 other clocksource drivers that use the symbol
(macro/define) TIMER_CTRL_IE (in 3 files). Change the ARC timer
symbol "TIMER_CTRL_IE" to "TIMER_CTRL_IEN" to resolve the symbol
collision (redefinition).

In file included from ../drivers/clocksource/timer-integrator-ap.c:17:
../drivers/clocksource/timer-sp.h:25: warning: "TIMER_CTRL_IE" redefined
   25 | #define TIMER_CTRL_IE  (1 << 5) /*   VR */
../include/soc/arc/timers.h:20: note: this is the location of the previous definition
   20 | #define TIMER_CTRL_IE         (1 << 0) /* Interrupt when Count reaches limit */

../drivers/clocksource/mps2-timer.c:25: warning: "TIMER_CTRL_IE" redefined
   25 | #define TIMER_CTRL_IE  BIT(3)
../include/soc/arc/timers.h:20: note: this is the location of the previous definition
   20 | #define TIMER_CTRL_IE         (1 << 0) /* Interrupt when Count reaches limit */

In file included from ../drivers/clocksource/timer-sp804.c:24:
../drivers/clocksource/timer-sp.h:25: warning: "TIMER_CTRL_IE" redefined
   25 | #define TIMER_CTRL_IE  (1 << 5) /*   VR */
../include/soc/arc/timers.h:20: note: this is the location of the previous definition
   20 | #define TIMER_CTRL_IE         (1 << 0) /* Interrupt when Count reaches limit */

Fixes: b26c2e3823ba ("ARC: breakout timer include code into separate header")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
 drivers/clocksource/arc_timer.c |    2 +-
 include/soc/arc/timers.h        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210716.orig/drivers/clocksource/arc_timer.c
+++ linux-next-20210716/drivers/clocksource/arc_timer.c
@@ -245,7 +245,7 @@ static void arc_timer_event_setup(unsign
 	write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
 	write_aux_reg(ARC_REG_TIMER0_CNT, 0);	/* start from 0 */
 
-	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IEN | TIMER_CTRL_NH);
 }
 
 
--- linux-next-20210716.orig/include/soc/arc/timers.h
+++ linux-next-20210716/include/soc/arc/timers.h
@@ -17,7 +17,7 @@
 #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
 
 /* CTRL reg bits */
-#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
+#define TIMER_CTRL_IEN	        (1 << 0) /* Interrupt when Count reaches limit */
 #define TIMER_CTRL_NH	        (1 << 1) /* Count only when CPU NOT halted */
 
 #define ARC_TIMERN_MAX		0xFFFFFFFF

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
