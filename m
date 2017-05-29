From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 29 May 2017 10:48:09 +0200
Subject: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
In-Reply-To: <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ@mail.gmail.com>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170529084809.GA2192@mai>
To: linux-snps-arc@lists.infradead.org

On Mon, May 29, 2017@10:41:52AM +0200, Arnd Bergmann wrote:
> On Sat, May 27, 2017 at 11:58 AM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
> > clocksource at early stage. However, this macro is also used to initialize
> > the clockevent if any, or the clockevent only.
> >
> > It was originally suggested to declare another macro to initialize a
> > clockevent, so in order to separate the two entities even they belong to the
> > same IP. This was not accepted because of the impact on the DT where splitting
> > a clocksource/clockevent definition does not make sense as it is a Linux
> > concept not a hardware description.
> >
> > On the other side, the clocksource has not interrupt declared while the
> > clockevent has, so it is easy from the driver to know if the description is
> > for a clockevent or a clocksource, IOW it could be implemented at the driver
> > level.
> >
> > So instead of dealing with a named clocksource macro, let's use a more generic
> > one: TIMER_OF_DECLARE.
> >
> > The patch has not functional changes.
> >
> > Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>
> 
> Could you either leave the old name as an alias for one release, or introduce
> the new name as an alias now for 4.13?
> 
> I think that that would make it easier to merge new drivers. Otherwise this
> looks good to me,


New drivers should go through my tree, so I can catch them with the old macro
name and do the change.

> Acked-by: Arnd Bergmann <arnd at arndb.de>

Thanks for the review.

-- 

 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
