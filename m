From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 17 Jan 2017 21:41:20 +0000
Subject: [PATCH 4/4] ARCv2: smp-boot: MCIP: use Inter-Core-Debug unit to
 kick start non master cpus
In-Reply-To: <1484600277-32345-5-git-send-email-vgupta@synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
 <1484600277-32345-5-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646789B05F@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta
> Sent: Monday, January 16, 2017 11:58 PM
> To: linux-snps-arc at lists.infradead.org; Alexey Brodkin
> <abrodkin at synopsys.com>
> Cc: linux-kernel at vger.kernel.org; Vineet Gupta <vgupta at synopsys.com>
> Subject: [PATCH 4/4] ARCv2: smp-boot: MCIP: use Inter-Core-Debug unit to
> kick start non master cpus
> 
> This essentially converts a run-on-reset to halt-on-reset - so non masters self
> halt in early boot code. And later they are resumed from halted PC using
> MCIP ICD assist.
> 
> As mentioned in prev commits, this paves way for radio silence on coherency
> unit, while master is setting up IOC and such.
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/include/asm/mcip.h |  1 +
>  arch/arc/kernel/mcip.c      | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/arc/include/asm/mcip.h b/arch/arc/include/asm/mcip.h
> index c8fbe4114bad..a6ae4363c388 100644
> --- a/arch/arc/include/asm/mcip.h
> +++ b/arch/arc/include/asm/mcip.h
> @@ -36,6 +36,7 @@ struct mcip_cmd {
>  #define CMD_SEMA_CLAIM_AND_READ		0x11
>  #define CMD_SEMA_RELEASE		0x12
> 
> +#define CMD_DEBUG_RUN			0x33
>  #define CMD_DEBUG_SET_MASK		0x34
>  #define CMD_DEBUG_SET_SELECT		0x36
> 
> diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c index
> 933382e0edd0..0a1822d2fe52 100644
> --- a/arch/arc/kernel/mcip.c
> +++ b/arch/arc/kernel/mcip.c
> @@ -103,12 +103,43 @@ static void mcip_probe_n_setup(void)
>  	cpuinfo_arc700[0].extn.gfrc = mp.gfrc;  }
> 
> +static void __init mcip_cpu_wait(int cpu) {

Has this one passed checkpatch? Above "{" on the same line as function name
and closing one merged with the previous line look strange.

At least here it is said that way:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst#n129

> +	struct mcip_bcr mp;
> +
> +	READ_BCR(ARC_REG_MCIP_BCR, mp);
> +
> +	/*
> +	 * self halt for waiting as Master will resume us using MCIP ICD assist
> +	 * Note: if ICD is not configured, we are hosed, but panic here is
> +	 *       not going to help as UART access might not even work
> +	 */
> +	if (mp.dbg)
> +		asm volatile("flag 1	\n");

Are you sure that won't trigger MDB stop?
I would imagine if MDB saw coreX running and then it unexpectedly [for MDB] gets halted
MDB stops, no? Essentially I'm talking about properly set CPMD session.

I have no board handy ATM so just thinking out loud.

> +}
> +
> +static void __init mcip_cpu_kick(int cpu, unsigned long pc) {
> +	struct mcip_bcr mp;
> +
> +	READ_BCR(ARC_REG_MCIP_BCR, mp);
> +
> +	if (mp.dbg)
> +		__mcip_cmd_data(CMD_DEBUG_RUN, 0, (1 << cpu));
> +	else
> +		panic("SMP boot issues: MCIP lacks ICD\n"); }
> +
>  struct plat_smp_ops plat_smp_ops = {
>  	.info		= smp_cpuinfo_buf,
>  	.init_early_smp	= mcip_probe_n_setup,
>  	.init_per_cpu	= mcip_setup_per_cpu,
>  	.ipi_send	= mcip_ipi_send,
>  	.ipi_clear	= mcip_ipi_clear,
> +	.cpu_kick	= mcip_cpu_kick,
> +#ifndef CONFIG_ARC_SMP_HALT_ON_RESET

I really hate compile-time defined stuff and would prefer to remove most of that
stuff at least in ARC code instaed of adding more items that stops us from using
the same binary on wider range of ARC cores.

In 2/4 you already do check if core was configured [actually Linux kernel was configured but not the HW]
-------------------------->8-------------------------
if (IS_ENABLED(CONFIG_ARC_SMP_HALT_ON_RESET))
-------------------------->8-------------------------
so "plat_smp_ops.cpu_wait(cpu)" won't be executed anyways.

> +	.cpu_wait	= mcip_cpu_wait,
> +#endif
>  };

So why don't we implement it all much simpler regardless CONFIG_ARC_SMP_HALT_ON_RESET?
Like that:
-------------------------->8-------------------------
static void __init mcip_cpu_wait(int cpu)
{
	struct mcip_bcr mp;

	/* Check if master has already set "wake_flag" wanting us to run */
	if (wake_flag != cpu) { // or similar construction if we switch to bitfield

		READ_BCR(ARC_REG_MCIP_BCR, mp);

		/*
		 * self halt for waiting as Master will resume us using MCIP ICD assist
		 * Note: if ICD is not configured, we are hosed, but panic here is
		 *       not going to help as UART access might not even work
		 */
		if (mp.dbg)
			asm volatile("flag 1	\n");
	}
}
-------------------------->8-------------------------

And I think we may then keep mcip_cpu_kick() as it is.
In ARConnect databook there's no mention of side-effects for CMD_DEBUG_RUN being used
against already running core.

IMHO with this approach we'll be able to handle cases when [pre-]bootloader inverted HALT/RUN_ON_RESET state.

-Alexey
