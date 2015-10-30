From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 30 Oct 2015 15:54:02 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <alpine.LFD.2.20.1510301113530.630@knanqh.ubzr>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
 <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1510301113530.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446220442.4394.42.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Nicolas,

On Fri, 2015-10-30@11:17 -0400, Nicolas Pitre wrote:
> On Fri, 30 Oct 2015, M?ns Rullg?rd wrote:
> 
> > Nicolas Pitre <nicolas.pitre at linaro.org> writes:
> > 
> > > OK... I was intrigued, so I adapted my ARM code to the generic case, 
> > > including the overflow avoidance optimizations.  Please have look and 
> > > tell me how this works for you.
> > > 
> > > If this patch is accepted upstream, then it could be possible to 
> > > abstract only the actual multiplication part with some architecture 
> > > specific assembly.
> > 
> > Good idea.
> 
> Could you please provide a reviewed-by or acked-by tag?

Sure!

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>

BTW I thought about that optimization a bit more and now I think
we may even skip addition of arch-specific assembly insertions.

That's because that kind of division as discussed many times
should be used as limited as possible, in other words there should be
just a very few usages of it especially in very frequently used code paths.
And in that case there might be not much of benefit having do_div()
even faster and smaller than the one we're about to get with your change.

-Alexey
