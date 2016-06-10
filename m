From: daniel@ffwll.ch (Daniel Vetter)
Date: Fri, 10 Jun 2016 16:54:02 +0200
Subject: [PATCH 03/27] drm/arc: Actually bother with handling atomic
 events.
In-Reply-To: <20160610141927.GA3363@phenom.ffwll.local>
References: <20160609122631.GO3363@phenom.ffwll.local>
 <1465476465.3203.66.camel@synopsys.com>
 <20160609132327.GQ3363@phenom.ffwll.local>
 <1465478829.3203.68.camel@synopsys.com>
 <20160609135222.GS3363@phenom.ffwll.local>
 <1465482496.3203.73.camel@synopsys.com>
 <CAKMK7uGmLNhJmtT+FyZ-uyGbv2Th96hJfqMUEStjqp3HKYdjMg@mail.gmail.com>
 <CAKMK7uGjoLcKib6zXnO5wFBzOvKhbWZg9o8zi_BwA+vNGDoToA@mail.gmail.com>
 <1465564954.2942.40.camel@synopsys.com>
 <20160610141927.GA3363@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160610145402.GG3363@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Fri, Jun 10, 2016@04:19:27PM +0200, Daniel Vetter wrote:
> On Fri, Jun 10, 2016@01:23:22PM +0000, Alexey Brodkin wrote:
> > Hi Daniel,
> > 
> > On Thu, 2016-06-09@16:37 +0200, Daniel Vetter wrote:
> > > On Thu, Jun 9, 2016@4:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > 
> > > > On Thu, Jun 9, 2016 at 4:29 PM, Alexey Brodkin
> > > > <Alexey.Brodkin@synopsys.com> wrote:
> > > > > 
> > > > > Hi Daniel,
> > > > > 
> > > > > On Thu, 2016-06-09@15:52 +0200, Daniel Vetter wrote:
> > > > > > 
> > > > > > 
> > > > > > The fake implementation is fundamentally racy, and I don't want to write
> > > > > > helpers which can't be used correctly. Anyway I think without this patch
> > > > > > (or something similar) arcpgu will stall badly with the new nonblocking
> > > > > > helpers, because arcpgu didn't bother at all to implement nonblocking. Can
> > > > > > you pls ack this, or even better, test the entire patch series? The
> > > > > > helpers themselves should work, but in all 5 drivers tested thus far they
> > > > > > discovered some bugs.
> > > > > Sure I will happily test this series.
> > > > > The only question then is what should I use as a proper base?
> > > > It should apply on drm-next from Dave.
> > >
> > > And indeed it won't work at all because arcpgu doesn't call
> > > drm_crtc_handle_vblank anywhere. So you need to add your patch to
> > > enable vblank interrupts somewhere. Note that as long as you leave
> > > max_vblank_counter as 0, the only bits you need is drm_vblank_init and
> > > drm_crtc_handle_vblanke() from the irq handler.
> > 
> > So is there any sense in testing that series if vblank interrupt is not yet
> > supported (I'm looking forward to implementing it sometime soon but definitely
> > I'm not there yet)?
> 
> Well, it might break your driver, so yes. I'm ofc happy to help unbreak it,
> but without someone who tests there's not much I can do, so will just go
> ahead and apply and hope it works.

Ok I went ahead and pushed a slight revised version of that patch which
just unconditionally sends out the event. That's not correct, but at least
that way the nonblocking changes won't totally break arcpgu and I can move
ahead with those.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
