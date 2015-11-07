From: noamc@ezchip.com (Noam Camus)
Date: Sat, 7 Nov 2015 20:52:10 +0000
Subject: [PATCH v2 04/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <alpine.DEB.2.11.1511071227030.4032@nanos>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-5-git-send-email-noamc@ezchip.com>,
 <alpine.DEB.2.11.1511071227030.4032@nanos>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141A8FD2BC4427FBAF2C286D6170@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Thomas Gleixner <tglx at linutronix.de>
>Sent: Saturday, November 7, 2015 1:38 PM

>> +     /*
>> +      * GIM interrupt select type for
>> +      * dbg_lan TX and RX interrupts
>> +      * should be type 1
>> +      * type 0 = IRQ line 6
>> +      * type 1 = IRQ line 7
>> +      */
>> +     gim_p_int_dst.is = 1;

>More magic structs to set a single bit, right?
I will replace all such magic with macros.

>> +     ienb &= ~(1 << data->irq);

>You should not rely on data->irq ever. It's the Linux interrupt number
>and it does not necessarily have a 1:1 mapping to the hardware
>nterrupt number. Its working for legacy domains, but there
>data->hwirq is set up for you as well.
Thanks, I will use data->hwirq instead of data->irq.


>> +     write_aux_reg(AUX_IENABLE, ienb);

>I can see how that works for per cpu interrupts, but what happens if
>two cpus run that concurrent for two different interrupts?

Each CPU got its own HW copy of auxiliary register IENABLE, so concurrent access won't be a trouble.
 
-Noam
