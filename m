From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 21 Jun 2016 09:43:07 +0200
Subject: cross compilers [was build failure of sorts]
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750106944A6C@us01wembx1.internal.synopsys.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com> <57645C16.9040300@synopsys.com>
 <20160618070501.GC30154@twins.programming.kicks-ass.net>
 <20160618101740.GN30927@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA230750106944A6C@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160621074307.GK30154@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Jun 21, 2016@05:29:28AM +0000, Vineet Gupta wrote:
> On Saturday 18 June 2016 03:47 PM, Peter Zijlstra wrote:
> > As you can see, arc doesn't even build upstream binutils :/
> > (binutils-2_26-branch as of today).
> 
> Hmm - we are still in fight w.r.t. upstreaming gcc fully (ARCv2 gcc support)
> although ARCompact has been there for some time. binutils upstream should work -
> I'll check why the buildall stuff fails.

I can run that build again and send you the resulting log files in
private.

> We currently have our tools on github but presume that won't work for you due to
> non canonical location / version !

Right, I have binutils and gcc git, I update those, checkout the latest
'stable' branches and run buildall.

And I do this maybe once or twice a year, mostly when I really need a
newer compiler -- this time I needed GCC-6 (I have 6.1.1 now) in order
to play with new inline asm bits.

Anything that fails, doesn't get compile coverage on my machines
(although the 0day built bot does catch some of the fallout).
