From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 19:14:52 +0100
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <20161103173317.GI1859@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <20161101204257.GG1506@mai>
 <188a2912-3369-19a3-86af-cbb154ff7e44@synopsys.com>
 <20161103173317.GI1859@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103181452.GL1859@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@06:33:17PM +0100, Daniel Lezcano wrote:

[ ... ]

> As now the clksrc-probe is correctly handling the errors, if the rtc and the
> gfrc are both defined in the DT, you can fail to init the rtc one with a simple
> test in the init function:
> 
> 	if (IS_DEFINED(CONFIG_SMP))
> 		return -EINVAL;
> 
> So, you can inconditionaly compile in both RTC and GFRC, no ? That would be
> cleaner and prevent a different kernel config.

Ah, actually I suggested something which is already there :)

Perhaps, the if SMP does not make sense in the Kconfig, no ?
