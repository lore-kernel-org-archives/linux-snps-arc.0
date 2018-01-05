From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 5 Jan 2018 12:37:47 -0800
Subject: [RFC] ARC: setup cpu possible mask according to status field in
 dts
In-Reply-To: <20171222190828.29162-1-Eugeniy.Paltsev@synopsys.com>
References: <20171222190828.29162-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <331801d2-53ac-e239-75dd-a8f75dec5125@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/22/2017 11:08 AM, Eugeniy Paltsev wrote:
> As we have option in u-boot to set CPU mask for running linux,
> we want to pass information to kernel about CPU cores should
> be brought up.
>
> So we patch kernel dtb in u-boot to set CPUs status.
>
> On linux boot we setup cpu possible mask according to status
> field in each cpu node. It is generic method according to ePAPR:
>    status - a standard property describing the state of a CPU.
>    This property shall be present for nodes representing CPUs in a
>    symmetric multiprocessing (SMP) configuration. For a CPU node
>    the meaning of the "okay" and "disabled" values are as follows:
>    "okay" - The CPU is running; "disabled" - The CPU is in a
>    quiescent state."
>
> Also we setup MCIP debug mask according cpu possible mask.

Idea seems fine to me- and this MCIP things has been pain for Alexey on and off.

> [snip]
>   
> @@ -102,9 +104,13 @@ static void mcip_probe_n_setup(void)
>   
>   	cpuinfo_arc700[0].extn.gfrc = mp.gfrc;
>   
> +	for (i = 0; i < NR_CPUS; i++)
> +		if (cpu_possible(i))
> +			mcip_mask |= BIT(i);
> +

Can you use existing helpers from include/linux/cpumask.h ?
They likely also handle the case of NR_CPUS > 32 which our code doesn't (although 
granted this is unlikely for ARC for now)

> [snip]
>   
> +/* Mark cpu as possible if cpu status is "okay" or status absents */
> +void __init smp_init_cpumask(void)
> +{
> +	const struct fdt_property *prop;
> +	char fdt_cpu_path[25];
> +	unsigned int i, oft;
> +
> +	for (i = 0; i < NR_CPUS; i++) {
> +		sprintf(fdt_cpu_path, "/cpus/cpu@%u", i);
> +		oft = fdt_path_offset(initial_boot_params, fdt_cpu_path);
> +		prop = fdt_get_property(initial_boot_params, oft, "status", NULL);
> +
> +		/* No status property == status OK */
> +		if (!prop) {
> +			set_cpu_possible(i, true);
> +			continue;
> +		}
> +
> +		if (!strcmp("okay", prop->data))
> +			set_cpu_possible(i, true);
> +	}
> +}

So it seems DT / ePar also provides for present-cpus / possible-cpus which is what 
EZChip folks use (see arch/arc/plat-eznps/smp.c)
It seems that is a better mechanism rather than annotating each CPU node's status 
(atleast it seems better for 4K CPUs which is what these guys have)
If you agree we should pull that code out into here and remove their 
init_early_smp hook !

-Vineet
