From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 7 Nov 2015 12:26:10 +0100 (CET)
Subject: [PATCH v2 03/19] clocksource: Add NPS400 timers driver
In-Reply-To: <1446893557-29748-4-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-4-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.11.1511071222340.4032@nanos>
To: linux-snps-arc@lists.infradead.org

On Sat, 7 Nov 2015, Noam Camus wrote:
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
> +	u32 lower, upper, old_upper;
> +	void *lower_p, *upper_p;
> +	int cluster = (smp_processor_id() >> NPS_CLUSTER_OFFSET);
> +
> +	lower_p = nps_msu_reg_low_addr[cluster];
> +	upper_p = lower_p + 4;
> +
> +	upper = ioread32be(upper_p);
> +	do {
> +		old_upper = upper;
> +		lower = ioread32be(lower_p);
> +		upper = ioread32be(upper_p);
> +	} while (upper != old_upper);
> +
> +	counter = (upper << 32) | lower;
> +	return (cycle_t)counter;

So that clocksource goes up to 1GHz. That means u32 fits ~4.29
seconds. Unless you are striving for NOHZ idle sleep times above that
there is no point in doing that 64bit dance.

The timekeeping code is perfectly fine with a 32bit value. You just
have to set the proper mask.

Thanks,

	tglx
