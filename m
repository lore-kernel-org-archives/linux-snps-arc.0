From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Tue, 15 Nov 2016 11:30:52 +0100
Subject: [PATCH v4 8/8] clocksource: import ARC timer driver
In-Reply-To: <CAKnoXLzY7Qxw39R029cprqzy4WvKXYf5PReutORO+JyMvaxeqA@mail.gmail.com>
References: <1478900332-24279-1-git-send-email-vgupta@synopsys.com>
 <1478900332-24279-9-git-send-email-vgupta@synopsys.com>
 <20161111231132.GA4186@mai>
 <0385e24e-b118-7243-fbee-4bad052b1eb2@synopsys.com>
 <CAKnoXLzY7Qxw39R029cprqzy4WvKXYf5PReutORO+JyMvaxeqA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9c03641f-b6a4-9e3b-53ee-03788771dbeb@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 12/11/2016 11:19, Daniel Lezcano wrote:
> Yes.
> 
> 
> Le 12 nov. 2016 1:53 AM, "Vineet Gupta" <Vineet.Gupta1 at synopsys.com
> <mailto:Vineet.Gupta1 at synopsys.com>> a ?crit :
> 
>     On 11/11/2016 03:11 PM, Daniel Lezcano wrote:
>     > On Fri, Nov 11, 2016@01:38:52PM -0800, Vineet Gupta wrote:
>     >> This adds support for
>     >>
>     >>  - CONFIG_ARC_TIMERS : legacy 32-bit TIMER0 and TIMER1 which count UP
>     >>    from @CNT to @LIMIT, before optionally triggering an interrupt.
>     >>    These are programmed using ARC auxiliary register interface.
>     >>    These are present in all ARC cores (ARC700 and ARC HS38)
>     >>    TIMER0 serves as clockevent for all ARC linux builds.
>     >>    TIMER1 is used for clocksource in arc700 builds.
>     >>
>     >>  - CONFIG_ARC_TIMERS_64BIT: 64-bit counters, RTC and GFRC found in
>     >>    ARC HS38 cores. These are independnet IP blocks with different
>     >>    programming model respectively.
>     >>
>     >> Signed-off-by: Vineet Gupta <vgupta at synopsys.com
>     <mailto:vgupta at synopsys.com>>
>     >> ---
>     >
>     > Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org
>     <mailto:daniel.lezcano at linaro.org>>
>     >
> 
> 
>     Thx Daniel. So I suppose for 4.10, I will get these merged,
>     including the
>     driver/clocksource bits. OK ?

Hi Vineet,

I just want to clarify. Do you want the entire series to go through my
tree ? Or through your tree ?



-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
