From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 06:38:27 +0000
Subject: [PATCH v1 08/20] ARC: Use res_service as entry point for
 secondaries
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-9-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFC9F@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:50 PM, Noam Camus wrote:
> From: Tal Zilcer <talz at ezchip.com>
>
> At cpu_kick() we call res_service which can be implement by each
> platform and override gerneric weak definition.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> ---
>  arch/arc/include/asm/smp.h |    2 +-
>  arch/arc/kernel/smp.c      |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
> index 133c867..db05793 100644
> --- a/arch/arc/include/asm/smp.h
> +++ b/arch/arc/include/asm/smp.h
> @@ -30,7 +30,7 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>   * APIs provided by arch SMP code to rest of arch code
>   */
>  extern void __init smp_init_cpus(void);
> -extern void first_lines_of_secondary(void);
> +extern void res_service(void);
>  extern const char *arc_platform_smp_cpuinfo(void);
>  
>  /*
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index 946109f..546079f 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -167,7 +167,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  
>  	if (plat_smp_ops.cpu_kick)
>  		plat_smp_ops.cpu_kick(cpu,
> -				(unsigned long)first_lines_of_secondary);
> +				(unsigned long)res_service);

So I recently added the explicit handling of halt-on-reset vs. run-on-reset (for
non master cores)
This will cause infinite loop for non masters for run-on-reset ?

I'd suggest leave this arg alone and use whatever PC is needed inside your kick
routine

>  	else
>  		arc_default_smp_cpu_kick(cpu, (unsigned long)NULL);
>  
