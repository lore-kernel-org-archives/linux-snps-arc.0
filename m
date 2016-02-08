From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 8 Feb 2016 17:53:04 +0530
Subject: [PATCH 6/9] ARC: clocksource: DT based probe
In-Reply-To: <56B885B2.6060408@linaro.org>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-7-git-send-email-vgupta@synopsys.com>
 <56B885B2.6060408@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B888A8.5020306@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 08 February 2016 05:40 PM, Daniel Lezcano wrote:
> On 02/02/2016 11:58 AM, Vineet Gupta wrote:
>> - Remove explicit clocksource setup and let it be done by OF framework
>>    by defining CLOCKSOURCE_OF_DECLARE() for various timers
>>
>> - This allows multiple clocksources to be potentially registered
>>    simultaneouly: previously we could only do one - as all of them had
>>    same arc_counter_setup() routine for registration
>>
>> - Setup routines also ensure that the underlying timer actually exists.
>>
>> - Remove some of the panic() calls if underlying timer is NOT detcted as
>>    a fallback clocksource might still be available
>>    1. If GRFC doesn't exist, jiffies clocksource gets registered anyways
>>    2. if RTC doesn't exist, TIMER1 cetainly will take over (as it is
>>       always present)
>>
>> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> 
> May be it is time to move these drivers into the drivers/clocksource directory
> where they belong to.

I suppose we could, but that is only possible after this round of "moderization",
i.e. usage of CLOCKSOURCE_OF_DECLARE() et al.

Plus the move will require a bunch of mechanical crap such as read_aux_reg() which
only ARC defines (similar to headaches Noam had for his clksrc).

So if we could agree on the sanity of this round of changes, I can work towards
the imminent move into drivers.

Thx,
-Vineet
