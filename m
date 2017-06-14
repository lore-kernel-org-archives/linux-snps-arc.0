From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 14 Jun 2017 15:49:30 -0700
Subject: [PATCH v2 08/12] ARC: [plat-eznps] new command line argument for
 HW scheduler at MTM
In-Reply-To: <1497362636-30353-9-git-send-email-noamca@mellanox.com>
References: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
 <1497362636-30353-9-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a3a61232-fb33-8080-e1a1-4d97355840ed@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/13/2017 07:03 AM, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> We add ability for all cores at NPS SoC to control the number of cycles
> HW thread can execute before it is replace with another eligible
> HW thread within the same core. The replacement is done by the
> HE scheduler.
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |    9 ++++
>   arch/arc/plat-eznps/mtm.c                       |   49 ++++++++++++++++++++++-
>   2 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 15f79c2..5b551f7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2693,6 +2693,15 @@
>   			If the dependencies are under your control, you can
>   			turn on cpu0_hotplug.
>   
> +	nps_mtm_hs_ctr= [KNL,ARC]
> +			This parameter sets the maximum duration, in
> +			cycles, each HW thread of the CTOP can run
> +			without interruptions, before HW switches it.
> +			The actual maximum duration is 16 times this
> +			parameter's value.
> +			Format: integer between 1 and 255
> +			Default: 255
> +
>   	nptcg=		[IA-64] Override max number of concurrent global TLB
>   			purges which is reported from either PAL_VM_SUMMARY or
>   			SAL PALO.
> diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c
> index 59a0162..dd1ea1f 100644
> --- a/arch/arc/plat-eznps/mtm.c
> +++ b/arch/arc/plat-eznps/mtm.c
> @@ -21,10 +21,13 @@
>   #include <plat/mtm.h>
>   #include <plat/smp.h>
>   
> -#define MT_CTRL_HS_CNT		0xFF
> +#define MT_HS_CNT_MIN		0x01
> +#define MT_HS_CNT_MAX		0xFF
>   #define MT_CTRL_ST_CNT		0xF
>   #define NPS_NUM_HW_THREADS	0x10
>   
> +static int mtm_hs_ctr = MT_HS_CNT_MAX;
> +
>   #ifdef CONFIG_EZNPS_MEM_ERROR
>   int do_memory_error(unsigned long address, struct pt_regs *regs)
>   {
> @@ -129,7 +132,7 @@ void mtm_enable_core(unsigned int cpu)
>   	/* Enable HW schedule, stall counter, mtm */
>   	mt_ctrl.value = 0;
>   	mt_ctrl.hsen = 1;
> -	mt_ctrl.hs_cnt = MT_CTRL_HS_CNT;
> +	mt_ctrl.hs_cnt = mtm_hs_ctr;
>   	mt_ctrl.mten = 1;
>   	write_aux_reg(CTOP_AUX_MT_CTRL, mt_ctrl.value);
>   
> @@ -140,3 +143,45 @@ void mtm_enable_core(unsigned int cpu)
>   	 */
>   	cpu_relax();
>   }
> +
> +/* Handle an out of bounds mtm hs counter value */
> +static void __init handle_mtm_hs_ctr_out_of_bounds_error(uint8_t val)
> +{
> +	pr_err("** The value of mtm_hs_ctr is out of bounds!\n"
> +	       "** It must be in the range [%d,%d] (inclusive)\n"
> +	       "Setting mtm_hs_ctr to %d\n", MT_HS_CNT_MIN, MT_HS_CNT_MAX, val);

Do you really need such elaborate / verbose strings ! Please trim them !
Try to fit it in one line - breaking strings into multiple lines hurts sooner or 
later - when grep'ing etc

> +
> +	mtm_hs_ctr = val;
> +}
> +
> +/* Verify and set the value of the mtm hs counter */
> +static int __init set_mtm_hs_ctr(char *ctr_str)
> +{
> +	int ret;
> +	long hs_ctr;
> +
> +	ret = kstrtol(ctr_str, 0, &hs_ctr);
> +	if (ret) {
> +		pr_err("** Error parsing the value of mtm_hs_ctr\n"
> +		       "** Make sure you entered a valid integer value\n"
> +		       "Setting mtm_hs_ctr to default value: %d\n",
> +		       MT_HS_CNT_MAX);

Ditto !

> +		mtm_hs_ctr = MT_HS_CNT_MAX;
> +		return -EINVAL;
> +	}
> +
> +	if (hs_ctr > MT_HS_CNT_MAX) {
> +		handle_mtm_hs_ctr_out_of_bounds_error(MT_HS_CNT_MAX);
> +		return -EDOM;
> +	}
> +
> +	if (hs_ctr < MT_HS_CNT_MIN) {
> +		handle_mtm_hs_ctr_out_of_bounds_error(MT_HS_CNT_MIN);
> +		return -EDOM;
> +	}
> +
> +	mtm_hs_ctr = hs_ctr;
> +
> +	return 0;
> +}
> +early_param("nps_mtm_hs_ctr", set_mtm_hs_ctr);
> 
