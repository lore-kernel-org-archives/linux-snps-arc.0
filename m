From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 31 Jan 2017 10:15:36 -0800
Subject: [PATCH v2 1/4] ARCv2: IRQ: Move structure for build register of
 core intc to the header
In-Reply-To: <1485863124-26426-2-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1485863124-26426-2-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c789d66f-55df-28ad-de29-649bd5c095cd@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/31/2017 03:45 AM, Yuriy Kolerov wrote:
> Also add new macro ARC_REG_STATUS32 for the address of STATUS32
> auxiliary register. It is better to use it instead of magic numbers.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/include/asm/arcregs.h | 11 +++++++++++
>  arch/arc/kernel/intc-arcv2.c   | 10 ++--------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index f659942..2328244 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h
> @@ -38,6 +38,9 @@
>  #define ARC_REG_CLUSTER_BCR	0xcf
>  #define ARC_REG_AUX_ICCM	0x208	/* ICCM Base Addr (ARCv2) */
>  
> +/* Common for ARCompact and ARCv2 status register */
> +#define ARC_REG_STATUS32	0x0A
> +
>  /* status32 Bits Positions */
>  #define STATUS_AE_BIT		5	/* Exception active */
>  #define STATUS_DE_BIT		6	/* PC is in delay slot */
> @@ -233,6 +236,14 @@ struct bcr_generic {
>  #endif
>  };
>  
> +struct bcr_irq_arcv2 {
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +	unsigned int pad:3, firq:1, prio:4, exts:8, irqs:8, ver:8;
> +#else
> +	unsigned int ver:8, irqs:8, exts:8, prio:4, firq:1, pad:3;
> +#endif
> +};

Looks like I was too eager to apply.
This doesn't need to be exported to outside intc code. I will fix it up locally !

> +
>  /*
>   *******************************************************************
>   * Generic structures to hold build configuration used at runtime
> diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
> index ecef0fb..9de0665 100644
> --- a/arch/arc/kernel/intc-arcv2.c
> +++ b/arch/arc/kernel/intc-arcv2.c
> @@ -24,13 +24,7 @@ void arc_init_IRQ(void)
>  {
>  	unsigned int tmp, irq_prio;
>  
> -	struct irq_build {
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -		unsigned int pad:3, firq:1, prio:4, exts:8, irqs:8, ver:8;
> -#else
> -		unsigned int ver:8, irqs:8, exts:8, prio:4, firq:1, pad:3;
> -#endif
> -	} irq_bcr;
> +	struct bcr_irq_arcv2 irq_bcr;
>  
>  	struct aux_irq_ctrl {
>  #ifdef CONFIG_CPU_BIG_ENDIAN
> @@ -69,7 +63,7 @@ void arc_init_IRQ(void)
>  		irq_bcr.firq ? " FIRQ (not used)":"");
>  
>  	/* setup status32, don't enable intr yet as kernel doesn't want */
> -	tmp = read_aux_reg(0xa);
> +	tmp = read_aux_reg(ARC_REG_STATUS32);
>  	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
>  	tmp &= ~STATUS_IE_MASK;
>  	asm volatile("kflag %0	\n"::"r"(tmp));
> 
