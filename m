From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Mar 2016 18:22:07 +0530
Subject: [PATCH v6 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <1458570272-23037-3-git-send-email-noamca@mellanox.com>
References: <1458570272-23037-1-git-send-email-noamca@mellanox.com>
 <1458570272-23037-3-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56FA7A77.6080901@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 21 March 2016 07:54 PM, Noam Camus wrote:
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

@Noam, AFAIKR, Daniel did ack the prev version - can you please double check and
repost this again.

@Daniel, this patch depends on a include/soc header introduced by patch 1/3 of the
series. For 4.7, how should we merge it - take both via ARC tree !

Thx,
-Vineet

> ---
>  .../bindings/timer/ezchip,nps400-timer.txt         |   15 +++
>  drivers/clocksource/Kconfig                        |   10 ++
>  drivers/clocksource/Makefile                       |    1 +
>  drivers/clocksource/timer-nps.c                    |   98 ++++++++++++++++++++
>  4 files changed, 124 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
>  create mode 100644 drivers/clocksource/timer-nps.c
> 
> diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
> new file mode 100644
> index 0000000..c8c03d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
> @@ -0,0 +1,15 @@
> +NPS Network Processor
> +
> +Required properties:
> +
> +- compatible :	should be "ezchip,nps400-timer"
> +
> +Clocks required for compatible = "ezchip,nps400-timer":
> +- clocks : Must contain a single entry describing the clock input
> +
> +Example:
> +
> +timer {
> +	compatible = "ezchip,nps400-timer";
> +	clocks = <&sysclk>;
> +};
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 2eb5f0e..fa7be50 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -132,6 +132,16 @@ config CLKSRC_TI_32K
>  	  This option enables support for Texas Instruments 32.768 Hz clocksource
>  	  available on many OMAP-like platforms.
>  
> +config CLKSRC_NPS
> +	bool "NPS400 clocksource driver" if COMPILE_TEST
> +	depends on !PHYS_ADDR_T_64BIT
> +	select CLKSRC_MMIO
> +	select CLKSRC_OF if OF
> +	help
> +	  NPS400 clocksource support.
> +	  Got 64 bit counter with update rate up to 1000MHz.
> +	  This counter is accessed via couple of 32 bit memory mapped registers.
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
> index 0000000..d461089
> --- /dev/null
> +++ b/drivers/clocksource/timer-nps.c
> @@ -0,0 +1,98 @@
> +/*
> + * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
> + *
> + * This software is available to you under a choice of one of two
> + * licenses.  You may choose to be licensed under the terms of the GNU
> + * General Public License (GPL) Version 2, available from the file
> + * COPYING in the main directory of this source tree, or the
> + * OpenIB.org BSD license below:
> + *
> + *     Redistribution and use in source and binary forms, with or
> + *     without modification, are permitted provided that the following
> + *     conditions are met:
> + *
> + *      - Redistributions of source code must retain the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer.
> + *
> + *      - Redistributions in binary form must reproduce the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer in the documentation and/or other materials
> + *        provided with the distribution.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + */
> +
> +#include <linux/interrupt.h>
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
> +/* This array is per cluster of CPUs (Each NPS400 cluster got 256 CPUs) */
> +static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
> +
> +static unsigned long nps_timer_rate;
> +
> +static cycle_t nps_clksrc_read(struct clocksource *clksrc)
> +{
> +	int cluster = raw_smp_processor_id() >> NPS_CLUSTER_OFFSET;
> +
> +	return (cycle_t)ioread32be(nps_msu_reg_low_addr[cluster]);
> +}
> +
> +static void __init nps_setup_clocksource(struct device_node *node,
> +					 struct clk *clk)
> +{
> +	int ret, cluster;
> +
> +	for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
> +		nps_msu_reg_low_addr[cluster] =
> +			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
> +				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		pr_err("Couldn't enable parent clock\n");
> +		return;
> +	}
> +
> +	nps_timer_rate = clk_get_rate(clk);
> +
> +	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
> +				    nps_timer_rate, 301, 32, nps_clksrc_read);
> +	if (ret) {
> +		pr_err("Couldn't register clock source.\n");
> +		clk_disable_unprepare(clk);
> +	}
> +}
> +
> +static void __init nps_timer_init(struct device_node *node)
> +{
> +	struct clk *clk;
> +
> +	clk = of_clk_get(node, 0);
> +	if (IS_ERR(clk)) {
> +		pr_err("Can't get timer clock.\n");
> +		return;
> +	}
> +
> +	nps_setup_clocksource(node, clk);
> +}
> +
> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
> +		       nps_timer_init);
> 
