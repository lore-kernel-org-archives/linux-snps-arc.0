From: marc.zyngier@arm.com (Marc Zyngier)
Date: Tue, 12 Jan 2016 09:28:11 +0000
Subject: [PATCH v4 05/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E84795@us01wembx1.internal.synopsys.com>
References: <1450228238-4499-1-git-send-email-noamc@ezchip.com>
 <1450228238-4499-6-git-send-email-noamc@ezchip.com>
 <56712F50.6050404@arm.com>
 <DB5PR02MB1141324364E0253DAA030DF1D6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <5673EC2D.5040307@arm.com>
 <DB5PR02MB1141A1E0BE574A713957650BD6E10@DB5PR02MB1141.eurprd02.prod.outlook.com>
 <567434DF.2030201@arm.com> <5683C178.7080706@synopsys.com>
 <5694A48F.5000800@synopsys.com> <5694BDD1.70201@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E84795@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5694C72B.2060702@arm.com>
To: linux-snps-arc@lists.infradead.org

On 12/01/16 09:12, Vineet Gupta wrote:

[...]

>> HANDLE_DOMAIN_IRQ is not mandatory at all - a number of architectures
>> had something open-coded in the past (with some drawbacks and/or bugs),
>> and this config option is just one of the ways to get it right.
>>
>> MIPS/PPC perform the reverse lookup directly, without using this
>> infrastructure, and that would be a valid approach for ARC too.
> 
> I'd rather use the generic infrastructure and improve it if needed !
> 
>>>> Marc, I hope you are back from holidays. When u get a chance could you please
>>>> respond to above.
>>>>
>>>> Also I tool a stab at it anyways.
>>>> 1. Enabled HANDLE_DOMAIN_IRQ
>>>> 2. arch_do_IRQ() calls handle_domain_irq(NULL, hwirq, regs) since that code
>>>> doesn't know about domains.
>>>>
>>>> It fails w/o irq_set_default_host() being called.
>> Well, that's expected. unless you use the underlying primitive
>> (__handle_domain_irq) and pass false as the parameter for lookup (see
>> handle_IRQ() in arch/arm/kernel/irq.c). This is what we use for "legacy"
>> platforms that do not support domains.
> 
> Right I saw that and that causes virq = hwirq - kind of defeats the purpose if we
> were doing this on ARC.

You can forget about this if you convert all your platforms to using
domains. But if you have to deal with a transition period (which, in the
ARM case, will last exactly forever because some platforms will never be
converted to DT), this comes in handy.

>>
>>>> If we go back to sunxi example you quoted above, it relies on driver passing the
>>>> domain to handle_domain_irq(). IMHO it is simpler if we had the default domain.
>>>>
>>>> So long story short, ARC can be made to use handle_domain_irq() w/o the song and
>>>> dance of registering another callback from irqchip code if we retained the default
>>>> domain setting.
>> This only works if you can guarantee that you will never have another
>> irqchip calling irq_set_default_host()... If your system is always
>> simple enough to guarantee that, why not.
> 
> ATM we can certainly assume that.
> 
> However with ARM approach two irqchips can still call set_handle_irq() and only
> the first one succeeds (and others return silently). That seems wrong to me -
> irq_xxx.c will still use the handler registered by say irq_sun41.c ?

Oh, this is by no mean foolproof. We do rely on irqchips installing
their primary handler only if they are truly the primary irqchip (they
do not have a parent). Anything else will fail badly.

So if you're confident that you can ensure that noone will set de
default domain twice, you'll be fine.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
