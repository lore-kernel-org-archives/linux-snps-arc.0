From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 11:47:59 -0700
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <20161103173317.GI1859@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <20161101204257.GG1506@mai>
 <188a2912-3369-19a3-86af-cbb154ff7e44@synopsys.com>
 <20161103173317.GI1859@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a9d49247-014b-c383-da66-a3e59a7db7b0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 10:33 AM, Daniel Lezcano wrote:
> As now the clksrc-probe is correctly handling the errors, if the rtc and the
> gfrc are both defined in the DT, you can fail to init the rtc one with a simple
> test in the init function:
> 
> 	if (IS_DEFINED(CONFIG_SMP))
> 		return -EINVAL;
> 
> So, you can inconditionaly compile in both RTC and GFRC, no ? That would be
> cleaner and prevent a different kernel config.

That's a very good idea. So now I envision
CONFIG_ARC_TIMERS		# legacy TIMER0 / TIMER1
CONFIG_ARC_64BIT_TIMERS		# rtc, gfrc

I need this distinction at the min to be able to select them from ARC Kconfig.

-Vineet
