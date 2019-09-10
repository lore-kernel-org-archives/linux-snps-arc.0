From: sudeep.holla@arm.com (Sudeep Holla)
Date: Tue, 10 Sep 2019 16:08:26 +0100
Subject: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
In-Reply-To: <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 10, 2019@02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 10.09.2019 17:32, Sudeep Holla wrote:
> > External E-Mail
> > 
> > 
> > On Tue, Sep 10, 2019@04:47:13PM +0300, Claudiu Beznea wrote:
> >> From: Alexandre Belloni <alexandre.belloni at bootlin.com>
> >>
> >> Some timer drivers may behave either as clocksource or clockevent
> >> or both. Until now, in case of platforms with multiple hardware
> >> resources of the same type, the drivers were chosing the first
> >> registered hardware resource as clocksource/clockevent and the
> >> next one as clockevent/clocksource. Other were using different
> >> compatibles (one for each functionality, although its about the
> >> same hardware). Add DT bindings to be able to choose the
> >> functionality of a timer.
> >>
> > 
> > Is the piece of hardware not capable of serving as both clocksource
> > and clockevent or is it just the platform choice ?
> 
> In my case, the hardware is not capable of serving at the same time
> a clocksource device and a clockevent device.
> 
> First, I published v1 for a hardware device having this behavior at
> [1] requesting 1st probed hardware device to work as clocksource and
> the 2nd one to work as clockevent. The discussion at [1] ended up with
> the idea of having a mechanism to specify which hardware device behaves
> as clocksource and which one behaves as clockevent.
>

In that case, why can't we identify capability that with the compatibles
for this timer IP ?

IOW, I don't like the proposal as it's hardware limitation.

--
Regards,
Sudeep
