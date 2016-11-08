From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 7 Nov 2016 23:20:55 -0800
Subject: [PATCH v4 1/2] ARC: IRQ: Do not use hwirq as virq and vice versa
In-Reply-To: <1478588912-3991-2-git-send-email-yuriy.kolerov@synopsys.com>
References: <1478588912-3991-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1478588912-3991-2-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2ef9083e-3e6a-9c52-4f40-aaa18855074a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

I'm planning to merge this valid patch. Please look at arc mailing list for more
context !

Can you please check if this doesn't break ur platform and/or requires a fixup.

Thx,
-Vineet


On 11/07/2016 11:08 PM, Yuriy Kolerov wrote:
> At first smp_ipi_irq_setup() takes a cpu number and a hwirq number for
> the per core local interrupt line in the root interrupt controller and
> registers an appropriate IPI handler per cpu. However this function tries
> to bind a handler to the hwirq as virtual IRQ number and it is a wrong
> behavior. It is necessary to find a mapping of hwirq in the root IRQ
> domain to the actual virq using irq_find_mapping(). Also a declaration
> of smp_ipi_irq_setup() is corrected to denote that this function takes
> a hardware IRQ number but not a virtual IRQ number.
> 
> Also there is one more problem related to usage of IRQ numbers. Multicore
> ARC configurations use IDU (Interrupt Distribution Unit) for distributing
> of common interrupts. In fact IDU is a interrupt controller on top of
> main per core interrupt controller.
> 
> All common IRQs are physically and linearly mapped to per core
> interrupts. E.g. <0, 1, 2, 3> common IDU interrupts may be mapped to per
> core <24, 25, 26, 27> interrupts. An initialization code of IDU
> controller (idu_of_init()) creates mappings for all parent interrupts
> <24, 25, ...> and sets a chained IDU handler for them. In the same
> time idu_of_init() must save the first met parent hwirq (idu_first_irq)
> thus in future it is possible to figure out what common hwirq has come
> by subtracting of idu_first_irq from the current parent hwirq (see
> idu_cascade_isr()).
> 
> The problem is that idu_of_init() and idu_cascade_isr() use parent virtual
> IRQs as hardware IRQs and perform all the above-described manipulations
> on virtual IRQs. But it is wrong and hardware IRQs must be used instead.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/include/asm/smp.h |  4 ++--
>  arch/arc/kernel/mcip.c     | 20 +++++++++-----------
>  arch/arc/kernel/smp.c      | 13 +++++++++----
>  3 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
> index 89fdd1b..0861007 100644
> --- a/arch/arc/include/asm/smp.h
> +++ b/arch/arc/include/asm/smp.h
> @@ -37,9 +37,9 @@ extern const char *arc_platform_smp_cpuinfo(void);
>   * API expected BY platform smp code (FROM arch smp code)
>   *
>   * smp_ipi_irq_setup:
> - *	Takes @cpu and @irq to which the arch-common ISR is hooked up
> + *	Takes @cpu and @hwirq to which the arch-common ISR is hooked up
>   */
> -extern int smp_ipi_irq_setup(int cpu, int irq);
> +extern int smp_ipi_irq_setup(int cpu, irq_hw_number_t hwirq);
>  
>  /*
>   * struct plat_smp_ops	- SMP callbacks provided by platform to ARC SMP
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
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index f183cc6..692ca51 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -22,6 +22,7 @@
>  #include <linux/atomic.h>
>  #include <linux/cpumask.h>
>  #include <linux/reboot.h>
> +#include <linux/irqdomain.h>
>  #include <asm/processor.h>
>  #include <asm/setup.h>
>  #include <asm/mach_desc.h>
> @@ -351,20 +352,24 @@ irqreturn_t do_IPI(int irq, void *dev_id)
>   */
>  static DEFINE_PER_CPU(int, ipi_dev);
>  
> -int smp_ipi_irq_setup(int cpu, int irq)
> +int smp_ipi_irq_setup(int cpu, irq_hw_number_t hwirq)
>  {
>  	int *dev = per_cpu_ptr(&ipi_dev, cpu);
> +	unsigned int virq = irq_find_mapping(NULL, hwirq);
> +
> +	if (!virq)
> +		panic("Cannot find virq for root domain and hwirq=%lu", hwirq);
>  
>  	/* Boot cpu calls request, all call enable */
>  	if (!cpu) {
>  		int rc;
>  
> -		rc = request_percpu_irq(irq, do_IPI, "IPI Interrupt", dev);
> +		rc = request_percpu_irq(virq, do_IPI, "IPI Interrupt", dev);
>  		if (rc)
> -			panic("Percpu IRQ request failed for %d\n", irq);
> +			panic("Percpu IRQ request failed for %u\n", virq);
>  	}
>  
> -	enable_percpu_irq(irq, 0);
> +	enable_percpu_irq(virq, 0);
>  
>  	return 0;
>  }
> 
