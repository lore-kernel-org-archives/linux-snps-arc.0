From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 17 Jan 2017 20:58:47 +0000
Subject: [PATCH 2/4] ARC: smp-boot: run-on-reset: add callback to allow
 non masters to wait
In-Reply-To: <1484600277-32345-3-git-send-email-vgupta@synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
 <1484600277-32345-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646789B03D@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta
> Sent: Monday, January 16, 2017 11:58 PM
> To: linux-snps-arc at lists.infradead.org; Alexey Brodkin
> <abrodkin at synopsys.com>
> Cc: linux-kernel at vger.kernel.org; Vineet Gupta <vgupta at synopsys.com>
> Subject: [PATCH 2/4] ARC: smp-boot: run-on-reset: add callback to allow non
> masters to wait
> 
> Currently for halt-on-reset, non masters spin on a shared memory which is
> wiggled by Master at right time. This is not efficient when hardware support
> exists to stop and resume them from Master (using an external IP block).
> More importantly Master might be setting up SLC or IO-Coherency aperutes
> in early boot duting which other cores need NOT perturb the coherency unit,
> thus need a mechanism that doesn't rely on polling memory.
> 
> This just adds infrastructure for next patch which will add the hardware
> support (MCIP Inter Core Debug Unit).
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/include/asm/smp.h |  3 +++
>  arch/arc/kernel/smp.c      | 17 +++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h index
> 0861007d9ef3..6187b9d14b03 100644
> --- a/arch/arc/include/asm/smp.h
> +++ b/arch/arc/include/asm/smp.h
> @@ -50,6 +50,8 @@ extern int smp_ipi_irq_setup(int cpu,
> irq_hw_number_t hwirq);
>   * 			mach_desc->init_early()
>   * @init_per_cpu:	Called for each core so SMP h/w block driver can do
>   * 			any needed setup per cpu (e.g. IPI request)
> + * @cpu_wait:		Non masters wait to be resumed later by
> master (to avoid
> + * 			perturbing SLC / cache coherency in early boot)
>   * @cpu_kick:		For Master to kickstart a cpu (optionally at a PC)
>   * @ipi_send:		To send IPI to a @cpu
>   * @ips_clear:		To clear IPI received at @irq
> @@ -58,6 +60,7 @@ struct plat_smp_ops {
>  	const char 	*info;
>  	void		(*init_early_smp)(void);
>  	void		(*init_per_cpu)(int cpu);
> +	void		(*cpu_wait)(int cpu);
>  	void		(*cpu_kick)(int cpu, unsigned long pc);
>  	void		(*ipi_send)(int cpu);
>  	void		(*ipi_clear)(int irq);
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c index
> 44a0d21ed342..e60c11b8f4b9 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -96,16 +96,25 @@ static void arc_default_smp_cpu_kick(int cpu,
> unsigned long pc)
>  	wake_flag = cpu;
>  }
> 
> +static void arc_default_smp_wait_to_boot(int cpu) {
> +	while (wake_flag != cpu)
> +		;
> +
> +	wake_flag = 0;

Why don't we convert "wake_flag" into bit-field so each core uses its special bit.
It is IMHO beneficial for 2 reasons:
 1. If we ever decide to have master core with ARCID != 0 implementation of that procedure won't change,
    because "wake_flag" for core with ARCID=0 will be 1 but not 0, see for example http://patchwork.ozlabs.org/patch/703645/

 2. There's no need in resetting "wake_flag" to 0 at all as well because each core has its own bit and they not affect anybody else.
    And in that case ...

> +}
> +
>  void arc_platform_smp_wait_to_boot(int cpu)  {
>  	/* for halt-on-reset, we've waited already */
>  	if (IS_ENABLED(CONFIG_ARC_SMP_HALT_ON_RESET))
>  		return;

...we may just remove above part. Master core by that time has already set our bit in "wake_flag" so we
will effectively fall through the following "while".

> -	while (wake_flag != cpu)
> -		;

-Alexey
