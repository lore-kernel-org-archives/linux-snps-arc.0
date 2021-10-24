Return-Path: <SRS0=Wbtn=PN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786BDC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 25 Oct 2021 18:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDC160F46
	for <linux-snps-arc@archiver.kernel.org>; Mon, 25 Oct 2021 18:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DDC160F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	References:In-Reply-To:Cc:Subject:To:From:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQpy6DOlDByZo5qf8pbYs28ZUKSKP+rIpTrcvNNSgnk=; b=rsHKRWzSqrHqPS
	awetfp51HneazXwNK85zdk0L732kKsprwTyl+gH7dRihbcUqv4QcWQL7XjT58/Lk4POvQe8yYNAWU
	/c8GKRcsnPeqOc6gpSxeXkzbdSlyk3Yyq8yUH5fUulqPuGLGrkBKro5lDKYyAcIbIGapMKl7Ds7vt
	88iC35zgbUsXS90sTuF7i19yo/4si7xzGIw7IPrbCBHB9CoZ8OmGzx3w/QhKnQ7UaoQGDc2irZ2vq
	fPVXOJu3jxKpCh5N3UZ2woZ+97W3wUg+WQv2x/hAQFC9Asxo/D2Pqcy29sVSkDX1qVPDWG5E12x9u
	zEF5UQ2ELAf9X7ggMTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf4VR-00HJK1-Lv; Mon, 25 Oct 2021 18:15:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefba-00ECGN-Kv
 for linux-snps-arc@lists.infradead.org; Sun, 24 Oct 2021 15:40:16 +0000
Date: Sun, 24 Oct 2021 15:40:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1635090008;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcWU5tY5onugM4BFSU8TZW5aCZB4k1NwmlZk/lgLEC4=;
 b=Aof6jVMxcg1Wg0wKGjM97uktDavgunlHusRJAwi/0IWP0iJaTWcB9Mjh6B/3nmbNW8n+Iy
 siUSgaa8tRZssDoZMJ+WOl84pOjd694yZI736+XqxLz3tIwwD2S/+GthusEdNu3273Apku
 oZap1LEF6sni1ZVm7zao9J5EweiErGM0XWZblUY520EIkW0PMNGZcE9OjhimD/Yj7M2jGc
 MZoruiN+fBbV+l10AwwSKD4qlayVsn5NqyDQK4u2qUxE7JTLq1YkBcOeGgsDyhpK3eG1am
 Y4Zvun1Tv/92eN6FqmkusEVtxlhsBhTkKKfhcfEwQ6IV0dbmMACrHV0UqlXsig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1635090008;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcWU5tY5onugM4BFSU8TZW5aCZB4k1NwmlZk/lgLEC4=;
 b=FolArMSN4lXDZkuBeR6hY+NC/WnOy0Ydou7G/2gh1qGWWHDu1T/0CjVUYVJhPVTnpblq/9
 3R1tcoYI6xc6wRBw==
From: "tip-bot2 for Randy Dunlap" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource/drivers/arc_timer: Eliminate redefined
 macro error
Cc: Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210924020825.20317-1-rdunlap@infradead.org>
References: <20210924020825.20317-1-rdunlap@infradead.org>
MIME-Version: 1.0
Message-ID: <163509000739.626.4539906906227875754.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084015_016159_71D94C6C 
X-CRM114-Status: GOOD (  14.12  )
X-Mailman-Approved-At: Mon, 25 Oct 2021 11:15:31 -0700
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     58100c34f7827ddf64309c5a7c8c4e5bd6415b95
Gitweb:        https://git.kernel.org/tip/58100c34f7827ddf64309c5a7c8c4e5bd6415b95
Author:        Randy Dunlap <rdunlap@infradead.org>
AuthorDate:    Thu, 23 Sep 2021 19:08:25 -07:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 16 Oct 2021 22:15:01 +02:00

clocksource/drivers/arc_timer: Eliminate redefined macro error

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
Acked-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20210924020825.20317-1-rdunlap@infradead.org
---
 drivers/clocksource/arc_timer.c | 6 +++---
 include/soc/arc/timers.h        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
index de93dd1..cb18524 100644
--- a/drivers/clocksource/arc_timer.c
+++ b/drivers/clocksource/arc_timer.c
@@ -225,7 +225,7 @@ static int __init arc_cs_setup_timer1(struct device_node *node)
 
 	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMERN_MAX);
 	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
-	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER1_CTRL, ARC_TIMER_CTRL_NH);
 
 	sched_clock_register(arc_timer1_clock_read, 32, arc_timer_freq);
 
@@ -245,7 +245,7 @@ static void arc_timer_event_setup(unsigned int cycles)
 	write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
 	write_aux_reg(ARC_REG_TIMER0_CNT, 0);	/* start from 0 */
 
-	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER0_CTRL, ARC_TIMER_CTRL_IE | ARC_TIMER_CTRL_NH);
 }
 
 
@@ -294,7 +294,7 @@ static irqreturn_t timer_irq_handler(int irq, void *dev_id)
 	 *      explicitly clears IP bit
 	 * 2. Re-arm interrupt if periodic by writing to IE bit [0]
 	 */
-	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | TIMER_CTRL_NH);
+	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | ARC_TIMER_CTRL_NH);
 
 	evt->event_handler(evt);
 
diff --git a/include/soc/arc/timers.h b/include/soc/arc/timers.h
index 7ecde3b..ae99d3e 100644
--- a/include/soc/arc/timers.h
+++ b/include/soc/arc/timers.h
@@ -17,8 +17,8 @@
 #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
 
 /* CTRL reg bits */
-#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
-#define TIMER_CTRL_NH	        (1 << 1) /* Count only when CPU NOT halted */
+#define ARC_TIMER_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
+#define ARC_TIMER_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
 
 #define ARC_TIMERN_MAX		0xFFFFFFFF
 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
