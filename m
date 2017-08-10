From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Thu, 10 Aug 2017 12:10:51 -0700
Subject: [PATCH] arc: Mask individual IRQ lines during core INTC init
In-Reply-To: <1502377656-15678-1-git-send-email-abrodkin@synopsys.com>
References: <1502377656-15678-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <53761ece-5b0d-74a6-65a6-c28b094d28d7@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

On 08/10/2017 08:07 AM, Alexey Brodkin wrote:
> ARC cores on reset have all interrupt lines of built-in INTC enabled.
> Which means once we globally enable interrupts (very early on boot)
> faulty hardware blocks may trigger an interrupt that Linux kernel
> cannot handle yet as corresponding handler is not yet installed.
>
> In that case system falls in "interrupt storm" and basically never
> does anything useful except entering and exiting generic IRQ handling
> code.
>
> One real example of that kind of problematic hardware is DW GMAC which
> also has interrupts enabled on reset and if Ethernet PHY informs GMAC
> about link state, GMAC immediately reports that upstream to ARC core
> and here we are.
>
> Now with that change we mask all individual IRQ lines making entire
> system more fool-proof.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Eugeniy Paltsev <paltsev at synopsys.com>
> Cc: Alexandru Gagniuc <alex.g at adaptrum.com>

Tested-by: Alexandru Gagniuc <alex.g at adaptrum.com>

> ---
>  arch/arc/kernel/intc-arcv2.c   |  3 +++
>  arch/arc/kernel/intc-compact.c | 14 +++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
> index f928795fd07a..cf90714a676d 100644
> --- a/arch/arc/kernel/intc-arcv2.c
> +++ b/arch/arc/kernel/intc-arcv2.c
> @@ -75,10 +75,13 @@ void arc_init_IRQ(void)
>  	 * Set a default priority for all available interrupts to prevent
>  	 * switching of register banks if Fast IRQ and multiple register banks
>  	 * are supported by CPU.
> +	 * Also disable all IRQ lines so faulty external hardware won't
> +	 * trigger interrupt that kernel is not ready to handle.
>  	 */
>  	for (i = NR_EXCEPTIONS; i < irq_bcr.irqs + NR_EXCEPTIONS; i++) {
>  		write_aux_reg(AUX_IRQ_SELECT, i);
>  		write_aux_reg(AUX_IRQ_PRIORITY, ARCV2_IRQ_DEF_PRIO);
> +		write_aux_reg(AUX_IRQ_ENABLE, 0);
>  	}
>
>  	/* setup status32, don't enable intr yet as kernel doesn't want */
> diff --git a/arch/arc/kernel/intc-compact.c b/arch/arc/kernel/intc-compact.c
> index 7e608c6b0a01..cef388025adf 100644
> --- a/arch/arc/kernel/intc-compact.c
> +++ b/arch/arc/kernel/intc-compact.c
> @@ -27,7 +27,7 @@
>   */
>  void arc_init_IRQ(void)
>  {
> -	int level_mask = 0;
> +	int level_mask = 0, i;
>
>         /* Is timer high priority Interrupt (Level2 in ARCompact jargon) */
>  	level_mask |= IS_ENABLED(CONFIG_ARC_COMPACT_IRQ_LEVELS) << TIMER0_IRQ;
> @@ -40,6 +40,18 @@ void arc_init_IRQ(void)
>
>  	if (level_mask)
>  		pr_info("Level-2 interrupts bitset %x\n", level_mask);
> +
> +	/*
> +	 * Disable all IRQ lines so faulty external hardware won't
> +	 * trigger interrupt that kernel is not ready to handle.
> +	 */
> +	for (i = TIMER0_IRQ; i < NR_CPU_IRQS; i++) {
> +		unsigned int ienb;
> +
> +		ienb = read_aux_reg(AUX_IENABLE);
> +		ienb &= ~(1 << i);
> +		write_aux_reg(AUX_IENABLE, ienb);
> +	}
>  }
>
>  /*
>
