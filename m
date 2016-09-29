From: luto@amacapital.net (Andy Lutomirski)
Date: Thu, 29 Sep 2016 10:30:02 -0700
Subject: NMI for ARC
In-Reply-To: <75783d4b-98bf-5d60-a844-20d4eec88ac9@synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
 <564B0E18.3040207@synopsys.com>
 <20151117122401.GY3816@twins.programming.kicks-ass.net>
 <20151117122540.GL11639@twins.programming.kicks-ass.net>
 <564B2341.4030409@synopsys.com>
 <20151117131538.GZ3816@twins.programming.kicks-ass.net>
 <3b23d64c-2579-b72e-645a-e7ece3c1a3c6@synopsys.com>
 <20160928071642.GU2794@worktop>
 <CALCETrXJCGMW7DcAVw5mkfiOce4u+3OM3_QLkE117ewU_Hzpsg@mail.gmail.com>
 <20160928203748.GU5012@twins.programming.kicks-ass.net>
 <CALCETrVz48j=fmWtXN9wtSbAP6LNcb-=Uf6biq-9EmMQ=zM8zA@mail.gmail.com>
 <75783d4b-98bf-5d60-a844-20d4eec88ac9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALCETrV5mWJx5fhfkjdgk+FpqjvPhDvxyn0xbWDDkAMmW-9n+A@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sep 28, 2016 6:20 PM, "Vineet Gupta" <vgupta@synopsys.com> wrote:
>
> On 09/28/2016 03:26 PM, Andy Lutomirski wrote:
> >> Right, so what I think Vineet is asking is if we need to disable NMIs as
> >> > well, we cannot on x86 disable NMIs so no.
> >> >
> > The same argument works here, too: an NMI won't set TIF_NEED_RESCHED
> > without sending an IPI, so we can't miss a wakeup.
>
> But what exact wakeup miss are we taking about here. If intr were NOT disabled,
> how could this happen. Just trying to understand the need for "irqs-disabled" in
> resume_{user,kernel}_*
>
> The intr disabled before reg file restore makes complete sense though.

An interrupt after the TIF_NEED_RESCHED check could set
TIF_NEED_RESCHED (because it woke a waiting task), and the resume code
wouldn't notice.  No IPI would be sent because TIF_NEED_RESCHED on the
current task is supposed to be acted on in a timely manner without
one.

More severe problems could happen.  A signal could be queued or, on
x86, a return-to-usermode notifier could be set by KVM on a
preemptible kernel.  The latter, if missed, will bring down the whole
machine.
