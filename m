From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Fri, 4 Dec 2015 10:13:11 +0100
Subject: [PATCH v3 03/18] clocksource: Add NPS400 timers driver
In-Reply-To: <1448974985-11487-4-git-send-email-noamc@ezchip.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-4-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56615927.30201@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 12/01/2015 02:02 PM, Noam Camus wrote:
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

[ ... ]

> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 56bd16e..20969b0 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_CLKSRC_QCOM)	+= qcom-timer.o
>   obj-$(CONFIG_MTK_TIMER)		+= mtk_timer.o
>   obj-$(CONFIG_CLKSRC_PISTACHIO)	+= time-pistachio.o
>   obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
> +obj-$(CONFIG_ARC_PLAT_EZNPS)	+= timer-nps.o

CONFIG_CLKSRC_NPS

>
>   obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
>   obj-$(CONFIG_ARM_GLOBAL_TIMER)		+= arm_global_timer.o
> diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
> new file mode 100644
> index 0000000..ef8f287
> --- /dev/null
> +++ b/drivers/clocksource/timer-nps.c
> @@ -0,0 +1,63 @@
> +/*
> + * Copyright(c) 2015 EZchip Technologies.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * The full GNU General Public License is included in this distribution in
> + * the file called "COPYING".
> + */
> +
> +#include <linux/clocksource.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <plat/ctop.h>

Why do you need this header ? nps_host_reg ?

We prevent to include headers from <plat> in the drivers directory. You 
should find a way to get rid of it.

> +#define NPS_MSU_TICK_LOW	0xC8
> +#define NPS_CLUSTER_OFFSET	8
> +#define NPS_CLUSTER_NUM		16
> +
> +static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;

Perhaps a small optimization...

static DEFINE_PER_CPU_READ_MOSTLY(void __iomem *, baseaddr);

static cycle_t nps_clksrc_read(struct clocksource *clksrc)
{
	void __iomem *base = per_cpu(baseaddr, raw_smp_processor_id());

	return (cycle_t)ioread32be(base);
}

and in the init function:

for_each_cpu(cpu) {
	per_cpu(baseaddr, cpu) = nps_host_reg(cpu,
					NPS_MSU_BLKID,
					NPS_MSU_TICK_LOW
}

> +static cycle_t nps_clksrc_read(struct clocksource *clksrc)
> +{
> +	int cluster = raw_smp_processor_id() >> NPS_CLUSTER_OFFSET;
> +
> +	return (cycle_t)ioread32be(nps_msu_reg_low_addr[cluster]);

AFAICT, there is a memory barrier with ioread32be, are you really sure 
we have to use it in this code path ?

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
> +static void __init nps_setup_clocksource(struct device_node *node)
> +{
> +	struct clocksource *clksrc = &nps_counter;
> +	unsigned long rate, dt_root;
> +	int ret, cluster;
> +
> +	for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
> +		nps_msu_reg_low_addr[cluster] =
> +			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
> +				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);

> +
> +	dt_root = of_get_flat_dt_root();
> +	rate = (u32)of_get_flat_dt_prop(dt_root, "clock-frequency", NULL);

I don't get why this is done this way. The Kconfig option help says the 
clocksource rate is 1GHz but in the DT the clock is 88MHz.

It would be cleaner to define a fixed clock and then add a phandle in 
the DT.

	timer_clk: timer_clk {
		#clock-cells = <0>;
		compatible = "fixed-clock";
		clock-frequency = <123456789>;
	};

	timer {
		compatible = "ezchip,nps400-timer";
		clocks = <&timer_clk>;
	}

That will result in the same code than the other drivers.

	clk = of_clk_get(np, 0);
	if (IS_ERR(clk)) {
		pr_err("%s: invalid clock\n", np->full_name);
		return;
	}

  	rate = clk_get_rate(clk);


> +	ret = clocksource_register_hz(clksrc, rate);
> +	if (ret)
> +		pr_err("Couldn't register clock source.\n");
> +}
> +
> +CLOCKSOURCE_OF_DECLARE(nps_400, "ezchip,nps400-timer",
> +		       nps_setup_clocksource);
>


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
