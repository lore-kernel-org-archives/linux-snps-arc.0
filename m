Return-Path: <SRS0=GYWY=OO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F85C433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Sep 2021 02:49:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE4C61100
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Sep 2021 02:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FE4C61100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYYpTk4m9PLrqR2D2VykvIvhIdnaPgcA6NbYFMzEd7Q=; b=MZGoc1RSiAUySnhNjhZZ52v2yU
	iGX1s0t62YgiOUjzoEcY9RYZRlx1G5CjkBIzyy+k1Ajc1cGV+xEA/DumA0/yhQ7Z7n9982An6D/VR
	8HpnNt9v9tSDhmI7cSpIpl5dECAv9ILHs3JUA8uGiwRi43pJVczjvUX2x1WjTZK0sMDn0OpvHHo7d
	xIRxgJmlW+kSc9rhDtNI9bm1gFqi7XTDlHoyfgeKA64PMJa0M5Lm107xQZcRsTkZfNDjMU/an3U3a
	1hmBAMXy4pCNEHqa5dKTeJEDZokblxqoZeFurUhDUt67i0/o5U0PkfhDoUNnKg0lS+GmWEK0lhUaV
	S2bLsDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTbH6-00Cwjs-Sh; Fri, 24 Sep 2021 02:49:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTbH3-00Cwj1-CD
 for linux-snps-arc@lists.infradead.org; Fri, 24 Sep 2021 02:49:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D98F61090;
 Fri, 24 Sep 2021 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632451756;
 bh=h9Ozz3onH53Wx9sbbp5hIuCfRgkzuUNhUWFdHodSYZQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WsVVVdUfq7kYVuyeI9RYbZ0bYrV8v67rjnjdFiP0UzUxbE/+KrpwB1+KZ0Ji0likR
 FS/zeyDY2WmIj4NY8MTC1wQ9R3bzjRuTkgorFfY6ddX77rMN1qGjVbm1kYCBNiTeYB
 7YdeVpsQ6e1qCldh0hbA6QKVyuVbotcW+0+uZuOqdk61kO3vwzGehZHBrY3tKrinSp
 VUNKsPkSvy7Lb+mfbN7DbBqxgebTvO9eRLWoxPani00QvsfNkLcUgBFsWl1QODjaBy
 FvRDLbMYEG83xn+mrrC84ZFX09P7moYk+aS1HLjt55vhCtWOwmNA+iKEiJvvloQeNc
 2LYwiv4qZEgpA==
Subject: Re: [PATCH v2] clocksource: arc_timer: eliminate redefined macro error
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
References: <20210924020825.20317-1-rdunlap@infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <1557caaa-9f90-7613-4627-5c5f59d047fa@kernel.org>
Date: Thu, 23 Sep 2021 19:49:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924020825.20317-1-rdunlap@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_194917_488571_B5C54F1E 
X-CRM114-Status: GOOD (  20.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 9/23/21 7:08 PM, Randy Dunlap wrote:
> In drivers/clocksource/, 3 drivers use "TIMER_CTRL_IE" with 3 different
> values.  Two of them (mps2-timer.c and timer-sp804.c/timer-sp.h) are
> localized and left unmodifed.
>
> One of them uses a shared header file (<soc/arc/timers.h>), which is
> what is causing the "redefined" warnings, so change the macro name in
> that driver only. Also change the TIMER_CTRL_NH macro name.
> Both macro names are prefixed with "ARC_" to reduce the likelihood
> of future name collisions.
>
> In file included from ../drivers/clocksource/timer-sp804.c:24:
> ../drivers/clocksource/timer-sp.h:25: error: "TIMER_CTRL_IE" redefined [-Werror]
>     25 | #define TIMER_CTRL_IE           (1 << 5)        /*   VR */
> ../include/soc/arc/timers.h:20: note: this is the location of the previous definition
>     20 | #define TIMER_CTRL_IE           (1 << 0) /* Interrupt when Count reaches limit */
>
> Fixes: b26c2e3823ba ("ARC: breakout timer include code into separate header")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
> v2: prefix both TIMER_CTRL_xx macros with ARC_ (suggested by
>      Shahab Vahedi <Shahab.Vahedi@synopsys.com>
>
>   drivers/clocksource/arc_timer.c |    6 +++---
>   include/soc/arc/timers.h        |    4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> --- linux-next-20210917.orig/include/soc/arc/timers.h
> +++ linux-next-20210917/include/soc/arc/timers.h
> @@ -17,8 +17,8 @@
>   #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
>   
>   /* CTRL reg bits */
> -#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
> -#define TIMER_CTRL_NH	        (1 << 1) /* Count only when CPU NOT halted */
> +#define ARC_TIMER_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
> +#define ARC_TIMER_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
>   
>   #define ARC_TIMERN_MAX		0xFFFFFFFF
>   
> --- linux-next-20210917.orig/drivers/clocksource/arc_timer.c
> +++ linux-next-20210917/drivers/clocksource/arc_timer.c
> @@ -225,7 +225,7 @@ static int __init arc_cs_setup_timer1(st
>   
>   	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMERN_MAX);
>   	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
> -	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
> +	write_aux_reg(ARC_REG_TIMER1_CTRL, ARC_TIMER_CTRL_NH);
>   
>   	sched_clock_register(arc_timer1_clock_read, 32, arc_timer_freq);
>   
> @@ -245,7 +245,7 @@ static void arc_timer_event_setup(unsign
>   	write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
>   	write_aux_reg(ARC_REG_TIMER0_CNT, 0);	/* start from 0 */
>   
> -	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
> +	write_aux_reg(ARC_REG_TIMER0_CTRL, ARC_TIMER_CTRL_IE | ARC_TIMER_CTRL_NH);
>   }
>   
>   
> @@ -294,7 +294,7 @@ static irqreturn_t timer_irq_handler(int
>   	 *      explicitly clears IP bit
>   	 * 2. Re-arm interrupt if periodic by writing to IE bit [0]
>   	 */
> -	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | TIMER_CTRL_NH);
> +	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | ARC_TIMER_CTRL_NH);
>   
>   	evt->event_handler(evt);
>   


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
