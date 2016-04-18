From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 18 Apr 2016 12:21:55 +0530
Subject: [PATCH v4 5/5] ARC: [intc-*] switch to linear domain
In-Reply-To: <1460547605-26184-6-git-send-email-vgupta@synopsys.com>
References: <1460547605-26184-1-git-send-email-vgupta@synopsys.com>
 <1460547605-26184-6-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5714840B.5080309@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marc,

On Wednesday 13 April 2016 05:10 PM, Vineet Gupta wrote:
> Now that we have Timers probed from DT, don't need legacy domain
> 
> This however requires mapping to be called explicitly for the IRQ which
> still can't (and probably never) be probed from DT such as IPI and
> SOFTIRQ
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/intc-arcv2.c   | 8 ++++++--
>  arch/arc/kernel/intc-compact.c | 2 +-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
> index 592cc977151e..6c24faf48b16 100644
> --- a/arch/arc/kernel/intc-arcv2.c
> +++ b/arch/arc/kernel/intc-arcv2.c
> @@ -146,8 +146,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
>  	if (parent)
>  		panic("DeviceTree incore intc not a root irq controller\n");
>  
> -	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
> -					    &arcv2_irq_ops, NULL);
> +	root_domain = irq_domain_add_linear(intc, NR_CPU_IRQS, &arcv2_irq_ops, NULL);
>  	if (!root_domain)
>  		panic("root irq domain not avail\n");
>  
> @@ -157,6 +156,11 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
>  	 */
>  	irq_set_default_host(root_domain);
>  
> +#ifdef CONFIG_SMP
> +	irq_create_mapping(root_domain, IPI_IRQ);
> +#endif
> +	irq_create_mapping(root_domain, SOFTIRQ_IRQ);
> +
>  	return 0;
>  }
>  
> diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
> index 48a8b24de23e..c5cceca36118 100644
> --- a/arch/arc/kernel/intc-compact.c
> +++ b/arch/arc/kernel/intc-compact.c
> @@ -105,7 +105,7 @@ init_onchip_IRQ(struct device_node *intc, struct device_node *parent)
>  	if (parent)
>  		panic("DeviceTree incore intc not a root irq controller\n");
>  
> -	root_domain = irq_domain_add_legacy(intc, NR_CPU_IRQS, 0, 0,
> +	root_domain = irq_domain_add_linear(intc, NR_CPU_IRQS,
>  					    &arc_intc_domain_ops, NULL);
>  	if (!root_domain)
>  		panic("root irq domain not avail\n");
> 

Does this patch look ok to you ? Do you want to see any other improvements here.

-Vineet
