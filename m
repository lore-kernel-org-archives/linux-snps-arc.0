From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 11 Feb 2016 07:23:32 +0000
Subject: Signal handle without calling exit
References: <C2D7FE5348E1B147BCA15975FBA23075F4E8910B@us01wembx1.internal.synopsys.com>
 <j9q7c9573c51t2kqcbtba86f.1455130610074@com.syntomo.email>
 <C2D7FE5348E1B147BCA15975FBA23075F4E89266@us01wembx1.internal.synopsys.com>
 <fc27ulxa4nta7q5fmdcs9tab.1455173426287@com.syntomo.email>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E892A5@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org


On Thursday 11 February 2016 12:27 PM, Noam Camus wrote:
>
> Hi Vineet,
>
> In case user caused an exception that kernel turned into sinal that the user
> caught with its own implementation without calling exit.
> What we expect to happen when signal handler ends?
> Would it return to the same instruction the one after it or other?
> Is it in the first forbidden to not call exit?
>
> Noam
>

Some signals can't be caught - and depending on default behaviour kernel will kill
the task - it is not user task which calls exit.
For those where catching is allowed - e.g. segv, if handler doesn't do anything -
kernel will resume at exactly the same instruction.
So u could have an interesting loop in app - if tries to access NULL pointer with
signal handler installed for segv, and that handler does nothing.
Now your signal handler can tweak the register corresponding to PC in sigcontext
(ret for ARC) and kernel will use that for return to userspace - so the faulting
instruction will be avoided.

-Vineet
