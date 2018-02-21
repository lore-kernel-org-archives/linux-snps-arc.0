From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 21 Feb 2018 12:31:40 -0800
Subject: [PATCH 1/3] ARC: mcip: halt GFRC together with ARC cores
In-Reply-To: <20180221094027.12674-1-Eugeniy.Paltsev@synopsys.com>
References: <20180221094027.12674-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a4a20519-e8b0-3522-0528-6de2595635ed@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

On 02/21/2018 01:40 AM, Eugeniy Paltsev wrote:
> Currently GFRC is running regardless state of ARC cores in the SMP cluster.
> That means even if ARC cores are halted when doing JTAG debugging GFRC
> [our source of wall-time] continues to run giving us unexpected warnings
> once we allow ARC cores to run due to some tasks being stuck for too
> long.

This patch is definitely nicer than previous version. Thx.


> Starting from ARC HS v3.0

 From the STAR fix, it seem this was fixed in HS 2.1c, so you should be able to 
test it on HSDK, which was my next question: where and how did you test this and 
verify that it works as we think it does. I tried the patch on HSDK and I still 
see the rcu_preempt self-detected stall error splat when running hackbench and 
pausing the target with Metaware debugger. Perhaps we need to write a small test 
case to check what's going on. Also try that on AXS103 release which is definitely 
HS 3.0 !


> it's possible to tie GFRC to state of up-to 4
> ARC cores with help of GFRC's CORE register where we set a mask for
> cores which state we need to rely on.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
> NOTE: with this patch previous patch is not required:
> http://patchwork.ozlabs.org/patch/875091/
> 
>   arch/arc/kernel/mcip.c | 23 +++++++++++++++++++++++
>   include/soc/arc/mcip.h |  2 ++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
> index f61a52b..e87a4ea 100644
> --- a/arch/arc/kernel/mcip.c
> +++ b/arch/arc/kernel/mcip.c
> @@ -22,10 +22,33 @@ static DEFINE_RAW_SPINLOCK(mcip_lock);
>   
>   static char smp_cpuinfo_buf[128];
>   
> +/*
> + * Set mask to halt GFRC if any online core in SMP cluster is halted.
> + * Only works for ARC HS v3.0+, on earlier versions has no effect.
> + */
> +static void mcip_update_gfrc_halt_mask(int cpu)
> +{
> +	struct mcip_bcr mp;
> +	u32 gfrc_halt_mask;
> +
> +	READ_BCR(ARC_REG_MCIP_BCR, mp);
> +
> +	if (!mp.gfrc)
> +		return;
> +

In theory this could be called concurrently by multiple cpus and mcip doesn't 
guarantee any internal serialization/buffering. Granted, current use case is fine 
as mcip_setup_per_cpu --> plat_smp_ops.init_per_cpu is serialized by master core, 
we could run into issue when say cpu hot plug etc works. So better to wrap this 
inside the spinlock which we already have.

> +	__mcip_cmd(CMD_GFRC_READ_CORE, 0);
> +	gfrc_halt_mask = read_aux_reg(ARC_REG_MCIP_READBACK);
> +	gfrc_halt_mask |= BIT(cpu);
> +	__mcip_cmd_data(CMD_GFRC_SET_CORE, 0, gfrc_halt_mask);
> +}
> +
>   static void mcip_setup_per_cpu(int cpu)
>   {
>   	smp_ipi_irq_setup(cpu, IPI_IRQ);
>   	smp_ipi_irq_setup(cpu, SOFTIRQ_IRQ);

Please move the bcr readout / gfrc check here so in future we can do any more 
checks as well.

> +
> +	/* Update GFRC halt mask as new CPU came online */
> +	mcip_update_gfrc_halt_mask(cpu);
>   }
>   
>   static void mcip_ipi_send(int cpu)
> diff --git a/include/soc/arc/mcip.h b/include/soc/arc/mcip.h
> index c2d1b15..a156fa5 100644
> --- a/include/soc/arc/mcip.h
> +++ b/include/soc/arc/mcip.h
> @@ -40,6 +40,8 @@ struct mcip_cmd {
>   
>   #define CMD_GFRC_READ_LO		0x42
>   #define CMD_GFRC_READ_HI		0x43
> +#define CMD_GFRC_SET_CORE		0x47
> +#define CMD_GFRC_READ_CORE		0x48
>   
>   #define CMD_IDU_ENABLE			0x71
>   #define CMD_IDU_DISABLE			0x72
> 
