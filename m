From: Claudiu.Beznea@microchip.com (Claudiu.Beznea@microchip.com)
Date: Wed, 11 Sep 2019 07:14:11 +0000
Subject: [PATCH 7/7] clocksource/drivers/integrator-ap: parse the chosen
 node
In-Reply-To: <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
 <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9c46343e-504e-fbd9-45aa-a67416109e36@microchip.com>
To: linux-snps-arc@lists.infradead.org



On 11.09.2019 02:48, Linus Walleij wrote:
> External E-Mail
> 
> 
> On Tue, Sep 10, 2019 at 2:50 PM Claudiu Beznea
> <claudiu.beznea@microchip.com> wrote:
>> From: Alexandre Belloni <alexandre.belloni at bootlin.com>
>>
>> The driver currently uses aliases to know whether the timer is the
>> clocksource or the clockevent.
> 
> OK maybe that wasn't the most elegant solution.
> 
>> Add the /chosen/linux,clocksource and
>> /chosen/linux,clockevent parsing while keeping backward compatibility.
> 
> This is not how I would solve this today.
> 
> I would simply remove/comment out the IRQ from the timer
> that cannot be used for clockevent from the device tree
> (apparently it doesn't work anyway), and make the code only
> pick a timer with a valid interrupt assigned as clock event,
> while a timer without interrupt can be used for clock source.
This could also be used but it will not be compatible with old device
trees. There are different ideas implemented in timer drivers with regards
to this issue. Some of them are registering 1st timer to work as
clocksource/clockevent and the 2nd one to work as clockevent/clocksource.
Some are using different compatibles, one for clocksource, one for
clockevent although these compatible seems to be for the same hardware type
(I can point drivers/clocksource/timer-sprd.c).

The idea with this series was, at it has been proposed in [1] to have one
single mechanism for this kind of situations.

Thank you,
Claudiu Beznea

[1]
https://lore.kernel.org/lkml/2f831f1b-c87d-48bd-cf02-2ebb334b964c at linaro.org/

> 
> This has the upside of not needing any special aliases or
> chosen things.
> 
> Yours,
> Linus Walleij
> 
