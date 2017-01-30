From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 30 Jan 2017 10:56:59 -0800
Subject: [PATCH 1/6] ARCv2: IRQ: Move structures for core intc to the
 header
In-Reply-To: <1485561703-20921-2-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485561703-20921-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1485561703-20921-2-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c9572049-41a1-16fb-afda-d3275a117da0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/27/2017 04:01 PM, Yuriy Kolerov wrote:
> Also add new macro ARC_REG_STATUS32 for the address of STATUS32
> auxiliary register. It is better to use it instead of magic numbers.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/include/asm/arcregs.h | 26 ++++++++++++++++++++++++++
>  arch/arc/kernel/intc-arcv2.c   | 23 +++--------------------
>  2 files changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index f659942..bc1f7bf 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h

[snip]...

> +
> +struct aux_irq_ctrl_arcv2 {
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +	unsigned int res3:18, save_idx_regs:1, res2:1, save_u_to_u:1,
> +		     save_lp_regs:1, save_blink:1, res:4, save_nr_gpr_pairs:5;
> +#else
> +	unsigned int save_nr_gpr_pairs:5, res:4, save_blink:1, save_lp_regs:1,
> +		     save_u_to_u:1, res2:1, save_idx_regs:1, res3:18;
> +#endif
> +};
> +

arcreg.h used to be dumping ground for every struct definition which is wrong.
I've trimmed it gradually - so please don't reintroduce stuff here, unless it is
really arc global.

>  /*
>   *******************************************************************
>   * Generic structures to hold build configuration used at runtime
> diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
> index ecef0fb..2f31bb1 100644
> --- a/arch/arc/kernel/intc-arcv2.c
> +++ b/arch/arc/kernel/intc-arcv2.c
> @@ -24,25 +24,8 @@ void arc_init_IRQ(void)
>  {

[snip]...

> @@ -69,7 +52,7 @@ void arc_init_IRQ(void)
>  		irq_bcr.firq ? " FIRQ (not used)":"");
>  
>  	/* setup status32, don't enable intr yet as kernel doesn't want */
> -	tmp = read_aux_reg(0xa);
> +	tmp = read_aux_reg(ARC_REG_STATUS32);

This is fine !


>  	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
>  	tmp &= ~STATUS_IE_MASK;
>  	asm volatile("kflag %0	\n"::"r"(tmp));
> 
