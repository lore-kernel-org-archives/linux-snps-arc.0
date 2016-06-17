From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 17 Jun 2016 14:27:56 -0700
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <57645C16.9040300@synopsys.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com> <57645C16.9040300@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160617212756.GA19848@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On Fri, Jun 17, 2016@10:22:46PM +0200, Vineet Gupta wrote:
> On Friday 17 June 2016 06:04 PM, Ingo Molnar wrote:
> >> I've misplaced my arc compiler, but does this make it go again?
> > There's no arc compiler on korg's cross-building directory.
> 
> Yeah, I'd requested that a few times...
> 
> However we do have ARC kernels building at atleast 2 places
> 1. Guenther's build service which sent this error report
> 2. kisskb build by Michale Ellerman
> 
> Although I don't know if it is possible to download cross tools from either of above.
> 
Unfortunately no for mine. I tried to put the toolchains I use on github,
but the images are too large, and I hit the github repository size limit.

Guenter
