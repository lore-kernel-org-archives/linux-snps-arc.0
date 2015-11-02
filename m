From: noamc@ezchip.com (Noam Camus)
Date: Mon, 2 Nov 2015 07:57:43 +0000
Subject: [PATCH v1 02/20] clocksource: Add NPS400 timers driver
In-Reply-To: <5636799B.50307@linaro.org>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-3-git-send-email-noamc@ezchip.com>
 <5636799B.50307@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141FD51E1411651A7316D74D62C0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Daniel Lezcano [mailto:daniel.lezcano at linaro.org] 
> Sent: Sunday, November 01, 2015 10:44 PM

> Please add an entry in the clocksource's Kconfig.

> eg:
OK

> Are you sure all the headers are needed ?
Thanks, will revise this part.

> Why do you need to disable the interrupt here ?
Thanks, seem like left over from past issue, I will remove.


> May be you can consider using only the 32bits. Sometimes it is faster than using 64bits arithmetic and reading the register three times.

> https://lkml.org/lkml/2014/6/20/431
Our device can reach 1000MHz.
That means that the 32-bit half of the counter rolls over every ~4 seconds.
I am not sure optimization is justified.

-Noam
