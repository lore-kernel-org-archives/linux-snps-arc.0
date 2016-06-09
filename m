From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 9 Jun 2016 10:54:45 +0000
Subject: [PATCH 03/27] drm/arc: Actually bother with handling atomic
 events.
In-Reply-To: <20160608143004.GE3363@phenom.ffwll.local>
References: <1465388359-8070-1-git-send-email-daniel.vetter@ffwll.ch>
 <1465388359-8070-3-git-send-email-daniel.vetter@ffwll.ch>
 <a29a4f82-1699-1c33-73ea-5b8043b53e35@linux.intel.com>
 <20160608143004.GE3363@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465469639.3203.57.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Wed, 2016-06-08@16:30 +0200, Daniel Vetter wrote:
> On Wed, Jun 08, 2016@04:14:38PM +0200, Maarten Lankhorst wrote:
> > 
> > Op 08-06-16 om 14:18 schreef Daniel Vetter:
> > > 
> > > The drm core has a nice ready-made helper for exactly the simple case
> > > where it should fire on the next vblank.
> > > 
> > > Note that arming the vblank event in _begin is probably too early, and
> > > might easily result in the vblank firing too early, before the new set
> > > of planes are actually disabled. But that's kinda a minor issue
> > > compared to just outright hanging userspace.
> > > 
> > > v2: Be more robust and either arm, when the CRTC is on, or just send
> > > the event out right away.
> > > 
> > > Cc: Carlos Palminha <palminha at synopsys.com>
> > > Cc: Alexey Brodkin <abrodkin at synopsys.com>
> > > Cc: linux-snps-arc at lists.infradead.org
> > > Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
> > Wouldn't it be better to do this in atomic_flush then?
> I'm not going to fix up other people's drivers completely, just enough to
> hopefully not break them. If arc also blocks vblank interrupts with the go
> bit, then doing this in _begin is correct. Either way it needs hw-specific
> knowledge to asses whether it's correct, since doing the vblank event
> stuff in _flush is also racy without some prevention.

Actually in ARC PGU driver that was one of many other copy-pastes from
other drivers. I.e. for me this is another boilerplate and if that's the
same for other drivers as well probably that's a good candidate for
generalization into something like?drm_helper_crtc_atomic_check().

-Alexey
