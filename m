From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Dec 2015 15:43:15 +0530
Subject: [PATCH v5 11/20] ARC: IPI: do not use generic IRQ domain
In-Reply-To: <1451222619-3610-12-git-send-email-noamc@ezchip.com>
References: <1451222619-3610-1-git-send-email-noamc@ezchip.com>
 <1451222619-3610-12-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5683AE3B.900@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 27 December 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> This behaviour is the desired one as been seen on other arch's.
> 
> We do not use generic irq domain and hence hwirq number is used
> directly by our code without any mapping to virq.
> In order to add IPI status to /proc/interrupts we use
> hardirq macros also we define arch_show_interrupts().
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> ---
>  arch/arc/include/asm/Kbuild    |    1 -
>  arch/arc/include/asm/hardirq.h |   22 ++++++++++++++++++++++
>  arch/arc/include/asm/smp.h     |    6 ++++++
>  arch/arc/kernel/irq.c          |   13 ++++++++++++-
>  arch/arc/kernel/smp.c          |   27 +++++++++++++++++++++++++++
>  5 files changed, 67 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arc/include/asm/hardirq.h
> 
> diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
> index 0b10ef2..bbc3e4a 100644
> --- a/arch/arc/include/asm/Kbuild
> +++ b/arch/arc/include/asm/Kbuild
> @@ -10,7 +10,6 @@ generic-y += errno.h
>  generic-y += fb.h
>  generic-y += fcntl.h
>  generic-y += ftrace.h
> -generic-y += hardirq.h

So this is going backwards - copy/paste generic code into arch header
I don't understand why you need this !


>  generic-y += hw_irq.h
>  generic-y += ioctl.h
>  generic-y += ioctls.h
> diff --git a/arch/arc/include/asm/hardirq.h b/arch/arc/include/asm/hardirq.h
> new file mode 100644
> index 0000000..e83aa88
> --- /dev/null
> +++ b/arch/arc/include/asm/hardirq.h
> @@ -0,0 +1,22 @@
> +#ifndef __ASM_ARC_HARDIRQ_H
> +#define __ASM_ARC_HARDIRQ_H
> +
> +#include <linux/cache.h>
> +#include <linux/threads.h>
> +
> +typedef struct {
> +	unsigned int __softirq_pending;
> +#ifdef CONFIG_SMP
> +	unsigned int ipi_irqs;
> +#endif
> +} ____cacheline_aligned irq_cpustat_t;
> +
> +#include <linux/irq_cpustat.h>	/* Standard mappings for irq_cpustat_t above */
> +#include <linux/irq.h>
> +
> +static inline void ack_bad_irq(unsigned int irq)
> +{
> +	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +}
> +
> +#endif /* __ASM_ARC_HARDIRQ_H */
> diff --git a/arch/arc/include/asm/smp.h b/arch/arc/include/asm/smp.h
> index 9913804..9e4ec48 100644
> --- a/arch/arc/include/asm/smp.h
> +++ b/arch/arc/include/asm/smp.h
> @@ -14,12 +14,16 @@
>  #include <linux/types.h>
>  #include <linux/init.h>
>  #include <linux/threads.h>
> +#include <asm/ptrace.h>
>  
>  #define raw_smp_processor_id() (current_thread_info()->cpu)
>  
>  /* including cpumask.h leads to cyclic deps hence this Forward declaration */
>  struct cpumask;
>  
> +/* including seq_file.h leads to cyclic deps hence this Forward declaration */
> +struct seq_file;
> +
>  /*
>   * APIs provided by arch SMP code to generic code
>   */
> @@ -32,6 +36,8 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
>  extern void __init smp_init_cpus(void);
>  extern void first_lines_of_secondary(void);
>  extern const char *arc_platform_smp_cpuinfo(void);
> +extern void arch_do_IPI(unsigned int irq, struct pt_regs *regs);
> +extern void show_ipi_list(struct seq_file *, int);
>  
>  /*
>   * API expected BY platform smp code (FROM arch smp code)
> diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
> index 7ae5411..c8d3c3d 100644
> --- a/arch/arc/kernel/irq.c
> +++ b/arch/arc/kernel/irq.c
> @@ -55,7 +55,10 @@ void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
>  void (*handle_arch_irq)(unsigned int hwirq, struct pt_regs *) = NULL;
>  void arch_do_IRQ(unsigned int irq, struct pt_regs *regs)
>  {
> -	handle_arch_irq(irq, regs);
> +	if (irq == IPI_IRQ)
> +		arch_do_IPI(irq, regs);
> +	else
> +		handle_arch_irq(irq, regs);
>  }
>  
>  void __init set_handle_irq(void (*handle_irq)(unsigned int hwirq,
> @@ -65,6 +68,14 @@ void __init set_handle_irq(void (*handle_irq)(unsigned int hwirq,
>  }
>  #endif
>  
> +int arch_show_interrupts(struct seq_file *p, int prec)
> +{
> +#ifdef CONFIG_SMP
> +	show_ipi_list(p, prec);
> +#endif
> +	return 0;
> +}
> +
>  /*
>   * API called for requesting percpu interrupts - called by each CPU
>   *  - For boot CPU, actually request the IRQ with genirq core + enables
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index ec6a5c1..8d37906 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -22,6 +22,7 @@
>  #include <linux/atomic.h>
>  #include <linux/cpumask.h>
>  #include <linux/reboot.h>
> +#include <linux/seq_file.h>
>  #include <asm/processor.h>
>  #include <asm/setup.h>
>  #include <asm/mach_desc.h>
> @@ -349,6 +350,32 @@ irqreturn_t do_IPI(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +void arch_do_IPI(unsigned int irq, struct pt_regs *regs)
> +{
> +	struct pt_regs *old_regs = set_irq_regs(regs);
> +	unsigned int cpu = smp_processor_id();
> +
> +	__IRQ_STAT(cpu, ipi_irqs)++;
> +
> +	irq_enter();
> +	do_IPI(irq, NULL);
> +	irq_exit();
> +
> +	set_irq_regs(old_regs);
> +}

WHY ?


> +
> +void show_ipi_list(struct seq_file *p, int prec)
> +{
> +	unsigned int cpu;
> +
> +	seq_printf(p, "%*s: ", prec - 1, "IPI");
> +
> +	for_each_online_cpu(cpu)
> +		seq_printf(p, "%10u ", __IRQ_STAT(cpu, ipi_irqs));
> +
> +	seq_printf(p, " %s\n", "IPI");
> +}
> +
>  /*
>   * API called by platform code to hookup arch-common ISR to their IPI IRQ
>   */
> 
