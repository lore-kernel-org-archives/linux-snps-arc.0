From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 25 Feb 2016 15:06:54 +0100
Subject: Interesting csd deadlock on ARC
In-Reply-To: <56CD36CD.2080303@synopsys.com>
References: <56C6BA82.1060909@synopsys.com> <56CBEC66.2030401@synopsys.com>
 <20160223095824.GH6356@twins.programming.kicks-ass.net>
 <56CD36CD.2080303@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160225140654.GL6357@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Feb 24, 2016@10:21:25AM +0530, Vineet Gupta wrote:
> >> What I actually meant was is it OK for irq_work_queue_on() to be called locally
> >> (is this a sched bug/optimization(. Further if it is OK to be called, does it need
> >> to do behave more like irq_work_queue() i.e. call arch_irq_work_raise() or
> >> arch_send_call_function_single_ipi() is expected to handle sending IPI to self !
> > 
> > Right, so I'm not actually sure we started out with this requirement.
> > But you're not the first to run into this, see:
> > 
> >   lkml.kernel.org/r/CAJZ5v0gLankSuziQq25qTCyNqeOX43yD9jnJu_XXwbdyajfmKg at mail.gmail.com
> > 
> > Initially I think irq_work_queue_on() was only used remotely, but I
> > think it makes sense to allow the current cpu, esp. since people seem to
> > be using it like that.
> 
> So it seems Russell's questions in the thread above stands still. IMO we need to
> massage irq_work_queue_on() to handle the case of called for local cpu. This will
> automatically take care of CONFIG_SMP kernel running on UP hardware.

Hmm, I missed that there was still an open question.

Afaict the only thing that needs doing to the generic code is drop the
CONFIG_SMP guard, no?
