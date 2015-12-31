From: noamc@ezchip.com (Noam Camus)
Date: Thu, 31 Dec 2015 05:14:34 +0000
Subject: [PATCH v5 11/20] ARC: IPI: do not use generic IRQ domain
In-Reply-To: <5683AE3B.900@synopsys.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-12-git-send-email-noamc@ezchip.com>,
 <5683AE3B.900@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB1387ACCF6EA0EADEE8DE9817D6FE0@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
>Sent: Wednesday, December 30, 2015 12:13 PM

>>  generic-y += fb.h
>>  generic-y += fcntl.h
>>  generic-y += ftrace.h
>> -generic-y += hardirq.h

>So this is going backwards - copy/paste generic code into arch header
I don't understand why you need this !

I need an extra field (ipi_irqs) at struct irq_cpustat_t and I cannot do this at asm-generic.

See below that how I use it to save and show status for each cpu

>> +void arch_do_IPI(unsigned int irq, struct pt_regs *regs)
>> +{
>> +     struct pt_regs *old_regs = set_irq_regs(regs);
>> +     unsigned int cpu = smp_processor_id();
>> +
>> +     __IRQ_STAT(cpu, ipi_irqs)++;
>> +
>> +     irq_enter();
>> +     do_IPI(irq, NULL);
>> +     irq_exit();
>> +
>> +     set_irq_regs(old_regs);
>> +}

>WHY ?

Please explain
