From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 1 Nov 2016 18:03:06 -0700
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <20161102001925.GH1506@mai>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <20161101204257.GG1506@mai>
 <188a2912-3369-19a3-86af-cbb154ff7e44@synopsys.com>
 <20161102001925.GH1506@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2dcf87ce-a278-8ef8-3c8e-3cf7124603c9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/01/2016 05:19 PM, Daniel Lezcano wrote:
>>>
>>> One question:
>>>
>>> Why ARC_TIMER_RTC can't be used in a SMP system ? Doesn't have each core its
>>> own clocksource ? It seems you are assuming a clocksource can be used on SMP
>>> only if the clocksource is unique and shared across the cores.
>>
>> Thats what I thought so far. Thing is, the individual core's counters could get
>> out of sync, simply because non masters cores were halted to begin with and came
>> up at different points in real time. so a gtod might return different value
>> depending on what core it landed on. Does clocksource also does ticks broadcasts
>> and such to keep things in sync ?
> 
> Sounds like it is similar than the TSC. Do you agree to have a try by setting
> the CONFIG_HAVE_UNSTABLE_SCHED_CLOCK option ?

I'm not sure why we would want to enable extra stuff - I see work queues and bunch
of per cpu counting / math to adjust for the variance, if this was enabled. Anyhow
see more below.

> If you can use those per cpu clocksource, performances on your system may
> improve with the sched_clock().

Couple of things

1. Currently we don't hookup sched clock to any counter at all (on my todo list
for a while). So we only get jiffies64 based value - I know that sucks - causes
scheduling to be not super accurate etc - potentially affects benchmarks etc - but
that can be fixed easily / independent of this.

2. Say we did have sched_clock() driven by hardware - in SMP system I would still
prefer it to be driven by "common" GFRC and not "per cpu" RTC. The overhead of
HAVE_UNSTABLE_SCHED_CLOCK looks way way more than reading GFRC counter like this.

	local_irq_save(flags);

	__mcip_cmd(CMD_GFRC_READ_LO, 0);
	stamp.l = read_aux_reg(ARC_REG_MCIP_READBACK);

	__mcip_cmd(CMD_GFRC_READ_HI, 0);
	stamp.h = read_aux_reg(ARC_REG_MCIP_READBACK);

	local_irq_restore(flags);

GFRC reading by 2 cores concurrently doesn't require any synchronization at all.
The irq disabling around it is to make sure we didn't get a bogus readout lest an
interrupt came in between the read of 2 words. But if sched_clock can guarantee
that irqs are disable - I can probably even remove it at least for the purpose of
sched clock.

However I think we are digressing here a bit. IMHO, what clock we choose to drive
sched should not really be driven by the driver. It must be for the arch to decide.

We should first focus on how the clockevent/sources are programmed first and then
dive into sched_clock_xx as that doesn't exist at the moment for ARC.

>  
>> Because of the git mv you, diff didn't include bulk of driver code which would
>> make for bulk of review anyways. So perhaps in v2 I don't do the git mv. OK ?
> 
> That means I will review and comment existing code. It is not a problem for me
> if you agree to do the changes.

Sure, the whole point is to make things better as an outcome of review. I have no
issues changing code provided we don't add major performance regressions.

Thx,
-Vineet
