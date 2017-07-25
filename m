From: alex.g@adaptrum.com (Alex)
Date: Mon, 24 Jul 2017 21:04:50 -0700
Subject: ARC770: "unexpected IRQ trap at vector 00" during boot
In-Reply-To: <4881796E12491D4BB15146FE0209CE6467DBE119@DE02WEMBXB.internal.synopsys.com>
References: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
 <4881796E12491D4BB15146FE0209CE6467DBE119@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5422227b-6ca3-b4f4-91a6-b760a4b98861@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

On 07/24/2017 01:39 PM, Alexey Brodkin wrote:
> Hi Alexandru,
>
>> I'm getting a storm of these messages when trying to boot an in-house
>> ASIC with an ARC770. This only happens with an ethernet cable plugged
>> in. I've learned that the actual interrupt number is 21. The issue is
>> that the irq_find_mapping() in __handle_domain_irq() fails to find a
>> mapping for vector 21, and the remaining logic will brainlessly print
>> out '0' as the interrupt number (which is of course, bass-ackwards).
[snip]


> That's interesting! I saw exactly the same issue with one of our devboards.
> What happens here is GMAC generates output interrupt because of some
> condition(s),

I'm seeing this when using U-boot to load the kernel over ethernet. I 
think it's enough to have the PHY link autonegotiated to get the 
problem, but I didn't verify this.

> Answering your question why interrupt from GMAC happens before its driver
> is probed:
>  1) I need to look at my notes I made when was fighting with the same problem,
>      but for some reason DW GMAC seems to have interrupts enabled on reset
>      which is indeed a bit unexpected and might lead to a behavior you and I saw.

I'm curious to know what your notes say.

>  2) Historically we used to enable all possible core IRQ lines early on boot as opposed
>      to per-line init by request of each particular driver. We have this on our to-do list
>      as one of important improvements but that's not a short-term fix for sure.


>
> A work-around that I made and which may recommend to you is to figure out what
> condition in GMAC leads to generation of interrupt on its out and then resetting it in
> GMAC in your early platform boot code.

I was afraid that might be the only way. I can keep the GMAC logic in 
reset, but that requires a custom platform early_init(), and a glue 
driver for snps,dwmac.

> Let me know if it helps.

Yes. I implemented the proof-of-concept today. It's a very "interesting" 
balancing act on when exactly to release the reset on the GMAC. I'm able 
to get to boot to a shell with ethernet plugged in.

Alex
