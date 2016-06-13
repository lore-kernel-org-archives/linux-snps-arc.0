From: daniel@ffwll.ch (Daniel Vetter)
Date: Mon, 13 Jun 2016 16:09:30 +0200
Subject: [PATCH 1/3 v2] drm/arcpgu: Make ARC PGU usable on simulation
 platforms
In-Reply-To: <1465822003.4130.22.camel@synopsys.com>
References: <1465568953-21893-1-git-send-email-abrodkin@synopsys.com>
 <1465568953-21893-2-git-send-email-abrodkin@synopsys.com>
 <1465822003.4130.22.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160613140930.GV3363@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Mon, Jun 13, 2016@12:47:33PM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> On Fri, 2016-06-10@17:29 +0300, Alexey Brodkin wrote:
> > From: Ruud Derwig <rderwig at synopsys.com>
> > 
> > In case of simulation there's no real encoder/transmitter device
> > because in the model's virtual LCD??we're rendering whatever
> > appears in frame-buffer memory.
> > 
> > Signed-off-by: Ruud Derwig <rderwig at synopsys.com>
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > ---
> > 
> > Changes v1 -> v2:
> > ?* Got rid of dummy arcpgu_drm_encoder_helper_funcs and now rely on default
> > ???best encoder
> 
> If that version looks good to you could you please provide your Ack?

I just do drive-by comments on driver submissions, review/merge rules are
up to each driver maintainer mostly. But for the warm and fuzzy feeling
I'm happy to ack ;-)

Acked-by: Daniel Vetter <daniel.vetter at ffwll.ch>
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
