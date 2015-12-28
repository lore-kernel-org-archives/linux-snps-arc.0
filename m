From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Dec 2015 17:12:55 +0530
Subject: [PATCH v5 09/20] ARC: IRQ: use device tree to get timer device
 configuration
In-Reply-To: <1451222619-3610-10-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-10-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5681203F.1010907@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> We've designated:
> TIMER0 for events (clockevents)
> TIMER1 for free running (clocksource)
> 
> Till now timer configuration was done on arch/arc/kernel/time.c
> with constant values.
> 
> This commit add device tree support so we can do this work
> at dedicated clocksource driver which parse the DT blob.
> 
> Such driver will get clocksource rate as well as interrupt line
> from DT and use them for setting clocksourcse and clockevents.
> 
> Note that lately called of_clk_init() is moved before we call
> clocksource_probe() since at that time device from DT
> need a "provider" (clocks) which will be available only after
> we call to of_clk_init().
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>

For patches which change semantically, ACK should not be copied over from prev
version. I do have some reservation with this patch.

I think we should just fix ARC once and for all by removing the legacy
registration. This would be a flag day change but I think we should be fine !
No point in keeping 2 implementations !

@Noam let me take a stab at it - OK !

-Vineet
