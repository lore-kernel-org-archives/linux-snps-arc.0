From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Sun, 13 Oct 2019 20:16:10 +0200
Subject: [PATCH 0/7] add support for clocksource/clockevent DT selection
In-Reply-To: <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
 <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
To: linux-snps-arc@lists.infradead.org


Hi Claudiu,

sorry for the delay, I was OoO again.

On 03/10/2019 12:43, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 02.10.2019 16:35, Claudiu Beznea wrote:
>> Hi Daniel,
>>
>> Taking into account that Rob doesn't agree with the solution proposed in
>> this series do you think there is a chance to merge this driver as is?
> 
> Sorry, I was talking here about the driver at [1].
> 
> [1] https://lore.kernel.org/lkml/1552580772-8499-1-git-send-email-claudiu.beznea at microchip.com/

Damn! 7 months old. I'm truly sorry we do not have progress on this. Let
fix this once and for all.

In the driver:

ret = of_property_read_u32(node, "clock-frequency", &freq);

It is unclear how is used this property. It should be the frequency
driving the timer, but can we get from a clk_get_rate() and a fixed divider?


-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
