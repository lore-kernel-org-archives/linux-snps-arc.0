From: noamc@ezchip.com (Noam Camus)
Date: Wed, 10 Feb 2016 08:01:45 +0000
Subject: [PATCH v3 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <56BA6E51.9040507@linaro.org>
References: <1454418899-25500-1-git-send-email-noamc@ezchip.com>
 <1454775406-25277-3-git-send-email-noamc@ezchip.com>
 <56B8A482.8040302@linaro.org>
 <HE1PR02MB138769C4BA48A4D8884BC516D6D60@HE1PR02MB1387.eurprd02.prod.outlook.com>
 <56B9EBC7.4010703@linaro.org>
 <HE1PR02MB1387E31FF8EB39D42CCB2C3BD6D60@HE1PR02MB1387.eurprd02.prod.outlook.com>
 <56BA6E51.9040507@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB138739E2CE482ECF2E53461BD6D70@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Daniel Lezcano [mailto:daniel.lezcano at linaro.org] 
>Sent: Wednesday, February 10, 2016 12:55 AM

>> pr_err() in case of error just like most drivers around. By "hang" do 
>> you mean calling panic()?

>No. I meant the errors are caught but no action is taken, the execution continues normally as nothing wrong happened. This is why I asked if you expect the host to hang at boot time with the last error as a hint.

>I was expecting to see a call to clk_disable_unprepare if clocksource_register_hz fails, and returning 'ret' if clk_prepare_enable fails.
Ok, I will fix that, and handle gracefull return. Thanks


>Using the mmio generic code will save:

>+static struct clocksource nps_counter = {
>+	.name	= "EZnps-tick",
>+	.rating = 301,
>+	.read   = nps_clksrc_read,
>+	.mask   = CLOCKSOURCE_MASK(32),
>+	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
>+};

>Up to you.
I will do that, thanks again

Noam

--
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook | <http://twitter.com/#!/linaroorg> Twitter | <http://www.linaro.org/linaro-blog/> Blog
