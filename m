From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Sun, 28 May 2017 16:20:03 +0200
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
In-Reply-To: <CACRpkdZbVv94hE9Gg+xiH2dxJANo-fPwLSek+BE4QwWWWWUixw@mail.gmail.com>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CACRpkdZbVv94hE9Gg+xiH2dxJANo-fPwLSek+BE4QwWWWWUixw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <376de2ec-c557-8541-9480-66472bd153a5@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 28/05/2017 15:48, Linus Walleij wrote:
> On Sat, May 27, 2017 at 11:58 AM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> 
>> The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
>> clocksource at early stage. However, this macro is also used to initialize
>> the clockevent if any, or the clockevent only.
>>
>> It was originally suggested to declare another macro to initialize a
>> clockevent, so in order to separate the two entities even they belong to the
>> same IP. This was not accepted because of the impact on the DT where splitting
>> a clocksource/clockevent definition does not make sense as it is a Linux
>> concept not a hardware description.
>>
>> On the other side, the clocksource has not interrupt declared while the
>> clockevent has, so it is easy from the driver to know if the description is
>> for a clockevent or a clocksource, IOW it could be implemented at the driver
>> level.
>>
>> So instead of dealing with a named clocksource macro, let's use a more generic
>> one: TIMER_OF_DECLARE.
>>
>> The patch has not functional changes.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>'
> 
> This makes the macro make sense and I had this idea one time too.
> Awesome.
> Reviewed-by: Linus Walleij <linus.walleij at linaro.org>
Thanks Linus for reviewing the series.

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
