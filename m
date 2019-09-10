From: linus.walleij@linaro.org (Linus Walleij)
Date: Wed, 11 Sep 2019 00:48:33 +0100
Subject: [PATCH 7/7] clocksource/drivers/integrator-ap: parse the chosen
 node
In-Reply-To: <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 10, 2019 at 2:50 PM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:
> From: Alexandre Belloni <alexandre.belloni at bootlin.com>
>
> The driver currently uses aliases to know whether the timer is the
> clocksource or the clockevent.

OK maybe that wasn't the most elegant solution.

> Add the /chosen/linux,clocksource and
> /chosen/linux,clockevent parsing while keeping backward compatibility.

This is not how I would solve this today.

I would simply remove/comment out the IRQ from the timer
that cannot be used for clockevent from the device tree
(apparently it doesn't work anyway), and make the code only
pick a timer with a valid interrupt assigned as clock event,
while a timer without interrupt can be used for clock source.

This has the upside of not needing any special aliases or
chosen things.

Yours,
Linus Walleij
