From: Claudiu.Beznea@microchip.com (Claudiu.Beznea@microchip.com)
Date: Tue, 10 Sep 2019 14:57:23 +0000
Subject: [PATCH 2/7] clocksource: change timer registration macros
In-Reply-To: <86k1agryu2.wl-maz@kernel.org>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-3-git-send-email-claudiu.beznea@microchip.com>
 <86k1agryu2.wl-maz@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b0ff3339-4016-0979-d971-9d30e05e1db3@microchip.com>
To: linux-snps-arc@lists.infradead.org



On 10.09.2019 17:49, Marc Zyngier wrote:
> External E-Mail
> 
> 
> [crazy Cc list, not sure it'll go anywhere]

It is what get_maintainer.pl script returned to.

> 
> On Tue, 10 Sep 2019 14:47:11 +0100,
> Claudiu Beznea <claudiu.beznea@microchip.com> wrote:
>>
>> Change timer registration macros (TIMER_OF_DECLARE() and
>> CLOCKSOURCE_OF_DECLARE()) by adding a new argument. This new argument
>> is a pointer to an object of type struct timer_of and is used in
>> timer_probe(). Based on the flags filled in the struct timer_of object
>> the probing process will parse different DT bindings. Later on the
>> drivers will use the result of this parsing. Even at the moment only
>> few drivers are using this functionality there are other that could
>> be converted to use it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea at microchip.com>
> 
> Why don't you introduce a new registration macro that does what you
> want instead of creating this unnecessary churn all over the place?
>

I though it would be good to keep only one interface for all drivers.
I'll keep in mind your proposal for next version.

Thank you,
Claudiu Beznea
 
> 	M.
> 
