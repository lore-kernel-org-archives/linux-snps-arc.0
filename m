From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 10:47:19 -0700
Subject: [PATCH 3/9] ARC: timer: gfrc: boot print alongside other timers
In-Reply-To: <20161103170941.GD1859@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-4-git-send-email-vgupta@synopsys.com>
 <20161103170941.GD1859@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fff6abb9-3e19-3865-2b1c-9616ebfba5a9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 10:09 AM, Daniel Lezcano wrote:
> On Mon, Oct 31, 2016@03:48:10PM -0700, Vineet Gupta wrote:
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> 
> Why not add a message in drivers/clocksource/clksrc-probe.c when a timer inits
> successfully ? and then get rid of this code.

At boot I have bunch of cod which prints all the major hardware blocks and thus
would like to print it. We also print if a feature is present but not supported
etc. So I like to keep all of that here.

Also same code is used for /proc/cpuinfo.

> 
>> ---
>>  arch/arc/kernel/setup.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
>> index 0385df77a697..595d06900061 100644
>> --- a/arch/arc/kernel/setup.c
>> +++ b/arch/arc/kernel/setup.c
>> @@ -234,11 +234,11 @@ static char *arc_cpu_mumbojumbo(int cpu_id, char *buf, int len)
>>  		       is_isa_arcompact() ? "ARCompact" : "ARCv2",
>>  		       IS_AVAIL1(cpu->isa.be, "[Big-Endian]"));
>>  
>> -	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s\nISA Extn\t: ",
>> +	n += scnprintf(buf + n, len - n, "Timers\t\t: %s%s%s%s%s%s\nISA Extn\t: ",
>>  		       IS_AVAIL1(cpu->extn.timer0, "Timer0 "),
>>  		       IS_AVAIL1(cpu->extn.timer1, "Timer1 "),
>> -		       IS_AVAIL2(cpu->extn.rtc, "Local-64-bit-Ctr ",
>> -				 CONFIG_ARC_HAS_RTC));
>> +		       IS_AVAIL2(cpu->extn.rtc, "RTC [UP 64-bit] ", CONFIG_ARC_HAS_RTC),
>> +		       IS_AVAIL2(cpu->extn.gfrc, "GFRC [SMP 64-bit] ", CONFIG_ARC_HAS_GFRC));
>>  
>>  	n += i = scnprintf(buf + n, len - n, "%s%s%s%s%s",
>>  			   IS_AVAIL2(cpu->isa.atomic, "atomic ", CONFIG_ARC_HAS_LLSC),
>> -- 
>> 2.7.4
>>
> 
