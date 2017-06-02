From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 2 Jun 2017 10:51:19 -0700
Subject: [PATCH v3] hsdk: initial port for HSDK board
In-Reply-To: <1496313672-13350-1-git-send-email-abrodkin@synopsys.com>
References: <1496313672-13350-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0a0e269a-a04f-afee-971b-0e7daad5f68a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/01/2017 03:41 AM, Alexey Brodkin wrote:
> This initial port adds support of ARC HS Development Kit board with some
> basic features such serial port, USB, SD/MMC and Ethernet.
> 
> Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
> heavily use IO Coherency for speeding-up DMA-aware peripherals.
> 
> Note as opposed to other ARC boards we link Linux kernel to
> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
> situated at our more usual link base 0x8000_0000.
> 
> Signed-off-by: Eugeniy Paltsev <paltsev at synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Rob Herring <robh+dt at kernel.org>
> ---
> 
> Changes v2 -> v3:
>   * Added Rob to Cc-list for DT binding approval
>   * Removed mention of prerequsite patch from commit message
>   * Removed hsdk_early_init() as hsdk_init_per_cpu() is executed on
>     all cores anyways including master
>   * Cleaned-up board's .dts a little bit
>   * Removed CONFIG_DP83867_PHY from defconfig as it was only used on
>     FPGA prototype, on real board we use MICREL PHY which is still selected
> 
> Changes v1 -> v2:
>   * Update copyright year from 2016 to more up to date 2017
>   * Merge early UART clock with AXS10x as in both cases that's 33.3 MHz
>   * Bump memory to 1Gb, we don't use more for now because it requires
>     trickier IOC setup and usage
>   * Update early platform init code:
>      - Added missing fixup_pae_regs() to per-cpu init
>      - Mark most of functions as "static __init"
>      - Use writel_relaxed() for setting CREG_PAE, CREG_PAE_UPDATE is still
>        written with stronger writel() since we don't want reordering to happen,
>        otherwise value written to CREG_PAE won't be applied
> 

> +/*
> + * By default ICCM is mapped to 0x7z while this area is used for
> + * Virtual kernel mappings, so move it to currently unused area.
> + */
> +static void __init relocate_iccm(void)
> +{
> +	if (cpuinfo_arc700[smp_processor_id()].iccm.sz)
> +		write_aux_reg(ARC_REG_AUX_ICCM, 0x60000000);
> +}
> +
> +/*
> + * Default configuration of PAE regs doesn't work for us causing
> + * problems with DMA to/from peripherals even if PAE40 is not used.
> + */
> +static void __init fixup_pae_regs(void)
> +{
> +#define ARC_PERIPHERAL_BASE	0xf0000000
> +#define	CREG_BASE		(ARC_PERIPHERAL_BASE + 0x1000)
> +#define	CREG_PAE		(CREG_BASE + 0x180)
> +#define	CREG_PAE_UPDATE		(CREG_BASE + 0x194)
> +
> +	/* Default is 1, which means "PAE offset = 4GByte" */
> +	writel_relaxed(0, (void __iomem *) CREG_PAE);
> +
> +	/* Really apply settings made above */
> +	writel(1, (void __iomem *) CREG_PAE_UPDATE);
> +}
> +
> +static void __init hsdk_init_per_cpu(unsigned int cpu)
> +{
> +	relocate_iccm();
> +	fixup_pae_regs();
> +}
> +

A couple of things.

Is the PAE register banked/replicated for each CPU. If not it only needs to be 
done once by the master.

Now anything master does (iccm relocation specially) preferably needs to be done 
really early. For master, machine_desc->init_per_cpu is called pretty late in the 
game so better do it in init_eary.

P.S. You don't need to respin, I can fix up the patch here if you agree !


> +MACHINE_START(SIMULATION, "hsdk")
> +	.dt_compat	= hsdk_compat,
> +	.init_per_cpu	= hsdk_init_per_cpu,
> +MACHINE_END
> 
