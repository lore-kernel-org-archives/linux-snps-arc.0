From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Nov 2016 16:53:27 -0800
Subject: [PATCH v4 8/8] clocksource: import ARC timer driver
In-Reply-To: <20161111231132.GA4186@mai>
References: <1478900332-24279-1-git-send-email-vgupta@synopsys.com>
 <1478900332-24279-9-git-send-email-vgupta@synopsys.com>
 <20161111231132.GA4186@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0385e24e-b118-7243-fbee-4bad052b1eb2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/11/2016 03:11 PM, Daniel Lezcano wrote:
> On Fri, Nov 11, 2016@01:38:52PM -0800, Vineet Gupta wrote:
>> This adds support for
>>
>>  - CONFIG_ARC_TIMERS : legacy 32-bit TIMER0 and TIMER1 which count UP
>>    from @CNT to @LIMIT, before optionally triggering an interrupt.
>>    These are programmed using ARC auxiliary register interface.
>>    These are present in all ARC cores (ARC700 and ARC HS38)
>>    TIMER0 serves as clockevent for all ARC linux builds.
>>    TIMER1 is used for clocksource in arc700 builds.
>>
>>  - CONFIG_ARC_TIMERS_64BIT: 64-bit counters, RTC and GFRC found in
>>    ARC HS38 cores. These are independnet IP blocks with different
>>    programming model respectively.
>>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
> 
> Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> 


Thx Daniel. So I suppose for 4.10, I will get these merged, including the
driver/clocksource bits. OK ?

-Vineet
