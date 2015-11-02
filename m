From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 16:33:52 +0530
Subject: [PATCH v1 02/20] clocksource: Add NPS400 timers driver
In-Reply-To: <1446297327-16298-3-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-3-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56374318.4030109@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:45 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> Add internal tick generator which is shared by all cores.
> Each cluster of cores view it through dedicated address.
> This is used for SMP system where all CPUs synced by same
> clock source.
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Rob Herring <robh+dt at kernel.org>
> ---

[snip]

> +/*
> + * To get the value from the Global Timer Counter register proceed as follows:
> + * 1. Read the upper 32-bit timer counter register
> + * 2. Read the lower 32-bit timer counter register
> + * 3. Read the upper 32-bit timer counter register again. If the value is
> + *  different to the 32-bit upper value read previously, go back to step 2.
> + *  Otherwise the 64-bit timer counter value is correct.
> + */
> +static cycle_t nps_clksrc_read(struct clocksource *clksrc)
> +{
> +	u64 counter;
> +	u32 lower;
> +	u32 upper, old_upper;
> +	int cpu;
> +	int cluster;
> +	void *lower_p, *upper_p;
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
> +	cpu = smp_processor_id();
> +	cluster = cpu >> NPS_CLUSTER_OFFSET;
> +	lower_p = (void *)nps_msu_reg_low_addr[cluster];
> +	upper_p = lower_p + 4;
> +	local_irq_restore(flags);
> +
> +	upper = ioread32be(upper_p);

Consider using the _relaxed macros even if your platform doesn't have specific IO
barriers.

> +	do {
> +		old_upper = upper;
> +		lower = ioread32be(lower_p);
> +		upper = ioread32be(upper_p);
> +	} while (upper != old_upper);
> +
> +	counter = upper;
> +	counter <<= 32;
> +	counter |= lower;

It is easier to read:

counter = (upper << 32) | lower;

> +	return (cycle_t)counter;
> +}
> +
