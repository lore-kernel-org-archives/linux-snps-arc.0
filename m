From: noamc@ezchip.com (Noam Camus)
Date: Thu, 31 Dec 2015 05:21:26 +0000
Subject: [PATCH v5 10/20] ARC: IRQ: do not use hwirq directly at
 arch_do_IRQ()
In-Reply-To: <5683AD9E.10501@synopsys.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-11-git-send-email-noamc@ezchip.com>,
 <5683AD9E.10501@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB138766FD1F3455F09AC8FD1BD6FE0@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
>Sent: Wednesday, December 30, 2015 12:10 PM

>> --- a/arch/arc/Kconfig
>> +++ b/arch/arc/Kconfig
>> @@ -32,6 +32,7 @@ config ARC
>>       select HAVE_OPROFILE
>>       select HAVE_PERF_EVENTS
>>       select IRQ_DOMAIN
>> +     select HANDLE_DOMAIN_IRQ if ARC_PLAT_EZNPS

>On same lines as prev comment - just do this unconditionally for ARC port -
assuming this works with legacy domain as well.

Yes it should work for legacy domain.
On the other hand I can select it at the driver Kconfig itself and remove this line altogether.


>>
>> +#ifdef CONFIG_HANDLE_DOMAIN_IRQ
>> +extern void set_handle_irq(void (*handle_irq)(unsigned int hwirq,
>> +                                           struct pt_regs *));
>> +#endif

>Not needed !

I need to have it since we do not know at arch/arc/kernel/irq.c what is the domain allocated by the timer driver
