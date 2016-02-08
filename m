From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Mon, 8 Feb 2016 15:21:54 +0100
Subject: [PATCH v3 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <1454775406-25277-3-git-send-email-noamc@ezchip.com>
References: <1454418899-25500-1-git-send-email-noamc@ezchip.com>
 <1454775406-25277-3-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56B8A482.8040302@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 02/06/2016 05:16 PM, Noam Camus wrote:
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
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: John Stultz <john.stultz at linaro.org>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> ---

[ ... ]

> +static cycle_t nps_clksrc_read(struct clocksource *clksrc)
> +{
> +	int cluster = raw_smp_processor_id() >> NPS_CLUSTER_OFFSET;
> +
> +	return (cycle_t)ioread32be(nps_msu_reg_low_addr[cluster]);
> +}
> +
> +static struct clocksource nps_counter = {
> +	.name	= "EZnps-tick",
> +	.rating = 301,
> +	.read   = nps_clksrc_read,
> +	.mask   = CLOCKSOURCE_MASK(32),
> +	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
> +};
> +
> +static void __init nps_setup_clocksource(struct device_node *node,
> +					 struct clk *clk)
> +{
> +	struct clocksource *clksrc = &nps_counter;
> +	int ret, cluster;
> +
> +	for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
> +		nps_msu_reg_low_addr[cluster] =
> +			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
> +				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		pr_err("Couldn't enable parent clock\n");
> +
> +	nps_timer_rate = clk_get_rate(clk);

If there is an error, you continue the execution of the code. I guess 
you expect the system to hang in any case with the error in the console, 
right ?

> +	ret = clocksource_register_hz(clksrc, nps_timer_rate);

You can simplify the driver even more by using clocksource_mmio_init.

-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
