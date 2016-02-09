From: noamc@ezchip.com (Noam Camus)
Date: Tue, 9 Feb 2016 21:47:03 +0000
Subject: [PATCH v3 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <56B9EBC7.4010703@linaro.org>
References: <1454418899-25500-1-git-send-email-noamc@ezchip.com>
 <1454775406-25277-3-git-send-email-noamc@ezchip.com>
 <56B8A482.8040302@linaro.org>
 <HE1PR02MB138769C4BA48A4D8884BC516D6D60@HE1PR02MB1387.eurprd02.prod.outlook.com>,
 <56B9EBC7.4010703@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB1387E31FF8EB39D42CCB2C3BD6D60@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Daniel Lezcano <daniel.lezcano at linaro.org>
>Sent: Tuesday, February 9, 2016 3:38 PM

>Actually I was referring to clk_prepare_enable, clocksource_register_hz.
>Agree clk_get_rate is always valid.
Thanks for making this clear.
Any way as you can see I do call pr_err() in case of error just like most drivers around.
By "hang" do you mean calling panic()?
What if there is another clocksource in DT (even with worse rating)?
I still prefer using it then having non workable machine.

>>
>>> You can simplify the driver even more by using
>>> clocksource_mmio_init.
>> Since my base address depends on cluster number, which CPU is part
>> of,  this interface is not much of a use. On top of that it assumes
>> that I am little endian by using readl family accessories.

>Why can't you use ?

>clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
>nps_timer_rate, 32, nps_clksrc_read);

I believe that the simplification is meant for drivers that can actually use the clocksource_mmio..() accessories. Could you explain what is the advantage here, for my case, to use clocksource_mmio driver?

Thanks for your patience
-Noam
