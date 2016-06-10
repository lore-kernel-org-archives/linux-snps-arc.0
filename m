From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 10 Jun 2016 15:16:36 +0000
Subject: [PATCH 03/27] drm/arc: Actually bother with handling atomic
 events.
In-Reply-To: <20160610150900.GH3363@phenom.ffwll.local>
References: <20160609132327.GQ3363@phenom.ffwll.local>
 <1465478829.3203.68.camel@synopsys.com>
 <20160609135222.GS3363@phenom.ffwll.local>
 <1465482496.3203.73.camel@synopsys.com>
 <CAKMK7uGmLNhJmtT+FyZ-uyGbv2Th96hJfqMUEStjqp3HKYdjMg@mail.gmail.com>
 <CAKMK7uGjoLcKib6zXnO5wFBzOvKhbWZg9o8zi_BwA+vNGDoToA@mail.gmail.com>
 <1465564954.2942.40.camel@synopsys.com>
 <20160610141927.GA3363@phenom.ffwll.local>
 <20160610145402.GG3363@phenom.ffwll.local>
 <1465570815.7097.4.camel@synopsys.com>
 <20160610150900.GH3363@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465571748.7097.9.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Fri, 2016-06-10@17:09 +0200, Daniel Vetter wrote:
> On Fri, Jun 10, 2016@03:01:03PM +0000, Alexey Brodkin wrote:
> >?
> > > Ok I went ahead and pushed a slight revised version of that patch which
> > > just unconditionally sends out the event. That's not correct, but at least
> > > that way the nonblocking changes won't totally break arcpgu and I can move
> > > ahead with those.
> > Thanks for that.
> > In the meantime I tried previously sent patches:
> > --------------->8-------------
> > 9267484 drm/arc: Actually bother with handling atomic events.
> > cf4a489 drm/arc: Nuke event_list
> > 9c3152e drm/atomic-helper: Massage swap_state signature somewhat
> > --------------->8-------------
> > and on both boards (axs103 and nSIM OSCI) video works quite fine.
>
> The possible breakage only starts when you move further into the series,
> up to patch 10. That implements generic nonblocking commit, but that
> support relies upon crtc_state->event being signalled. Anyway I'm pulling
> it all into drm-misc now, so you can just test that branch (or linux-next
> when it's rebuild next week).

Ok thanks anyways.
I'll try linux-next once it gets updated with your changes.

-Alexey
