From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 24 Jul 2017 20:39:27 +0000
Subject: ARC770: "unexpected IRQ trap at vector 00" during boot
In-Reply-To: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
References: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE6467DBE119@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexandru,

> I'm getting a storm of these messages when trying to boot an in-house
> ASIC with an ARC770. This only happens with an ethernet cable plugged
> in. I've learned that the actual interrupt number is 21. The issue is
> that the irq_find_mapping() in __handle_domain_irq() fails to find a
> mapping for vector 21, and the remaining logic will brainlessly print
> out '0' as the interrupt number (which is of course, bass-ackwards).
>
> This happens very early in the boot process, right after interrupts are
> globally enabled. IRQ 21 is the correct IRQ vector for the ethernet
> controller, but I don't understand why the IRQ vector is unmasked before
> the ethernet driver is loaded. This is a chicken and egg problem, since
> we have no control over the state of the ethernet before the driver is
> actually loaded.

That's interesting! I saw exactly the same issue with one of our devboards.
What happens here is GMAC generates output interrupt because of some
condition(s), now since GMAC's IRQ line is wired directly to
ARC700's interrupt controller, all line of which get enabled early on boot
(as you correctly mentioned above) and so you're getting an interrupt kernel cannot
serve and reset as it doesn't know how to "please" an interrupt source.

Answering your question why interrupt from GMAC happens before its driver
is probed:
 1) I need to look at my notes I made when was fighting with the same problem,
     but for some reason DW GMAC seems to have interrupts enabled on reset
     which is indeed a bit unexpected and might lead to a behavior you and I saw.
 2) Historically we used to enable all possible core IRQ lines early on boot as opposed
     to per-line init by request of each particular driver. We have this on our to-do list
     as one of important improvements but that's not a short-term fix for sure.

A work-around that I made and which may recommend to you is to figure out what
condition in GMAC leads to generation of interrupt on its out and then resetting it in
GMAC in your early platform boot code.

Let me know if it helps.

-Alexey
