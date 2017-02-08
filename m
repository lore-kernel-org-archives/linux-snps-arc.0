From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 8 Feb 2017 08:08:11 -0800
Subject: [PATCH] ARCv2: intc: Disable all core interrupts by default
In-Reply-To: <1486508647-5997-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1486508647-5997-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0423cc7d-0b96-2d6d-f02a-67b6951aaa1c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/07/2017 03:04 PM, Yuriy Kolerov wrote:
> The kernel emits a lot of warnings about unexpected IRQs when
> an appropriate driver is not presented. It happens because all
> interrupts in the core controller are enabled by default after
> reset. It would be wise to keep all interrupts masked by default.
>
> Thus disable all local and common interrupts. If CPU consists of
> only 1 core without IDU then it is necessary to disable all
> interrupts in the core interrupt controller. If CPU contains IDU
> it means that there are may be more than 1 cores and common
> interrupts (>= FIRST_EXT_IRQ) must be disabled in IDU.

This is not elegant. core intc needs to do same thing to all interrupts coming in
- irrespective of whether they are funneled via IDU or not.


> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/kernel/intc-arcv2.c | 19 +++++++++++++++++++

[snip...]

> +
>  	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
>  		write_aux_reg(AUX_IRQ_SELECT, i);
>  		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
> +
> +		/*
> +		 * If IDU exists then all common interrupts >= FIRST_EXT_IRQ
> +		 * are masked by IDU thus disable only local interrupts (below
> +		 * FIRST_EXT_IRQ). Otherwise disable all interrupts.
> +		 */
> +		if (!mp.idu || i < FIRST_EXT_IRQ)
> +			write_aux_reg(AUX_IRQ_ENABLE, 0);

So you seem to assume that anything > FIRST_EXT_IRQ is coming in via IDU which may
not be case.
external Interrupts can be wired to core directly - not via IDU
 - 16 .. 23 are cpu private reserved irq
 - 24 .. C are common irqs (via IDU)
 - C + 1 .. N are cpu private external irqs

so better to disable all irq_bcr.irqs independent of how they are hooked up !

-Vineet
