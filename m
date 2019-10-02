From: Claudiu.Beznea@microchip.com (Claudiu.Beznea@microchip.com)
Date: Wed, 2 Oct 2019 13:32:44 +0000
Subject: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
In-Reply-To: <20190930143246.GA19967@bogus>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
 <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
 <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
 <20190930143246.GA19967@bogus>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e78e7520-213c-8075-d71e-b8db2ebdceb7@microchip.com>
To: linux-snps-arc@lists.infradead.org



On 30.09.2019 17:32, Rob Herring wrote:
> On Wed, Sep 11, 2019@07:18:07AM +0000, Claudiu.Beznea@microchip.com wrote:
>>
>>
>> On 11.09.2019 03:03, Linus Walleij wrote:
>>> External E-Mail
>>>
>>>
>>> On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
>>> <alexandre.belloni@bootlin.com> wrote:
>>>> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
>>>>> On Tue, Sep 10, 2019@02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
>>>
>>>>> In that case, why can't we identify capability that with the compatibles
>>>>> for this timer IP ?
>>>>>
>>>>> IOW, I don't like the proposal as it's hardware limitation.
>>>>
>>>> To be clear, bot timers are exactly the same but can't be clocksource
>>>> and clockevent at the same time. Why would we have different compatibles
>>>> for the exact same IP?
>>>
>>> In that case why not just pick the first one you find as clocksource
>>> and the second one as clock event? As they all come to the
>>> same timer of init function two simple local state variables can
>>> solve that:
>>>
>>> static bool registered_clocksource;
>>> static bool registered_clockevent;
>>>
>>> probe(timer) {
>>>    if (!registered_clocksource) {
>>>        register_clocksource(timer);
>>>        registrered_clocksource = true;
>>>        return;
>>>    }
>>>    if (!registered_clockevent) {
>>>        register_clockevent(timer);
>>>        registered_clockevent = true;
>>>        return;
>>>    }
>>>    pr_info("surplus timer %p\n", timer);
>>> }
>>>
>>
>> That was also my proposal for the driver I'm sending this series for (see
>> [1]) but it has been proposed to implement a mechanism similar to this one
>> in this series (see [2] and [3]).
> 
> This comes up over and over, and the answer is still no. Either each 
> block is identical and doesn't matter which one is used for what or 
> there is some h/w difference that you should describe. 

There are no hardware differences in my case. The block just cannot work at
the same time  as clocksource and clockevent. And on SAM9X60's we want to
use it as clockevent for high resolution timers support.

> 
> If you want something that would even be considered to put into DT, 
> then define something BSD or other OS's could use too. (That's not a 
> suggestion to respin this with generalized names.)
> 
> Rob
> 
> 
