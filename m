From: sudeep.holla@arm.com (Sudeep Holla)
Date: Tue, 10 Sep 2019 15:32:31 +0100
Subject: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
In-Reply-To: <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 10, 2019@04:47:13PM +0300, Claudiu Beznea wrote:
> From: Alexandre Belloni <alexandre.belloni at bootlin.com>
>
> Some timer drivers may behave either as clocksource or clockevent
> or both. Until now, in case of platforms with multiple hardware
> resources of the same type, the drivers were chosing the first
> registered hardware resource as clocksource/clockevent and the
> next one as clockevent/clocksource. Other were using different
> compatibles (one for each functionality, although its about the
> same hardware). Add DT bindings to be able to choose the
> functionality of a timer.
>

Is the piece of hardware not capable of serving as both clocksource
and clockevent or is it just the platform choice ?

--
Regards,
Sudeep
