From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 10:41:45 -0700
Subject: [PATCH 1/9] ARC: timer: gfrc, rtc: Read BCR to detect whether
 hardware exists ...
In-Reply-To: <20161103170056.GB1859@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-2-git-send-email-vgupta@synopsys.com>
 <20161103170056.GB1859@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <dbd61a4a-259a-b5a2-eb1b-da539808ecd2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 10:00 AM, Daniel Lezcano wrote:
> On Mon, Oct 31, 2016@03:48:08PM -0700, Vineet Gupta wrote:
>> ... don't rely on cpuinfo populated in arc boot code. This paves wat for
>> moving this code in drivers/clocksource/
>>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
>>  arch/arc/kernel/time.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
>> index f927b8dc6edd..a2db010cde18 100644
>> --- a/arch/arc/kernel/time.c
>> +++ b/arch/arc/kernel/time.c
>> @@ -118,10 +118,11 @@ static struct clocksource arc_counter_gfrc = {
>>  
>>  static int __init arc_cs_setup_gfrc(struct device_node *node)
>>  {
>> -	int exists = cpuinfo_arc700[0].extn.gfrc;
>> +	struct mcip_bcr mp;
>>  	int ret;
>>  
>> -	if (WARN(!exists, "Global-64-bit-Ctr clocksource not detected"))
>> +	READ_BCR(ARC_REG_MCIP_BCR, mp);
>> +	if (WARN(!mp.gfrc, "Global-64-bit-Ctr clocksource not detected"))
> 
> Take the opportunity to replace this WARN by a pr_err.

OK.

> 
>>  		return -ENXIO;
>>  
>>  	ret = arc_get_timer_clk(node);
>> @@ -174,10 +175,11 @@ static struct clocksource arc_counter_rtc = {
>>  
>>  static int __init arc_cs_setup_rtc(struct device_node *node)
>>  {
>> -	int exists = cpuinfo_arc700[smp_processor_id()].extn.rtc;
>> +	struct bcr_timer timer;
>>  	int ret;
>>  
>> -	if (WARN(!exists, "Local-64-bit-Ctr clocksource not detected"))
>> +	READ_BCR(ARC_REG_TIMERS_BCR, timer);
>> +	if (WARN(!timer.rtc, "Local-64-bit-Ctr clocksource not detected"))
>>  		return -ENXIO;o
> 
> Ditto and                    ^^
> 
> So the READ_BCR() is only there to check the timer is physically present ?

Yep, due to configurable nature of cores, we have Build Config Registers to detect
at runtime what is present or not. This allows for boot printing at the minimum.
This is defined in arcregs.h and in newly introduced soc/arc/aux.h

> 
>>  	/* Local to CPU hence not usable in SMP */
>> -- 
>> 2.7.4
>>
> 
