From: marc.zyngier@arm.com (Marc Zyngier)
Date: Wed, 13 Apr 2016 17:22:59 +0100
Subject: [PATCH v4 2/5] ARC: clocksource: DT based probe
In-Reply-To: <1460547605-26184-3-git-send-email-vgupta@synopsys.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
 <1460547605-26184-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570E7263.8070108@arm.com>
To: linux-snps-arc@lists.infradead.org

On 13/04/16 12:40, Vineet Gupta wrote:
> - Remove explicit clocksource setup and let it be done by OF framework
>   by defining CLOCKSOURCE_OF_DECLARE() for various timers
> 
> - This allows multiple clocksources to be potentially registered
>   simultaneouly: previously we could only do one - as all of them had
>   same arc_counter_setup() routine for registration
> 
> - Setup routines also ensure that the underlying timer actually exists.
> 
> - Remove some of the panic() calls if underlying timer is NOT detected as
>   fallback clocksource might still be available
>   1. If GRFC doesn't exist, jiffies clocksource gets registered anyways
>   2. if RTC doesn't exist, TIMER1 can take over (as it is always
>      present)
> 
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/mcip.c  |   4 +-
>  arch/arc/kernel/setup.c |   3 --
>  arch/arc/kernel/time.c  | 124 +++++++++++++++++++++++++++---------------------
>  3 files changed, 72 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
> index c41c364b926c..262d9c3771e6 100644
> --- a/arch/arc/kernel/mcip.c
> +++ b/arch/arc/kernel/mcip.c
> @@ -116,15 +116,13 @@ static void mcip_probe_n_setup(void)
>  		IS_AVAIL1(mp.dbg, "DEBUG "),
>  		IS_AVAIL1(mp.gfrc, "GFRC"));
>  
> +	cpuinfo_arc700[0].extn.gfrc = mp.gfrc;
>  	idu_detected = mp.idu;
>  
>  	if (mp.dbg) {
>  		__mcip_cmd_data(CMD_DEBUG_SET_SELECT, 0, 0xf);
>  		__mcip_cmd_data(CMD_DEBUG_SET_MASK, 0xf, 0xf);
>  	}
> -
> -	if (IS_ENABLED(CONFIG_ARC_HAS_GFRC) && !mp.gfrc)
> -		panic("kernel trying to use non-existent GFRC\n");
>  }
>  
>  struct plat_smp_ops plat_smp_ops = {
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index 507ec523112a..91f79fa447bc 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -313,9 +313,6 @@ static void arc_chk_core_config(void)
>  	if (!cpu->extn.timer1)
>  		panic("Timer1 is not present!\n");
>  
> -	if (IS_ENABLED(CONFIG_ARC_HAS_RTC) && !cpu->extn.rtc)
> -		panic("RTC is not present\n");
> -
>  #ifdef CONFIG_ARC_HAS_DCCM
>  	/*
>  	 * DCCM can be arbit placed in hardware.
> diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
> index 693545df9827..72f023440739 100644
> --- a/arch/arc/kernel/time.c
> +++ b/arch/arc/kernel/time.c
> @@ -77,12 +77,7 @@ static void noinline arc_get_timer_clk(struct device_node *node)
>  
>  #ifdef CONFIG_ARC_HAS_GFRC
>  
> -static int arc_counter_setup(void)
> -{
> -	return 1;
> -}
> -
> -static cycle_t arc_counter_read(struct clocksource *cs)
> +static cycle_t arc_read_gfrc(struct clocksource *cs)
>  {
>  	unsigned long flags;
>  	union {
> @@ -107,15 +102,28 @@ static cycle_t arc_counter_read(struct clocksource *cs)
>  	return stamp.full;
>  }
>  
> -static struct clocksource arc_counter = {
> +static struct clocksource arc_counter_gfrc = {
>  	.name   = "ARConnect GFRC",
>  	.rating = 400,
> -	.read   = arc_counter_read,
> +	.read   = arc_read_gfrc,
>  	.mask   = CLOCKSOURCE_MASK(64),
>  	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
>  };
>  
> -#else
> +static void __init arc_cs_setup_gfrc(struct device_node *node)
> +{
> +	int exists = cpuinfo_arc700[0].extn.gfrc;
> +
> +	if (WARN(!exists, "Global-64-bit-Ctr clocksource not detected"))
> +		return;
> +
> +	arc_get_timer_clk(node);
> +
> +	clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
> +}
> +CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
> +
> +#endif
>  
>  #ifdef CONFIG_ARC_HAS_RTC
>  
> @@ -123,15 +131,7 @@ static struct clocksource arc_counter = {
>  #define AUX_RTC_LOW	0x104
>  #define AUX_RTC_HIGH	0x105
>  
> -int arc_counter_setup(void)
> -{
> -	write_aux_reg(AUX_RTC_CTRL, 1);
> -
> -	/* Not usable in SMP */
> -	return !IS_ENABLED(CONFIG_SMP);
> -}
> -
> -static cycle_t arc_counter_read(struct clocksource *cs)
> +static cycle_t arc_read_rtc(struct clocksource *cs)
>  {
>  	unsigned long status;
>  	union {
> @@ -155,44 +155,66 @@ static cycle_t arc_counter_read(struct clocksource *cs)
>  	return stamp.full;
>  }
>  
> -static struct clocksource arc_counter = {
> +static struct clocksource arc_counter_rtc = {
>  	.name   = "ARCv2 RTC",
>  	.rating = 350,
> -	.read   = arc_counter_read,
> +	.read   = arc_read_rtc,
>  	.mask   = CLOCKSOURCE_MASK(64),
>  	.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
>  };
>  
> -#else /* !CONFIG_ARC_HAS_RTC */
> -
> -/*
> - * set 32bit TIMER1 to keep counting monotonically and wraparound
> - */
> -int arc_counter_setup(void)
> +static void __init arc_cs_setup_rtc(struct device_node *node)
>  {
> -	write_aux_reg(ARC_REG_TIMER1_LIMIT, ARC_TIMER_MAX);
> -	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
> -	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
> +	int exists = cpuinfo_arc700[smp_processor_id()].extn.rtc;
> +
> +	if (WARN(!exists, "Local-64-bit-Ctr clocksource not detected"))
> +		return;
> +
> +	/* Local to CPU hence not usable in SMP */
> +	if (WARN(IS_ENABLED(CONFIG_SMP), "Local-64-bit-Ctr not usable in SMP"))
> +		return;

Sorry if this outlines my lack of understanding of the ARC architecture,
but what makes per-cpu timer unsuitable for SMP? I'd have thought that
it was actually what you wanted...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
