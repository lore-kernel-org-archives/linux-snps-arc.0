From: linus.walleij@linaro.org (Linus Walleij)
Date: Thu, 12 Sep 2019 15:18:49 +0100
Subject: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
In-Reply-To: <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
 <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
 <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CACRpkda1T_5D697wphrEGEsbj3zBfTaOOLN0T5zS1xfT949cjA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 11, 2019@8:18 AM <Claudiu.Beznea@microchip.com> wrote:
> [Me]
> > In that case why not just pick the first one you find as clocksource
> > and the second one as clock event?

> That was also my proposal for the driver I'm sending this series for (see
> [1]) but it has been proposed to implement a mechanism similar to this one
> in this series (see [2] and [3]).

OK I am not going to challenge the clock source maintainers on this,
so if that is what they want then that is what they should get.
It's fine to convert the Integrator driver too!

Yours,
Linus Walleij
