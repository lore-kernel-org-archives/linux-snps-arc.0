From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 21 Jun 2016 11:45:37 +0200
Subject: cross compilers [was build failure of sorts]
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750106944BC0@us01wembx1.internal.synopsys.com>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com> <57645C16.9040300@synopsys.com>
 <20160618070501.GC30154@twins.programming.kicks-ass.net>
 <20160618101740.GN30927@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA230750106944A6C@us01wembx1.internal.synopsys.com>
 <20160621074307.GK30154@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA230750106944BC0@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160621094537.GP30909@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Jun 21, 2016@09:28:56AM +0000, Vineet Gupta wrote:
> On Tuesday 21 June 2016 01:13 PM, Peter Zijlstra wrote:
> > On Tue, Jun 21, 2016@05:29:28AM +0000, Vineet Gupta wrote:
> >> > On Saturday 18 June 2016 03:47 PM, Peter Zijlstra wrote:
> >>> > > As you can see, arc doesn't even build upstream binutils :/
> >>> > > (binutils-2_26-branch as of today).
> >> > 
> >> > Hmm - we are still in fight w.r.t. upstreaming gcc fully (ARCv2 gcc support)
> >> > although ARCompact has been there for some time. binutils upstream should work -
> >> > I'll check why the buildall stuff fails.
> > I can run that build again and send you the resulting log files in
> > private.
> 
> Thx for the off-list log. The issue is gdb not yet upstream. So it seems we will
> have to wait for things on upstreaming to settle down before I can formally update
> segher's scripts to support ARC.

Ah, lemme add --disable-gdb to the binutils build.

Should arc-*-* list gdb in their noconfigdirs like many other archs do
too?
