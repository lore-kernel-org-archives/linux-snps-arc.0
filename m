From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 24 Oct 2016 19:25:43 -0700
Subject: [PATCH v2 2/5] ARC: SMP: Pass virq to smp_ipi_irq_setup instead
 of hwirq
In-Reply-To: <1477313194-2310-2-git-send-email-yuriy.kolerov@synopsys.com>
References: <1477313194-2310-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1477313194-2310-2-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cdfff9de-7451-098f-e5ec-dad593bfe150@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/24/2016 05:46 AM, Yuriy Kolerov wrote:
> This function takes a cpu number and a virq number and registers an
> appropriate handler per cpu. However smp_ipi_irq_setup is incorrectly
> used in several places of ARC platform code - hwirq is passed instead of
> virq. There is a code with an example of inccorect usage of smp_ipi_irq_setup:
> 
>     smp_ipi_irq_setup(cpu, IPI_IRQ);
>     smp_ipi_irq_setup(cpu, SOFTIRQ_IRQ);
> 
> where IPI_IRQ and SOFTIRQ_IRQ are hwirq numbers for per cpu interrupts.
> Since smp_ipi_irq_setup must be taken a virq number insdead of a hwirq
> number then it is necessary to fix usage of this function this way:
> 
>     smp_ipi_irq_setup(cpu, irq_find_mapping(NULL, IPI_IRQ));
>     smp_ipi_irq_setup(cpu, irq_find_mapping(NULL, SOFTIRQ_IRQ));
> 
> The idea is to find an appropriate mapping of <domain, hwirq> to virq
> by using irq_find_mapping function. NULL value is used as a domain
> argument (a default domain) since smp_ipi_irq_setup is used for
> registering an IRQ handler for a root interrupt controller (a default
> IRQ domain must be used).
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/kernel/mcip.c    | 5 +++--
>  arch/arc/plat-eznps/smp.c | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
> index 72f9179..28ff766 100644
> --- a/arch/arc/kernel/mcip.c
> +++ b/arch/arc/kernel/mcip.c
> @@ -11,6 +11,7 @@
>  #include <linux/smp.h>
>  #include <linux/irq.h>
>  #include <linux/spinlock.h>
> +#include <linux/irqdomain.h>
>  #include <asm/irqflags-arcv2.h>
>  #include <asm/mcip.h>
>  #include <asm/setup.h>
> @@ -22,8 +23,8 @@ static DEFINE_RAW_SPINLOCK(mcip_lock);
>  
>  static void mcip_setup_per_cpu(int cpu)
>  {
> -	smp_ipi_irq_setup(cpu, IPI_IRQ);
> -	smp_ipi_irq_setup(cpu, SOFTIRQ_IRQ);
> +	smp_ipi_irq_setup(cpu, irq_find_mapping(NULL, IPI_IRQ));
> +	smp_ipi_irq_setup(cpu, irq_find_mapping(NULL, SOFTIRQ_IRQ));

Can we do this slightly differently. smp_ipi_irq_setup() is just a helper anyways,
can we keep the interface the same (maybe explicit'ify that it takes hwirq). And
call irq_find_mapping() inside it - this will reduce the code churn !


>  }
>  
>  static void mcip_ipi_send(int cpu)
> diff --git a/arch/arc/plat-eznps/smp.c b/arch/arc/plat-eznps/smp.c
> index 5e901f8..dd996e0 100644
> --- a/arch/arc/plat-eznps/smp.c
> +++ b/arch/arc/plat-eznps/smp.c
> @@ -134,7 +134,7 @@ static void eznps_ipi_send(int cpu)
>  
>  static void eznps_init_per_cpu(int cpu)
>  {
> -	smp_ipi_irq_setup(cpu, NPS_IPI_IRQ);
> +	smp_ipi_irq_setup(cpu, irq_find_mapping(NULL, NPS_IPI_IRQ));
>  
>  	eznps_init_core(cpu);
>  	mtm_enable_core(cpu);
> 
