From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 13 May 2016 11:51:05 +0200
Subject: [PATCH] irqchip: nps: add 64BIT dependency
In-Reply-To: <573591DD.6040403@synopsys.com>
References: <1463087038-2522527-1-git-send-email-arnd@arndb.de>
 <57358F52.706@arm.com> <573591DD.6040403@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2976650.9K4CeZnHUc@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday 13 May 2016 14:05:41 Vineet Gupta wrote:
> On Friday 13 May 2016 01:54 PM, Marc Zyngier wrote:
> > On 12/05/16 22:03, Arnd Bergmann wrote:
> ...
> >>  
> >>  config EZNPS_GIC
> >>      bool "NPS400 Global Interrupt Manager (GIM)"
> >> +    depends on ARC || (COMPILE_TEST && !64BIT)
> >>      select IRQ_DOMAIN
> >>      help
> >>        Support the EZchip NPS400 global interrupt controller
> >>
> > 
> > Acked-by: Marc Zyngier <narc.zyngier at arm.com>
> > 
> > As I've already started collecting fixes that are aimed at -rc1 (mostly
> > to avoid dependencies), I can queue that as well.
> 
> There is a slight logistics issue here - as agreed the driver will go in 4.7-rc1
> via ARC tree. So either I pick the fix for rc1 or you apply it post rc1 - or
> towards the end of rc1 ?
> 

I'd say the best option is to have you pick up the fix for the ARC tree,
but either way works.

	Arnd
