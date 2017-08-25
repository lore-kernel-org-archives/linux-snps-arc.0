From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 25 Aug 2017 23:02:18 +0200 (CEST)
Subject: [PATCH v3 03/11] ARC: Allow irq threading
In-Reply-To: <alpine.DEB.2.20.1708252252430.2124@nanos>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
 <1497516241-16446-4-git-send-email-noamca@mellanox.com>
 <12582c31-9ff0-708c-5c85-1e31efd2a170@synopsys.com>
 <alpine.DEB.2.20.1708252252430.2124@nanos>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1708252300540.2124@nanos>
To: linux-snps-arc@lists.infradead.org

On Fri, 25 Aug 2017, Thomas Gleixner wrote:

> On Fri, 25 Aug 2017, Vineet Gupta wrote:
> > On 06/15/2017 01:43 AM, Noam Camus wrote:
> > > From: Noam Camus <noamc at ezchip.com>
> > > 
> > > Working with NPS400 we noticed that there is a possibility of L1
> > > interrupt nesting that may run out kernel stack.
> > > The scenario include serving invoke_softirqs() from irq_exit()
> > > and once local_irq_enable() called can hit another one before we
> > > managed to restore last one and pop some place from kernel stack.
> > > 
> > > Serving softirqs at dedicated kernel thread may mitigate this.
> > > We see that many architectures, including x86, behave like this.
> 
> Well, no. x86 supports that, but that does not mean many user add it to the
> command line.

The real fix for that is to use dedicated irq and softirq stacks instead of
using the potentially deep thread stack for everything. That's what x86 and
others do unconditinally.

Thanks,

	tglx
