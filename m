From: nicolas.pitre@linaro.org (Nicolas Pitre)
Date: Fri, 30 Oct 2015 11:17:17 -0400 (EDT)
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
 <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.LFD.2.20.1510301113530.630@knanqh.ubzr>
To: linux-snps-arc@lists.infradead.org

On Fri, 30 Oct 2015, M?ns Rullg?rd wrote:

> Nicolas Pitre <nicolas.pitre at linaro.org> writes:
> 
> > OK... I was intrigued, so I adapted my ARM code to the generic case, 
> > including the overflow avoidance optimizations.  Please have look and 
> > tell me how this works for you.
> >
> > If this patch is accepted upstream, then it could be possible to 
> > abstract only the actual multiplication part with some architecture 
> > specific assembly.
> 
> Good idea.

Could you please provide a reviewed-by or acked-by tag?


Nicolas
