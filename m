From: noamca@mellanox.com (Noam Camus)
Date: Tue, 28 Jun 2016 09:30:43 +0000
Subject: Click source driver
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750106948283@us01wembx1.internal.synopsys.com>
References: <44r6tdw0jo5mq07ioknlqbb8.1465583927061@email.android.com>
 <C2D7FE5348E1B147BCA15975FBA230750106948283@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR05MB1625C1169916B20488591350AA220@HE1PR05MB1625.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>Sent: Tuesday, June 28, 2016 11:32 AM

>> I noticed that arc-timer driver appears twice in DTS file so first one 
>> will invoke initialization of clockevent and second the clocksource. 
>> Please note that both update same global variable arc_timer_freq and 
>> you can end up with different value from clocksource used by clockevent for secondaries CPUs.
>>

>Can you please elaborate this a bit more - where/how exactly is timer freq different for NPS ?
In NPS chip the timer0 is shared among all HW threads from the same core.
There is also dedicated design for choosing which threads will get the timer interrupt when it arrives.
This is different from ARC700.
In simulator we use regular ARC700 cores without simulating this HW behavior so generic ARC driver is good for us when working with simulator.
See below link for patch I use and going to upstream:
https://github.com/Mellanox/linux/commit/94f1b4d7b28634ce579101aa79e9853566883536


>> So my updated driver will like today will use arc-timer clickevent for 
>> simulator and for real chip it will be used for both clocksource and clockevent.
>>

>Again I'm not sure if I understand this - why do u need to make this distinctions for sim vs. real chip !
I hope above clarifying things

>> How do you suggest to achieve that?
>>
>> Using arc-timer technique of double nodes at DTS or just single node 
>> to init both of them
>>

>the current arc timer driver expects to be called twice - i.e. 2 DT nodes for "snps,arc-timer" - for first it processes clockevent, for second it does clocksource. If u instantiate it only once, only clockevent will be called.

>I'm sorry but I don't understand the issue here !

>From above link to my patch you can see that I choose to have 2 separate "compatiable" implementations one for timer0 and another for timer1. This way I can separate the origin clock each one uses.
In your case (I believe so) the order of " snps,arc-timer" at DTS files is important and since for both you call arc_get_timer_clk() which in turn update same global variable called arc_timer_freq.
So if in your DTS file each node got different clocks=<some clk>, then second node will override this value set by first node.

-Noam
