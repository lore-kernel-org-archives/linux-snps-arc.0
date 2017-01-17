From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Jan 2017 14:02:12 -0800
Subject: [PATCH 2/4] ARC: smp-boot: run-on-reset: add callback to allow
 non masters to wait
In-Reply-To: <4881796E12491D4BB15146FE0209CE646789B03D@DE02WEMBXB.internal.synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
 <1484600277-32345-3-git-send-email-vgupta@synopsys.com>
 <4881796E12491D4BB15146FE0209CE646789B03D@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c329e6ff-3659-9906-5c41-ea395e5ec667@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/17/2017 12:58 PM, Alexey Brodkin wrote:
>>
>> +static void arc_default_smp_wait_to_boot(int cpu) {
>> +	while (wake_flag != cpu)
>> +		;
>> +
>> +	wake_flag = 0;
> 
> Why don't we convert "wake_flag" into bit-field so each core uses its special bit.
> It is IMHO beneficial for 2 reasons:
>  1. If we ever decide to have master core with ARCID != 0 implementation of that procedure won't change,
>     because "wake_flag" for core with ARCID=0 will be 1 but not 0, see for example http://patchwork.ozlabs.org/patch/703645/

That's not a real use case - it is just a debug exercise ...

> 
>  2. There's no need in resetting "wake_flag" to 0 at all as well because each core has its own bit and they not affect anybody else.
>     And in that case ...


True, but you need to do a read-modify-write. More importantly, the cores are
setup one at a time by the master - so there just was no need to do this to begin
with - one at a time was just sufficient. If you really want to do this in right
way - it will not a bit filed either, it needs to be a strictly per cpu variable.

>> +}
>> +
>>  void arc_platform_smp_wait_to_boot(int cpu)  {
>>  	/* for halt-on-reset, we've waited already */
>>  	if (IS_ENABLED(CONFIG_ARC_SMP_HALT_ON_RESET))
>>  		return;
> 
> ...we may just remove above part. Master core by that time has already set our bit in "wake_flag" so we
> will effectively fall through the following "while".

No. They way this works is, same routine arc_platform_smp_wait_to_boot() is called
from early boot code for both halt-on-reset and run-on-reset. For latter we need
to actually wait. For former, they were already halted and when they land here,
they've waited enough so we need to return !

This is same as what was before, I've just moved the #ifdef from head.s (where it
looked ugly) to here.

-Vineet
