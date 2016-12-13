From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 13 Dec 2016 09:40:18 -0800
Subject: [PATCH v2 1/2] ARC: SMP: Set the default affinity to the boot cpu
In-Reply-To: <1481277572-18283-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1481277572-18283-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <450690c2-1c1d-d123-1932-2871ed131828@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Yuriy,

On 12/09/2016 01:59 AM, Yuriy Kolerov wrote:
> By default the kernel sets a value for default affinity which may
> not correspond to the real bitmap of potentially online CPUs. E.g.
> for ARC HS processors with 2 cores the default value of affinity in
> the kernel may be 0xF and it is wrong in this case. This happens
> because init_irq_default_affinity() sets all bits in
> irq_default_affinity variable by default.
>
> It is better to set the default value of affinity to the boot core
> to guarantee that value of irq_default_affinity contains at least
> one valid online CPU during the early stage of booting. It is
> necessary for proper configuration of affinity for common interrupt.
>
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/kernel/irq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arc/kernel/irq.c b/arch/arc/kernel/irq.c
> index 538b36a..e53bfd5 100644
> --- a/arch/arc/kernel/irq.c
> +++ b/arch/arc/kernel/irq.c
> @@ -20,6 +20,12 @@
>   */
>  void __init init_IRQ(void)
>  {
> +#ifdef CONFIG_SMP
> +	/* Set the default affinity to the boot cpu. */
> +	cpumask_clear(irq_default_affinity);
> +	cpumask_set_cpu(smp_processor_id(), irq_default_affinity);
> +#endif
> +
>  	/*
>  	 * process the entire interrupt tree in one go
>  	 * Any external intc will be setup provided DT chains them

For a multi patch series, always include a cover letter. This gives an idea of
over intent of the series.
Also there is no record of what changed between v1 and v2. Reviewers typically
have a short memory span :-)
Also try to include all the reviewers: in this case Marc Z gave very good feedback
and direction for patches.
This is just a general lkml submission best practice !

Now on to the patch itself, I don't like arch code fudging a core genirq global
variable. If at all this needs to be moved into core code - assuming this is the
right thing to do !

Marc , tglx ?
-Vineet
