From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 28 Jun 2016 08:31:40 +0000
Subject: Click source driver
References: <44r6tdw0jo5mq07ioknlqbb8.1465583927061@email.android.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750106948283@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 11 June 2016 01:12 AM, Noam Camus wrote:
>
> Hi Vineet,
>
> I am updating my clocksource driver to include support of timer0 for clockevents.
>
> My current version uses arc-timer driver for clockevents.
>
> I noticed that arc-timer driver appears twice in DTS file so first one will
> invoke initialization of clockevent and second the clocksource. Please note that
> both update same global variable arc_timer_freq and you can end up with
> different value from clocksource used by clockevent for secondaries CPUs.
>

Can you please elaborate this a bit more - where/how exactly is timer freq
different for NPS ?

> So my updated driver will like today will use arc-timer clickevent for simulator
> and for real chip it will be used for both clocksource and clockevent.
>

Again I'm not sure if I understand this - why do u need to make this distinctions
for sim vs. real chip !

> How do you suggest to achieve that?
>
> Using arc-timer technique of double nodes at DTS or just single node to init
> both of them
>

the current arc timer driver expects to be called twice - i.e. 2 DT nodes for
"snps,arc-timer" - for first it processes clockevent, for second it does
clocksource. If u instantiate it only once, only clockevent will be called.

I'm sorry but I don't understand the issue here !

-Vineet
