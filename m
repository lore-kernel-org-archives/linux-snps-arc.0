From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 07:52:37 +0000
Subject: [PATCH v1 18/20] ARC: [plat-eznps] define IPI_IRQ
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-19-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFD60@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:53 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> We add IPI irq definition to be used later by any
> irqchip such NPS400 IC.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>

Again this break bisectability - it needs to be placed before you use this #define
in patch 3/20.
Anyhow since you are doing stuff via DT, why not get this value from DT itself
instead of hard coding.

> ---
>  arch/arc/include/asm/irq.h |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arc/include/asm/irq.h b/arch/arc/include/asm/irq.h
> index 4fd7d62..c5f8f0f 100644
> --- a/arch/arc/include/asm/irq.h
> +++ b/arch/arc/include/asm/irq.h
> @@ -16,7 +16,11 @@
>  #ifdef CONFIG_ISA_ARCOMPACT
>  #define TIMER0_IRQ      3
>  #define TIMER1_IRQ      4
> +#if defined(CONFIG_SMP) && defined(CONFIG_ARC_PLAT_EZNPS)
> +#define IPI_IRQ         5
> +#else
>  #define IPI_IRQ		(NR_CPU_IRQS-1) /* dummy to enable SMP build for up hardware */
> +#endif
>  #else
>  #define TIMER0_IRQ      16
>  #define TIMER1_IRQ      17
