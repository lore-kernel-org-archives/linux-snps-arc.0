From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Feb 2017 17:16:00 -0800
Subject: [PATCH] clocksource: arc_timer: RTC: allow registration despite
 SMP
In-Reply-To: <20170202142748.GP2206@mai>
References: <1485996615-2511-1-git-send-email-vgupta@synopsys.com>
 <20170202142748.GP2206@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <343c8c7a-4fa2-d8ca-7780-7b1e7fd73fc2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

Sorry for delayed response, was away from Linux for a bit :-(

On 02/02/2017 06:27 AM, Daniel Lezcano wrote:
> On Wed, Feb 01, 2017@04:50:15PM -0800, Vineet Gupta wrote:
>> So far we didn't allow CPU private 64-bit RTC timer to register in SMP
>> as the individual counters may not be synchronized across cores.
> 
> That is the case for the other archs and the per cpu clocksource are used, the
> kernel is supposed to be immune against clocks drift. There are mechanisms to
> have a synchronized view of the clock when they are per cpu and the kernel does
> not compare clocks between cpus. 

Right, we have tick broadcast etc. However as discussed before I really don't like
the overhead - specially given that SMP cores will have a truly cross-core-sync
GFRC timer and will serve as clocksrc anyways.

> I didn't realize that when we did the modification around this check.
> 
> May be you can double check these clocksources are really not suitable for SMP,
> because if it is not the case the if !CONFIG_SMP could be simply removed.

Technically with tick broadcast RTC could be used, but I would like to avoid that.
The usecase here is a CONFIG_SMP built kernel running on a UP only hardware (I was
playing with running same binary on UP / SMP hardware).

However it seems CONFIG_SMP overhead seems to be significant for production UP
hardware so this patch might not be important after all.

> A sidenote: RTC is confusing and should be changed to something else.

Yeah it is - but that is what hardware guys decided to name it

-Vineet

> 
>> However there is a situation when we build SMP kernel but want to use
>> the same image on UP as well as SMP hardware. Here we would certainly
>> want to use RTC, but current code doesn't allow as it only uses build
>> info (CONFIG_SMP) and not runtime info (num_online_cpus() or some such).
>>
>> We can't possibly use num_online_cpus() anyways because clocksource
>> probe happens before other cpus are brought online
>>
>> The simple fix is allow ETC probe for SMP and rely on higher rating of
>> GFRC to take over in general SMP case. We leave the pr_warn to notify
>> the user.
>>
>> Cc: John Stultz <john.stultz at linaro.org>
>> Cc: Thomas Gleixner <tglx at linutronix.de>
>> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
>>  drivers/clocksource/arc_timer.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
>> index 7517f959cba7..87f193794bf2 100644
>> --- a/drivers/clocksource/arc_timer.c
>> +++ b/drivers/clocksource/arc_timer.c
>> @@ -145,10 +145,8 @@ static int __init arc_cs_setup_rtc(struct device_node *node)
>>  	}
>>  
>>  	/* Local to CPU hence not usable in SMP */
>> -	if (IS_ENABLED(CONFIG_SMP)) {
>> +	if (IS_ENABLED(CONFIG_SMP))
>>  		pr_warn("Local-64-bit-Ctr not usable in SMP");
>> -		return -EINVAL;
>> -	}
>>  
>>  	ret = arc_get_timer_clk(node);
>>  	if (ret)
>> -- 
>> 2.7.4
>>
> 
