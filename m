From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Oct 2015 15:58:16 +0000
Subject: [RFC] perf: fix building for ARCv1
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44CB4BF@IN01WEMBXA.internal.synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44C9DD2@IN01WEMBXA.internal.synopsys.com>
 <1445166916.9672.10.camel@synopsys.com>
 <87a8rf6a6p.fsf@tassilo.jf.intel.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44C9E9A@IN01WEMBXA.internal.synopsys.com>
 <8761235rwe.fsf@tassilo.jf.intel.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CAFF9@IN01WEMBXA.internal.synopsys.com>
 <20151019093549.GK3816@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB023@IN01WEMBXA.internal.synopsys.com>
 <20151019095157.GM3816@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB43D@IN01WEMBXA.internal.synopsys.com>
 <20151020101133.GA17308@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB4BF@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446134296.3203.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Tue, 2015-10-20@10:45 +0000, Vineet Gupta wrote:
> On Tuesday 20 October 2015 03:41 PM, Peter Zijlstra wrote:
> > > > Can we use existing syscall(s) - again this is what our good old pthread library
> > > > code did.
> > > > 
> > > > static void __pthread_acquire(int * spinlock)
> > > > {
> > > >   int cnt = 0;
> > > >   struct timespec tm;
> > > > 
> > > >   READ_MEMORY_BARRIER();
> > > > 
> > > >   while (testandset(spinlock)) {   <---- atomic EXchange
> > > >     if (cnt < 50) {
> > > >       sched_yield();
> > > >       cnt++;
> > > >     } else {
> > > >       tm.tv_sec = 0;
> > > >       tm.tv_nsec = 2000001;
> > > >       nanosleep(&tm, ((void *)0));
> > > >       cnt = 0;
> > > >     }
> > > >   }
> > *shudder* that is quite horrible.
> > 
> > This means all your 'atomics' are broken for anything SCHED_FIFO and the
> > like. You simply _cannot_ run a realtime system.
> 
> The code above is from uClibc old threading library which we don't use anymore.
> The NPTL version doesn't have all of this song-n-dance and relies on futexes. The
> change we are talking about is only for the atomics in perf itself. I do
> understand your POV though.
> 
> > (also, for ACQUIRE you want the READ_MEMORY_BARRIER() _after_ the
> > test-and-set control dependency.)
> 
> Absolutely and in this case it will have to be added both inside the loop and one
> at the end to cover both the scenarios !
> 

I'm wondering what are our plans for now?
Are we going to accept proposed fix just for ARC in 4.4 (and to all stables then)
or we'll try to come up with more general solution?

-Alexey
