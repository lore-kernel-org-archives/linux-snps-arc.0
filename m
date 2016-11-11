From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Sat, 12 Nov 2016 00:11:32 +0100
Subject: [PATCH v4 8/8] clocksource: import ARC timer driver
In-Reply-To: <1478900332-24279-9-git-send-email-vgupta@synopsys.com>
References: <1478900332-24279-1-git-send-email-vgupta@synopsys.com>
 <1478900332-24279-9-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161111231132.GA4186@mai>
To: linux-snps-arc@lists.infradead.org

On Fri, Nov 11, 2016@01:38:52PM -0800, Vineet Gupta wrote:
> This adds support for
> 
>  - CONFIG_ARC_TIMERS : legacy 32-bit TIMER0 and TIMER1 which count UP
>    from @CNT to @LIMIT, before optionally triggering an interrupt.
>    These are programmed using ARC auxiliary register interface.
>    These are present in all ARC cores (ARC700 and ARC HS38)
>    TIMER0 serves as clockevent for all ARC linux builds.
>    TIMER1 is used for clocksource in arc700 builds.
> 
>  - CONFIG_ARC_TIMERS_64BIT: 64-bit counters, RTC and GFRC found in
>    ARC HS38 cores. These are independnet IP blocks with different
>    programming model respectively.
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
