From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Oct 2016 13:04:11 -0700
Subject: [PATCH] ARC: [SMP] get CPUs mask from DT
In-Reply-To: <1477469071-2282-1-git-send-email-noamca@mellanox.com>
References: <1477469071-2282-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ee0054ec-a8cb-052e-3cab-02da18f75ee5@synopsys.com>
To: linux-snps-arc@lists.infradead.org


On 10/26/2016 01:04 AM, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> Today we use smp_init_cpus() to set cpu possible mask
> and we use smp_prepare_cpus() to set cpu present mask.
> For possible mask we use all CPUs at range [0-NR_CPUS] and
> for present mask we use all CPUs at range [0-max_cpus]
> which is actually the same as possible mask (no hutplug).
> 
> For platform like eznps we wish to have more configurable range then
> being statically defined by NR_CPUS (actuall derived from CONFIG_NR_CPUS).
> For this purpose we added two new entries at our device tree root level:
> possible-cpus
> present-cpus
> 
> The format of this new entries is same like for all similar kernel
> parameters which provide cpu list (see Documentation/kernel-parameters.txt)
> example of use would be (assume CONFIG_NR_CPUS=8):
> present-cpus = "0-1,6-7";
> possible-cpus = "0-7";
> 
> Now if we provide such list in our DT then we won't use the statically range.
> In our example above only CPUs 0,1,6,7 will be up after boot.
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
>  arch/arc/kernel/smp.c |   32 ++++++++++++++++++++++++++++----
>  1 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index 03d5151..5855403 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -16,6 +16,7 @@
>  #include <linux/sched.h>
>  #include <linux/interrupt.h>
>  #include <linux/profile.h>
> +#include <linux/of_fdt.h>
>  #include <linux/mm.h>
>  #include <linux/cpu.h>
>  #include <linux/irq.h>
> @@ -34,6 +35,21 @@ arch_spinlock_t smp_bitops_lock = __ARCH_SPIN_LOCK_UNLOCKED;
>  
>  struct plat_smp_ops  __weak plat_smp_ops;
>  
> +/* Get CPUs mask from device tree */
> +static int __init smp_get_cpumask(const char *name, struct cpumask *cpumask)
> +{
> +	unsigned long dt_root = of_get_flat_dt_root();
> +	const char *buf;
> +
> +	buf = of_get_flat_dt_prop(dt_root, name, NULL);
> +	if (!buf)
> +		return 0;
> +
> +	cpulist_parse(buf, cpumask);
> +
> +	return 1;
> +}
> +
>  /* XXX: per cpu ? Only needed once in early seconday boot */
>  struct task_struct *secondary_idle_tsk;
>  
> @@ -54,9 +70,13 @@ void __init smp_prepare_boot_cpu(void)
>  void __init smp_init_cpus(void)
>  {
>  	unsigned int i;
> +	struct cpumask cpumask;
>  
> -	for (i = 0; i < NR_CPUS; i++)
> -		set_cpu_possible(i, true);
> +	if (smp_get_cpumask("possible-cpus", &cpumask))
> +		init_cpu_possible(&cpumask);
> +	else
> +		for (i = 0; i < NR_CPUS; i++)
> +			set_cpu_possible(i, true);

This is not checkpatch clean, need to enclose the if / else in { }

Anyhow, it seems we don't need this as ARC set_cpu_possible() will be overridden
by your init_early_smp() hook anyways ? We don't need to generalize it as I don't
foresee other platforms needing it.

>  
>  	if (plat_smp_ops.init_early_smp)
>  		plat_smp_ops.init_early_smp();
> @@ -66,13 +86,17 @@ void __init smp_init_cpus(void)
>  void __init smp_prepare_cpus(unsigned int max_cpus)
>  {
>  	int i;
> +	struct cpumask cpumask;
>  
>  	/*
>  	 * Initialise the present map, which describes the set of CPUs
>  	 * actually populated at the present time.
>  	 */
> -	for (i = 0; i < max_cpus; i++)
> -		set_cpu_present(i, true);
> +	if (smp_get_cpumask("present-cpus", &cpumask))
> +		init_cpu_present(&cpumask);
> +	else
> +		for (i = 0; i < max_cpus; i++)
> +			set_cpu_present(i, true);
>  }

With the existing DT based cpu bitmap setting in your platform code, can we
instead do something like below in smp_prepare_cpus():

   if (num_present_cpus() <= 1) { /* boot already marked present in init/main.c */
	for (i = 0; i < max_cpus; i++)
		set_cpu_present(i, true);
   }

So to summarize you keep the existing DT based cpu bitmap settings in your
platform code and just add one workaround to not over-ride present map in ARC
common code.

-Vineet
