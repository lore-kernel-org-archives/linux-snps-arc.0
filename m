From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 1 Nov 2016 13:57:05 -0700
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <20161101204257.GG1506@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <20161101204257.GG1506@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <188a2912-3369-19a3-86af-cbb154ff7e44@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On 11/01/2016 01:42 PM, Daniel Lezcano wrote:
> Please stay consistent with the rest of the Kconfig.
> 
> config ARC_TIMER_RTC
> 	bool "64-bit cycle counter in HS38 cores" if COMPILE_TEST
> 	select CLKSRC_OF
> 	help
> 	  This counter provides 64-bit resolution vs. the 32-bit TIMER1.
> 	  It is implemented inside the core thus can't be used in SMP systems.
> 
> config ARC_TIMER_GFRC
> 	bool "64-bit cycle counter in ARConnect block in HS38x cores" if COMPILE_TEST
> 	select CLKSRC_OF
> 	help
> 	  This counter can be used as clocksource in SMP HS38 SoCs.
> 	  It sits outside the core thus can be used in SMP systems
> 

Yes I did so already :-) Although I also added a default y if ARC to both, but as
you say that is better done in ARC Kconfig.

> Then in the ARC's Kconfig you select ARC_TIMER_RTC or ARC_TIMER_GFRC depending
> it is SMP or not.
> 
> One question:
> 
> Why ARC_TIMER_RTC can't be used in a SMP system ? Doesn't have each core its
> own clocksource ? It seems you are assuming a clocksource can be used on SMP
> only if the clocksource is unique and shared across the cores.

Thats what I thought so far. Thing is, the individual core's counters could get
out of sync, simply because non masters cores were halted to begin with and came
up at different points in real time. so a gtod might return different value
depending on what core it landed on. Does clocksource also does ticks broadcasts
and such to keep things in sync ?

Because of the git mv you, diff didn't include bulk of driver code which would
make for bulk of review anyways. So perhaps in v2 I don't do the git mv. OK ?

Thx,
-Vineet
