From: Claudiu.Beznea@microchip.com (Claudiu.Beznea@microchip.com)
Date: Wed, 11 Sep 2019 06:52:36 +0000
Subject: [PATCH 0/7] add support for clocksource/clockevent DT selection
In-Reply-To: <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cb451591-88ad-f1b3-b654-cea86ae11cac@microchip.com>
To: linux-snps-arc@lists.infradead.org



On 10.09.2019 19:05, John Stultz wrote:
> External E-Mail
> 
> 
> On Tue, Sep 10, 2019 at 6:47 AM Claudiu Beznea
> <claudiu.beznea@microchip.com> wrote:
>>
>> This series adds support to permit the selection of clocksource/clockevent
>> via DT.
> 
> Sorry about this, but could you try to include more of a rational for
> *why* this would be useful in your cover-letter/commit messages?
> 

Sorry for not being to clear in the cover letter.

The case I am trying to solve here is as follows:
The timer hardware for which I publish a driver at [1] cannot work at the
same time as a clocksource and clockevent. On some of our platforms we have
more than one such a timer. So we could use one hardware resource as
clocksource and one as clockevent but not one for both.
Due to this, I proposed in the driver at [1] to have 1st probed hardware to
work as clocksource and the 2nd one to work as clockevent.
There are also other timer drivers that uses this approach. While working
on this series I noticed that there are others that are using even
different compatibles (although it looks to be related to the same hardware).

Due to this Daniel proposed to have an unified mechanism for this scenario,
see [2], (something like what I proposed in this series), such that to have
a determinism b/w the function that the hardware resources would behave
(either clocksource or clockevent or both).

The description I gave in cover letter was not the best one. Because,
actually, at this time, the clocksource/clockevent of the system would not
be the one pointed by DT bindings, these DT bindings would chose only the
function that a timer would have. Because if more than one
clocksource/clockevent would be registered in a system the rating field of
struct clocksource/struct clockevent would be the one that would decide the
chosen clocksource/clockevent.

[1]
https://lore.kernel.org/lkml/1552580772-8499-1-git-send-email-claudiu.beznea at microchip.com/
[2]
https://lore.kernel.org/lkml/2f831f1b-c87d-48bd-cf02-2ebb334b964c at linaro.org/

> I'm not sure I understand the limitation that requires such an option
> to be added to the dts.
> 
> thanks
> -john
> 
