From: maz@kernel.org (Marc Zyngier)
Date: Tue, 10 Sep 2019 15:49:09 +0100
Subject: [PATCH 2/7] clocksource: change timer registration macros
In-Reply-To: <1568123236-767-3-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-3-git-send-email-claudiu.beznea@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <86k1agryu2.wl-maz@kernel.org>
To: linux-snps-arc@lists.infradead.org

[crazy Cc list, not sure it'll go anywhere]

On Tue, 10 Sep 2019 14:47:11 +0100,
Claudiu Beznea <claudiu.beznea@microchip.com> wrote:
> 
> Change timer registration macros (TIMER_OF_DECLARE() and
> CLOCKSOURCE_OF_DECLARE()) by adding a new argument. This new argument
> is a pointer to an object of type struct timer_of and is used in
> timer_probe(). Based on the flags filled in the struct timer_of object
> the probing process will parse different DT bindings. Later on the
> drivers will use the result of this parsing. Even at the moment only
> few drivers are using this functionality there are other that could
> be converted to use it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea at microchip.com>

Why don't you introduce a new registration macro that does what you
want instead of creating this unnecessary churn all over the place?

	M.

-- 
Jazz is not dead, it just smells funny.
