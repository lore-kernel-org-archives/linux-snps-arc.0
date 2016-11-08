From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 7 Nov 2016 17:58:38 -0800
Subject: [PATCH v3 2/3] ARCv2: MCIP: Use hwirq instead of virq for
 resolution of IDU IRQ handlers
In-Reply-To: <1478175788-3118-3-git-send-email-yuriy.kolerov@synopsys.com>
References: <1478175788-3118-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1478175788-3118-3-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <dcd10fb2-5fa4-805e-5379-972941c81be0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/03/2016 05:23 AM, Yuriy Kolerov wrote:
> Multicore ARC configurations use IDU (Interrupt Distribution Unit) for
> distributing of common interrupts. In fact IDU is a interrupt controller
> on top of main per core interrupt controller.
> 
> All common IRQs are physically and linearly mapped to per core
> interrupts. E.g. <0, 1, 2, 3> common IDU interrupts may be mapped to per
> core <24, 25, 26, 27> interrupts. An initialization code of IDU
> controller (idu_of_init) creates mappings for all parent interrupts
> <24, 25, ...> and sets a chained IDU handler for them. In the same
> time idu_of_init must save the first met parent hwirq (idu_first_irq)
> thus in future it is possible to figure out what common hwirq has come
> by subtracting of idu_first_irq from the current parent hwirq (see
> idu_cascade_isr).
> 
> The problem is that idu_of_init and idu_cascade_isr use parent virtual
> IRQs as hardware IRQs and perform all the above-described manipulations
> on virtual IRQs. But it is wrong and hardware IRQs must be used instead.

Is this series bisectable ?

So if one only applies patch 1/3 (and not 2/3) - as might happen in case of a
bisect for some arbit problem, will it still work - to me it seems not.

> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/kernel/mcip.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
> index 72f9179..4f4f04b 100644
> --- a/arch/arc/kernel/mcip.c
> +++ b/arch/arc/kernel/mcip.c
> @@ -219,16 +219,14 @@ static struct irq_chip idu_irq_chip = {
>  
>  };
>  
> -static int idu_first_irq;
> +static irq_hw_number_t idu_first_hwirq;
>  
>  static void idu_cascade_isr(struct irq_desc *desc)
>  {
> -	struct irq_domain *domain = irq_desc_get_handler_data(desc);
> -	unsigned int core_irq = irq_desc_get_irq(desc);
> -	unsigned int idu_irq;
> -
> -	idu_irq = core_irq - idu_first_irq;
> -	generic_handle_irq(irq_find_mapping(domain, idu_irq));
> +	struct irq_domain *idu_domain = irq_desc_get_handler_data(desc);
> +	irq_hw_number_t core_hwirq = irqd_to_hwirq(irq_desc_get_irq_data(desc));
> +	irq_hw_number_t idu_hwirq = core_hwirq - idu_first_hwirq;
> +	generic_handle_irq(irq_find_mapping(idu_domain, idu_hwirq));
>  }
>  
>  static int idu_irq_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t hwirq)
> @@ -294,7 +292,7 @@ idu_of_init(struct device_node *intc, struct device_node *parent)
>  	struct irq_domain *domain;
>  	/* Read IDU BCR to confirm nr_irqs */
>  	int nr_irqs = of_irq_count(intc);
> -	int i, irq;
> +	int i, virq;
>  
>  	if (!idu_detected)
>  		panic("IDU not detected, but DeviceTree using it");
> @@ -312,11 +310,11 @@ idu_of_init(struct device_node *intc, struct device_node *parent)
>  		 * however we need it to get the parent virq and set IDU handler
>  		 * as first level isr
>  		 */
> -		irq = irq_of_parse_and_map(intc, i);
> +		virq = irq_of_parse_and_map(intc, i);
>  		if (!i)
> -			idu_first_irq = irq;
> +			idu_first_hwirq = irqd_to_hwirq(irq_get_irq_data(virq));
>  
> -		irq_set_chained_handler_and_data(irq, idu_cascade_isr, domain);
> +		irq_set_chained_handler_and_data(virq, idu_cascade_isr, domain);
>  	}
>  
>  	__mcip_cmd(CMD_IDU_ENABLE, 0);
> 
