From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 31 May 2017 12:47:36 -0700
Subject: [PATCH v2] hsdk: initial port for HSDK board
In-Reply-To: <1496252987-19252-1-git-send-email-abrodkin@synopsys.com>
References: <1496252987-19252-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b36a5a93-3fa5-9e1f-c8aa-6b6f90f46d93@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/31/2017 10:49 AM, Alexey Brodkin wrote:
> This initial port add support of ARC HS Development Kit board with some
> basic features such as SMP and serial port, USB, SD/MMC and Ethernet.
> 
> Note as opposed to other ARC boards we link Linux kernel to
> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
> situated at our more usual link base 0x8000_0000.
> 
> Also there's a prerequisite for this change required to get
> .dts compiled, see
> http://lists.infradead.org/pipermail/linux-snps-arc/2017-May/002462.html

Per Rob's comment yesterday - this is not needed ?


> Signed-off-by: Eugeniy Paltsev <paltsev at synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
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
>   Documentation/devicetree/bindings/arc/hsdk.txt |   7 ++
>   arch/arc/Kconfig                               |   1 +
>   arch/arc/Makefile                              |   1 +
>   arch/arc/boot/dts/hsdk.dts                     | 151 +++++++++++++++++++++++++
>   arch/arc/configs/hsdk_defconfig                |  72 ++++++++++++
>   arch/arc/kernel/devtree.c                      |   5 +-
>   arch/arc/plat-hsdk/Kconfig                     |  12 ++
>   arch/arc/plat-hsdk/Makefile                    |   9 ++
>   arch/arc/plat-hsdk/platform.c                  |  74 ++++++++++++
>   9 files changed, 330 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
>   create mode 100644 arch/arc/boot/dts/hsdk.dts
>   create mode 100644 arch/arc/configs/hsdk_defconfig
>   create mode 100644 arch/arc/plat-hsdk/Kconfig
>   create mode 100644 arch/arc/plat-hsdk/Makefile
>   create mode 100644 arch/arc/plat-hsdk/platform.c
> 
> diff --git a/Documentation/devicetree/bindings/arc/hsdk.txt b/Documentation/devicetree/bindings/arc/hsdk.txt
> new file mode 100644
> index 000000000000..be50654bbf61
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arc/hsdk.txt
> @@ -0,0 +1,7 @@
> +Synopsys DesignWare ARC HS Development Kit Device Tree Bindings
> +---------------------------------------------------------------------------
> +
> +ARC HSDK Board with quad-core ARC HS38x4 in silicon.
> +
> +Required root node properties:
> +    - compatible = "snps,hsdk";

Does this require an approval from RobH or DT folks - care to CC them in next 
version ?

> + * Default configuration of PAE regs doesn't work for us causeing

spello !

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
> +static void __init hsdk_early_init(void)
> +{
> +	relocate_iccm();
> +	fixup_pae_regs();
> +}
> +
> +static void __init hsdk_init_per_cpu(unsigned int cpu)
> +{
> +	relocate_iccm();
> +	fixup_pae_regs();
> +}

Instead of duplicating can u just call hsdk_early_init() here.
oh wait, init_per_cpu is called on each cpu, including the master, so due to 
init_early hook, u end up calling above twice on master !


> +
> +/*----------------------- Machine Descriptions ------------------------------
> + *
> + * Machine description is simply a set of platform/board specific callbacks
> + * This is not directly related to DeviceTree based dynamic device creation,
> + * however as part of early device tree scan, we also select the right
> + * callback set, by matching the DT compatible name.
> + */

No Cargo-culting please ! Take this comment out.

> +
> +static const char *hsdk_compat[] __initconst = {
> +	"snps,hsdk",
> +	NULL,
> +};
> +
> +MACHINE_START(SIMULATION, "hsdk")
> +	.dt_compat	= hsdk_compat,
> +	.init_early	= hsdk_early_init,
> +	.init_per_cpu	= hsdk_init_per_cpu,
> +MACHINE_END
> 
