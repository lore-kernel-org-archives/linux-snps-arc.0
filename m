From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 14 Apr 2016 14:56:19 +0530
Subject: [PATCH v4 2/5] ARC: clocksource: DT based probe
In-Reply-To: <570E7263.8070108@arm.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
 <1460547605-26184-3-git-send-email-vgupta@synopsys.com>
 <570E7263.8070108@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570F623B.3000105@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 13 April 2016 09:52 PM, Marc Zyngier wrote:
>> -int arc_counter_setup(void)
>> > +static void __init arc_cs_setup_rtc(struct device_node *node)
>> >  {
>> > -	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMER_MAX);
>> > -	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
>> > -	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
>> > +	int exists = cpuinfo_arc700[smp_processor_id()].extn.rtc;
>> > +
>> > +	if (WARN(!exists, "Local-64-bit-Ctr clocksource not detected"))
>> > +		return;
>> > +
>> > +	/* Local to CPU hence not usable in SMP */
>> > +	if (WARN(IS_ENABLED(CONFIG_SMP), "Local-64-bit-Ctr not usable in SMP"))
>> > +		return;
> Sorry if this outlines my lack of understanding of the ARC architecture,
> but what makes per-cpu timer unsuitable for SMP? I'd have thought that
> it was actually what you wanted...

This is clocksource, not clockevent. cs needs to synchronized across all cores so
that concurrent gtod call from threads on different cores gives you similar
values. This obviously is not true for the local RTC hardware timer.
