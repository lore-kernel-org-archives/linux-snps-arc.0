From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 25 Jul 2017 20:11:18 +0000
Subject: ARC770: "unexpected IRQ trap at vector 00" during boot
In-Reply-To: <5422227b-6ca3-b4f4-91a6-b760a4b98861@adaptrum.com>
References: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
 <4881796E12491D4BB15146FE0209CE6467DBE119@DE02WEMBXB.internal.synopsys.com>
 <5422227b-6ca3-b4f4-91a6-b760a4b98861@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE6467DBED94@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alex,

> -----Original Message-----
> From: Alex [mailto:alex.g at adaptrum.com]
> Sent: Tuesday, July 25, 2017 7:05 AM
> To: Alexey Brodkin <Alexey.Brodkin at synopsys.com>; linux-snps-arc at lists.infradead.org
> Cc: Gokhan Cosgul <gokhan at adaptrum.com>; Vineet.Gupta1 at synopsys.com
> Subject: Re: ARC770: "unexpected IRQ trap at vector 00" during boot
> 
> On 07/24/2017 01:39 PM, Alexey Brodkin wrote:
> > Hi Alexandru,
> >
> >> I'm getting a storm of these messages when trying to boot an in-house
> >> ASIC with an ARC770. This only happens with an ethernet cable plugged
> >> in. I've learned that the actual interrupt number is 21. The issue is
> >> that the irq_find_mapping() in __handle_domain_irq() fails to find a
> >> mapping for vector 21, and the remaining logic will brainlessly print
> >> out '0' as the interrupt number (which is of course, bass-ackwards).
> [snip]
> 
> 
> > That's interesting! I saw exactly the same issue with one of our devboards.
> > What happens here is GMAC generates output interrupt because of some
> > condition(s),
> 
> I'm seeing this when using U-boot to load the kernel over ethernet. I
> think it's enough to have the PHY link autonegotiated to get the
> problem, but I didn't verify this.

Right that matches my observations made back in the day.
It was link status bit (0x1) in ("INT STS" register - offset 0x38). And indeed with cable disconnected
this problem never happened.

> > Answering your question why interrupt from GMAC happens before its driver
> > is probed:
> >  1) I need to look at my notes I made when was fighting with the same problem,
> >      but for some reason DW GMAC seems to have interrupts enabled on reset
> >      which is indeed a bit unexpected and might lead to a behavior you and I saw.
> 
> I'm curious to know what your notes say.

See above.

> 
> >  2) Historically we used to enable all possible core IRQ lines early on boot as opposed
> >      to per-line init by request of each particular driver. We have this on our to-do list
> >      as one of important improvements but that's not a short-term fix for sure.
> 
> 
> >
> > A work-around that I made and which may recommend to you is to figure out what
> > condition in GMAC leads to generation of interrupt on its out and then resetting it in
> > GMAC in your early platform boot code.
> 
> I was afraid that might be the only way. I can keep the GMAC logic in
> reset, but that requires a custom platform early_init(), and a glue
> driver for snps,dwmac.

Well I in case you have U-Boot what you may do (and that really makes sense) is to
clean GMAC's link state flag in _dw_eth_halt() in U-Boot, see
http://git.denx.de/?p=u-boot.git;a=blob;f=drivers/net/designware.c#l264

> > Let me know if it helps.
> 
> Yes. I implemented the proof-of-concept today. It's a very "interesting"
> balancing act on when exactly to release the reset on the GMAC. I'm able
> to get to boot to a shell with ethernet plugged in.

Agree, that's all not as it should be. So I advise you to report that issue to developers of
DW GMAC via Solvnet (https://solvnet.synopsys.com). But if you already have a silicon
then your rants might not be of much help.

BTW what is your exact kernel version?

In the meantime we'll try to revisit rework of ARC's INTC init procedure  but
I cannot promise anything very soon as I'm on ETO this week but we'll see how it goes.

-Alexey
