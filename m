From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 30 Sep 2016 12:49:41 +0200
Subject: NMI for ARC
In-Reply-To: <245c485e-6350-bd7f-97f2-4e35be2c8e2a@synopsys.com>
References: <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
 <20160928071642.GU2794@worktop>
 <CALCETrXJCGMW7DcAVw5mkfiOce4u+3OM3_QLkE117ewU_Hzpsg@mail.gmail.com>
 <20160928203748.GU5012@twins.programming.kicks-ass.net>
 <CALCETrVz48j=fmWtXN9wtSbAP6LNcb-=Uf6biq-9EmMQ=zM8zA@mail.gmail.com>
 <75783d4b-98bf-5d60-a844-20d4eec88ac9@synopsys.com>
 <20160929064341.GH3318@worktop.controleur.wifipass.org>
 <a7fb2709-decd-7aa9-57c4-b996c7755c33@synopsys.com>
 <CALCETrWZ47facpNA0Juf4e9cJN9BsN7YO+8RdSeU2q=uaUgYFw@mail.gmail.com>
 <245c485e-6350-bd7f-97f2-4e35be2c8e2a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160930104941.GI5016@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Sep 29, 2016@12:48:03PM -0700, Vineet Gupta wrote:
> > [1] There's an exception on 64-bit AMD CPUs because AMD blew it.
> > Also, x86 NMI return is itself severely overcomplicated because we don't
> > have good control over NMI nesting.
> 
> For ARC (HS38 cores), there are 16 interrupt priorities (0-high, 15-lowest) and
> each active interrupt has a bit in AUX_IRQ_ACTIVE. If a prio X is active, another
> prio X can't be taken (you can only take higher prio). In that sense nmi (aka prio
> 0) can't nest for us.

Forget you ever read this; the reason for the nested NMIs on x86 is
horrid, but here goes:

The problem is that IRET, the only instruction capable of returning from
_any_ trap/fault/interrupt context automagically unmasks NMIs. And we
'want' to take debug-traps and page-faults from NMI context.

We use debug-traps to synchronize against self-modifying code without
halting the entire machine.

We 'need' page-faults for vmalloc backed memory, the vmalloc page tables
are not globally propagated and we need (minor) faults to populate the
page-tables on demand. And we need page-faults to do user-space access
from NMI context (for the fixup_exception stuff).

Returning from either trap or fault is done through IRET, which then
unmasks NMIs, allowing another NMI to come in while we're still
servicing one.

We have quite the horror cabinet for dealing with this ;-)
