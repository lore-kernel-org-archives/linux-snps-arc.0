From: john.stultz@linaro.org (John Stultz)
Date: Wed, 11 Sep 2019 09:06:01 -0700
Subject: [PATCH 0/7] add support for clocksource/clockevent DT selection
In-Reply-To: <cb451591-88ad-f1b3-b654-cea86ae11cac@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
 <cb451591-88ad-f1b3-b654-cea86ae11cac@microchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALAqxLXRVc-K5q=me1=5tA0XYT7ncrArSoD+hq=JOGWVF9-7SQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 10, 2019@11:52 PM <Claudiu.Beznea@microchip.com> wrote:
> On 10.09.2019 19:05, John Stultz wrote:
> > External E-Mail
> > On Tue, Sep 10, 2019 at 6:47 AM Claudiu Beznea
> > <claudiu.beznea@microchip.com> wrote:
> >>
> >> This series adds support to permit the selection of clocksource/clockevent
> >> via DT.
> >
> > Sorry about this, but could you try to include more of a rational for
> > *why* this would be useful in your cover-letter/commit messages?
> >
>
> Sorry for not being to clear in the cover letter.
>
> The case I am trying to solve here is as follows:
> The timer hardware for which I publish a driver at [1] cannot work at the
> same time as a clocksource and clockevent. On some of our platforms we have
> more than one such a timer. So we could use one hardware resource as
> clocksource and one as clockevent but not one for both.
> Due to this, I proposed in the driver at [1] to have 1st probed hardware to
> work as clocksource and the 2nd one to work as clockevent.
[snip]
> Due to this Daniel proposed to have an unified mechanism for this scenario,
> see [2], (something like what I proposed in this series), such that to have
> a determinism b/w the function that the hardware resources would behave
> (either clocksource or clockevent or both).

Thanks for the additional explanation! I'd suggest adding something
like it to the commit logs for next time.

Personally, I tend to think of DT bindings as a big harry ABI, and as
such avoid it as much as possible. :)

I'd probably favor driver tweaks to ensure the hardware only gets
registered once for each, using a minimal DT compatible or flag on the
hardware to better describe the underlying hardware quirk that keeps
it from being usable for both clocksource and clockevent usage.

That way the DT sticks to accurately describing hardware, instead of
system/software-abstraction configuration details that just apply for
Linux.

But, again, I'm not really a DT person, so I'll defer to Rob and Daniel.

thanks
-john
