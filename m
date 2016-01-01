From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Jan 2016 16:01:47 +0530
Subject: [PATCH v5 04/20] clocksource: Add NPS400 timers driver
In-Reply-To: <1451222619-3610-5-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-5-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56865593.2010404@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
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

Not quite.

Also it would help if your individual patches record which changed vs. prev
version (vs. doing that just in cover letter).

So this patch is no longer clocksource as you introduce clockevent as well.
And that is a verbose copy/paste of clockevent in arch/arc/kerne/time.c
I do understand why you did this - since ARC timers have not been DT enabled so
far. But the copy/paste is simply *wrong*.

I'm doing a mini-series which fixes the issue at heart.

It will be a series with incremental changes so we clearly see what is being done.

> ---
>  .../bindings/timer/ezchip,nps400-timer.txt         |   17 ++
>  drivers/clocksource/Kconfig                        |    7 +
>  drivers/clocksource/Makefile                       |    1 +
>  drivers/clocksource/timer-nps.c                    |  199 ++++++++++++++++++++
>  4 files changed, 224 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
>  create mode 100644 drivers/clocksource/timer-nps.c
> 
> diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
> new file mode 100644
> index 0000000..eeb26d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
> @@ -0,0 +1,17 @@
> +NPS Network Processor
> +
> +Required properties:
> +
> +- compatible :	should be "ezchip,nps400-timer"
> +
> +Clocks required for compatible = "ezchip,nps400-timer":
> +- clocks : Must contain a single entry describing the clock input
> +- interrupts : The interrupt of the first timer
> +
> +Example:
> +
> +timer {
> +	compatible = "ezchip,nps400-timer";
> +	clocks = <&sysclk>;
> +	interrupts = <3>;
> +};
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 2eb5f0e..859e83d 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -132,6 +132,13 @@ config CLKSRC_TI_32K
>  	  This option enables support for Texas Instruments 32.768 Hz clocksource
>  	  available on many OMAP-like platforms.
>  
> +config CLKSRC_NPS
> +	bool "NPS400 clocksource driver" if COMPILE_TEST
> +	select CLKSRC_OF if OF
> +	help
> +	  NPS400 clocksource support.
> +	  Got 64 bit counter with update rate up to 1000MHz.
> +
>  config CLKSRC_STM32
>  	bool "Clocksource for STM32 SoCs" if !ARCH_STM32
>  	depends on OF && ARM && (ARCH_STM32 || COMPILE_TEST)
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 56bd16e..056cffd 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_CLKSRC_QCOM)	+= qcom-timer.o
>  obj-$(CONFIG_MTK_TIMER)		+= mtk_timer.o
>  obj-$(CONFIG_CLKSRC_PISTACHIO)	+= time-pistachio.o
>  obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
> +obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
>  
>  obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
>  obj-$(CONFIG_ARM_GLOBAL_TIMER)		+= arm_global_timer.o
> diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
> new file mode 100644
> index 0000000..b3fc9ba
> --- /dev/null
> +++ b/drivers/clocksource/timer-nps.c
> @@ -0,0 +1,199 @@
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
> +#include <linux/clockchips.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/cpu.h>
> +#include <soc/nps/common.h>
> +
> +#define NPS_MSU_TICK_LOW	0xC8
> +#define NPS_CLUSTER_OFFSET	8
> +#define NPS_CLUSTER_NUM		16
> +
> +/* Timer related Aux registers */
> +#define ARC_REG_TIMER0_LIMIT    0x23    /* timer 0 limit */
> +#define ARC_REG_TIMER0_CTRL     0x22    /* timer 0 control */
> +#define ARC_REG_TIMER0_CNT      0x21    /* timer 0 count */
> +
> +#define TIMER_CTRL_IE           (1 << 0) /* Interupt when Count reachs limit */
> +#define TIMER_CTRL_NH           (1 << 1) /* Count only when CPU NOT halted */
> +
> +/* This array is per cluster of CPUs (Each NPS400 cluster got 256 CPUs) */
> +static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
> +
> +static unsigned long nps_timer_rate;
> +static int nps_timer_irq;
> +
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
> +static void nps_timer_event_setup(unsigned int cycles)
> +{
> +	write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
> +	write_aux_reg(ARC_REG_TIMER0_CNT, 0);   /* start from 0 */
> +
> +	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
> +}
> +
> +static int nps_clkevent_set_next_event(unsigned long delta,
> +				       struct clock_event_device *dev)
> +{
> +	nps_timer_event_setup(delta);
> +	return 0;
> +}
> +
> +static int nps_clkevent_set_periodic(struct clock_event_device *dev)
> +{
> +	/*
> +	 * At X Hz, 1 sec = 1000ms -> X cycles;
> +	 *                    10ms -> X / 100 cycles
> +	 */
> +	nps_timer_event_setup(nps_timer_rate / HZ);
> +	return 0;
> +}
> +
> +static DEFINE_PER_CPU(struct clock_event_device, nps_clockevent_device) = {
> +	.name			= "nps_sys_timer",
> +	.features               = CLOCK_EVT_FEAT_ONESHOT |
> +				  CLOCK_EVT_FEAT_PERIODIC,
> +	.rating                 = 300,
> +	.set_next_event         = nps_clkevent_set_next_event,
> +	.set_state_periodic     = nps_clkevent_set_periodic,
> +};
> +
> +static int nps_timer_cpu_notify(struct notifier_block *self,
> +				unsigned long action, void *hcpu)
> +{
> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> +
> +	evt->irq = nps_timer_irq;
> +	evt->cpumask = cpumask_of(smp_processor_id());
> +
> +	/*
> +	 * Grab cpu pointer in each case to avoid spurious
> +	 * preemptible warnings
> +	 */
> +	switch (action & ~CPU_TASKS_FROZEN) {
> +	case CPU_STARTING:
> +		enable_percpu_irq(nps_timer_irq, 0);
> +		clockevents_config_and_register(evt, nps_timer_rate,
> +						0, ULONG_MAX);
> +		break;
> +	case CPU_DYING:
> +		disable_percpu_irq(nps_timer_irq);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block nps_timer_cpu_nb = {
> +	.notifier_call = nps_timer_cpu_notify,
> +};
> +
> +static irqreturn_t nps_timer_irq_handler(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> +	int irq_reenable = clockevent_state_periodic(evt);
> +
> +	/*
> +	 * Any write to CTRL reg ACks the interrupt, we rewrite the
> +	 * Count when [N]ot [H]alted bit.
> +	 * And re-arm it if perioid by [I]nterrupt [E]nable bit
> +	 */
> +	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | TIMER_CTRL_NH);
> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void __init nps_setup_clocksource(struct device_node *node,
> +					 struct clk *clk, int irq)
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
> +
> +	ret = clocksource_register_hz(clksrc, nps_timer_rate);
> +	if (ret)
> +		pr_err("Couldn't register clock source.\n");
> +}
> +
> +static void __init nps_setup_clockevents(struct device_node *node,
> +					 struct clk *clk, int irq)
> +{
> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> +	int ret;
> +
> +	register_cpu_notifier(&nps_timer_cpu_nb);
> +
> +	evt->irq = irq;
> +	evt->cpumask = cpumask_of(smp_processor_id());
> +
> +	clockevents_config_and_register(evt, nps_timer_rate, 0, ULONG_MAX);
> +
> +	enable_percpu_irq(irq, 0);
> +
> +	ret = request_percpu_irq(irq, nps_timer_irq_handler,
> +				 "timer", evt);
> +	if (ret)
> +		pr_err("Unable to register interrupt\n");
> +}
> +
> +static void __init nps_timer_init(struct device_node *node)
> +{
> +	struct clk *clk;
> +
> +	nps_timer_irq = irq_of_parse_and_map(node, 0);
> +	if (nps_timer_irq <= 0)
> +		panic("Can't parse IRQ");
> +
> +	clk = of_clk_get(node, 0);
> +	if (IS_ERR(clk))
> +		panic("Can't get timer clock");
> +
> +	nps_setup_clocksource(node, clk, nps_timer_irq);
> +	nps_setup_clockevents(node, clk, nps_timer_irq);
> +}
> +
> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> +		       nps_timer_init);
> 
