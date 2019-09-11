From: alexandre.belloni@bootlin.com (Alexandre Belloni)
Date: Wed, 11 Sep 2019 11:14:58 +0200
Subject: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
In-Reply-To: <81da473f-54d7-2a00-61ec-9351cdfcaaf3@baylibre.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <81da473f-54d7-2a00-61ec-9351cdfcaaf3@baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190911091458.GD21254@piout.net>
To: linux-snps-arc@lists.infradead.org

On 11/09/2019 09:34:27+0200, Neil Armstrong wrote:
> Hi,
> 
> On 10/09/2019 15:47, Claudiu Beznea wrote:
> > From: Alexandre Belloni <alexandre.belloni at bootlin.com>
> > 
> > Some timer drivers may behave either as clocksource or clockevent
> > or both. Until now, in case of platforms with multiple hardware
> > resources of the same type, the drivers were chosing the first
> > registered hardware resource as clocksource/clockevent and the
> > next one as clockevent/clocksource. Other were using different
> > compatibles (one for each functionality, although its about the
> > same hardware). Add DT bindings to be able to choose the
> > functionality of a timer.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni at bootlin.com>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea at microchip.com>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > index 45e79172a646..aad3034cdbdf 100644
> > --- a/Documentation/devicetree/bindings/chosen.txt
> > +++ b/Documentation/devicetree/bindings/chosen.txt
> > @@ -135,3 +135,23 @@ e.g.
> >  		linux,initrd-end = <0x82800000>;
> >  	};
> >  };
> > +
> > +linux,clocksource and linux,clockevent
> > +--------------------------------------
> > +
> > +Those nodes have a timer property. This property is a phandle to the timer to be
> > +chosen as the clocksource or clockevent. This is only useful when the platform
> > +has multiple identical timers and it is not possible to let linux make the
> > +correct choice.
> > +
> > +/ {
> > +	chosen {
> > +		linux,clocksource {
> > +			timer = <&timer0>;
> > +		};
> > +
> > +		linux,clockevent {
> > +			timer = <&timer1>;
> > +		};
> > +	};
> > +};
> > 
> 
> Why not in aliases ?
> 
> aliases {
>     clocksource0 = &timer0;
>     clockevent0 = &timer1;
> };
> 
> since we can have multiple of each, we should not limit ourselves to 1 clkevent
> and 1 clksource.
> 
> In the aliases case, each driver would expose both capabilities, and the core would select
> what to enable.
> 

For extendability, you need nodes for that because at some point, you
may need to also be able to select the timer frequency. You can't do
that with an alias.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
