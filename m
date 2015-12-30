From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Dec 2015 15:40:38 +0530
Subject: [PATCH v5 10/20] ARC: IRQ: do not use hwirq directly at
 arch_do_IRQ()
In-Reply-To: <1451222619-3610-11-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-11-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5683AD9E.10501@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> ARC uses hwirq at arch_do_IRQ() to pass into generic_handle_irq().
> This is wrong since we need first to reverse map it into virq.
> 
> Happily, if we use handle_domain_irq() we get all we need.
> 
> Just like ARM I created a pointer to handler that should be filled
> by an interrupt controller driver from driver/irqchip/
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> ---
>  arch/arc/Kconfig           |    1 +
>  arch/arc/include/asm/irq.h |    5 +++++
>  arch/arc/kernel/irq.c      |   14 ++++++++++++++
>  3 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 7be1020..079946e 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -32,6 +32,7 @@ config ARC
>  	select HAVE_OPROFILE
>  	select HAVE_PERF_EVENTS
>  	select IRQ_DOMAIN
> +	select HANDLE_DOMAIN_IRQ if ARC_PLAT_EZNPS

On same lines as prev comment - just do this unconditionally for ARC port -
assuming this works with legacy domain as well.


>  	select MODULES_USE_ELF_RELA
>  	select NO_BOOTMEM
>  	select OF
> diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
> index c5f8f0f..64226c9 100644
> --- a/arch/arc/include/asm/irq.h
> +++ b/arch/arc/include/asm/irq.h
> @@ -36,4 +36,9 @@ void arc_request_percpu_irq(int irq, int cpu,
>                              irqreturn_t (*isr)(int irq, void *dev),
>                              const char *irq_nm, void *percpu_dev);
>  
> +#ifdef CONFIG_HANDLE_DOMAIN_IRQ
> +extern void set_handle_irq(void (*handle_irq)(unsigned int hwirq,
> +					      struct pt_regs *));
> +#endif

Not needed !

> +
>  #endif
> diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
> index ba17f85..7ae5411 100644
> --- a/arch/arc/kernel/irq.c
> +++ b/arch/arc/kernel/irq.c
> @@ -41,6 +41,7 @@ void __init init_IRQ(void)
>   * "C" Entry point for any ARC ISR, called from low level vector handler
>   * @irq is the vector number read from ICAUSE reg of on-chip intc
>   */
> +#ifndef CONFIG_HANDLE_DOMAIN_IRQ
>  void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
>  {
>  	struct pt_regs *old_regs = set_irq_regs(regs);
> @@ -50,6 +51,19 @@ void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
>  	irq_exit();
>  	set_irq_regs(old_regs);
>  }
> +#else
> +void (*handle_arch_irq)(unsigned int hwirq, struct pt_regs *) = NULL;
> +void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
> +{
> +	handle_arch_irq(irq, regs);
> +}
> +
> +void __init set_handle_irq(void (*handle_irq)(unsigned int hwirq,
> +					      struct pt_regs *))
> +{
> +	handle_arch_irq = handle_irq;
> +}
> +#endif
>  
>  /*
>   * API called for requesting percpu interrupts - called by each CPU
> 
