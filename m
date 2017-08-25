From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 25 Aug 2017 22:59:42 +0200 (CEST)
Subject: [PATCH v3 03/11] ARC: Allow irq threading
In-Reply-To: <12582c31-9ff0-708c-5c85-1e31efd2a170@synopsys.com>
References: <1497516241-16446-1-git-send-email-noamca@mellanox.com>
 <1497516241-16446-4-git-send-email-noamca@mellanox.com>
 <12582c31-9ff0-708c-5c85-1e31efd2a170@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1708252252430.2124@nanos>
To: linux-snps-arc@lists.infradead.org

On Fri, 25 Aug 2017, Vineet Gupta wrote:
> On 06/15/2017 01:43 AM, Noam Camus wrote:
> > From: Noam Camus <noamc at ezchip.com>
> > 
> > Working with NPS400 we noticed that there is a possibility of L1
> > interrupt nesting that may run out kernel stack.
> > The scenario include serving invoke_softirqs() from irq_exit()
> > and once local_irq_enable() called can hit another one before we
> > managed to restore last one and pop some place from kernel stack.
> > 
> > Serving softirqs at dedicated kernel thread may mitigate this.
> > We see that many architectures, including x86, behave like this.

Well, no. x86 supports that, but that does not mean many user add it to the
command line.

> > Note 1: All interrupts which must be non threaded
> > should be marked IRQF_NO_THREAD.
> > Note 2: using kernel param "threadirqs" is needed to actually
> > turn this on. This configuration is only a preperation.
> > 
> > Signed-off-by: Noam Camus <noamc at ezchip.com>
> > ---
> >   arch/arc/Kconfig |    1 +
> >   1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> > index a545969..f464f97 100644
> > --- a/arch/arc/Kconfig
> > +++ b/arch/arc/Kconfig
> > @@ -33,6 +33,7 @@ config ARC
> >   	select HAVE_OPROFILE
> >   	select HAVE_PERF_EVENTS
> >   	select HANDLE_DOMAIN_IRQ
> > +	select IRQ_FORCED_THREADING
> >   	select IRQ_DOMAIN
> >   	select MODULES_USE_ELF_RELA
> >   	select NO_BOOTMEM> 
> 
> As Noam notes above and looking at work needed in other arches prior to
> switching to this: we need mark the low level ints as NO_THREAD.
> 
> ARC ipi, timer, perf interrupts happen to use request_percpu_irq() which
> doesn't take flags and doesn't seem to force NO_THREAD internally either. Does
> that mean we first need to convert all of these sites to
> __request_percpu_irq(.. NO_THREAD ...) or is there a better way of doing this
> !

PER CPU interrupts are excluded from force threading automatically.

Thanks,

	tglx
