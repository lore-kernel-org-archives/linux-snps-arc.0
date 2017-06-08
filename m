From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 8 Jun 2017 09:38:57 -0700
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <AM5PR0502MB2996FBD57D8591A42ED4A84CAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-12-git-send-email-noamca@mellanox.com>
 <ef2527da-03a3-d60e-f5dd-e5b5932d43d0@synopsys.com>
 <AM5PR0502MB299687067469E99F1A7A509EAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <ef177e34-e2ac-2e05-c136-e5b213687911@synopsys.com>
 <AM5PR0502MB2996A1F4CFE1FE6AEB433A7DAAC80@AM5PR0502MB2996.eurprd05.prod.outlook.com>
 <AM5PR0502MB2996FBD57D8591A42ED4A84CAAC90@AM5PR0502MB2996.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15ef64f3-3b5b-a362-c520-e5316121d3d6@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/07/2017 08:29 PM, Noam Camus wrote:
> *From:* Noam Camus
> *Sent:* Wednesday, June 7, 2017 8:06:17 PM
> *To:* Vineet Gupta; linux-snps-arc at lists.infradead.org
> *Cc:* linux-kernel at vger.kernel.org; Elad Kanfi
> *Subject:* Re: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an 
> exception
>
> *> From:*Vineet Gupta <Vineet.Gupta1 at synopsys.com>
>
> *> Sent:* Wednesday, June 7, 2017 7:15 PM...
>
> > So NPS *hardware* generates exception, jumps to vector mem_service(), which you
> > redirect to the machine check handler - which simply panics.
> > But this redirection is under EZNPS_MEM_ERROR, which you have defaulted to 
> "n". So
> > how is the default working for hardware ? Doesn't it need to be "y"
>
> The NPS400 architects changed userspace bus error behavior to be machine check 
> instead of Interrupt level 2.
> The reason was that since we are dealing with imprecise exception.
> So memory request result will be back to core long time after bad instruction 
> was executed.
> In the meantime core be able to do HW schedule between threads and result may 
> hit another thread.
> The core do not keep information on each such bus transaction so it just 
> interfere current thread without knowing if it was the initiator of this bus 
> transaction.
> In such case we prefer to create machine check and end with PANIC.

Ok this make sense !

>
> With simulator we just turn this configuration on, so we redirect the Legacy 
> Synopsys L2 ISR from nSIM into machine check.
> This way we end up just like with silicon ?

This doesn't make sense :-)
In simulation (where L2 interrupt is asserted), you need to handle it as such - 
say reading out the banked regs for L2 interrupt. What you are doing here is 
handling it like an exception which won't work . I really don't see the point of 
this "alignment" - hardware and simulation are different. simulation semantics are 
already supported by generic ARC code. And for silicon case, the existing vector 
woudl MachineCheck would work for both K and U. So I'm not sure what we are trying 
to achieve here !


>
>
> >BTW it seems your patch is wrong otherwise too. So the userspace bus error will go
> >to machine check handler which currently just panic's. You really want to kill the
> >user space process and continue, thus need to call do_memory_error()
> So I believe that we do correct thing here, when we deal with multi thread cores.

Sure, the imprecise handling of bus error is an issue - but we should atleat try 
to recover. By just panic'ing unconditionally, you are enabling a one liner user 
program to panic the system (granted in simulation only)

-Vineet
