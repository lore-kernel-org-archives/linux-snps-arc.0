From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 30 Sep 2016 14:18:35 -0700
Subject: [PATCH] ARCv2: intc: Use kflag if STATUS32.IE must be reset
In-Reply-To: <1473695703-29547-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1473695703-29547-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b95120e6-010b-0822-e915-2f1abf964a56@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/12/2016 08:55 AM, Yuriy Kolerov wrote:
> In the end of "arc_init_IRQ" STATUS32.IE flag is going to be affected by
> "flag" instruction but "flag" never touches IE flag on ARCv2. So "kflag"
> instruction must be used instead of "flag".
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> ---
>  arch/arc/kernel/intc-arcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
> index 6c24faf..62b59409 100644
> --- a/arch/arc/kernel/intc-arcv2.c
> +++ b/arch/arc/kernel/intc-arcv2.c
> @@ -74,7 +74,7 @@ void arc_init_IRQ(void)
>  	tmp = read_aux_reg(0xa);
>  	tmp |= STATUS_AD_MASK | (irq_prio << 1);
>  	tmp &= ~STATUS_IE_MASK;
> -	asm volatile("flag %0	\n"::"r"(tmp));
> +	asm volatile("kflag %0	\n"::"r"(tmp));

Revisiting this in light of ongoing 2 priority interrupt support for HS38 cores.

It seems there is no need to fiddle with interrupt bits here at all.

init/main.c now has well known checkpoints where it explicitly disables the
interrupts in early boot code and enables them when time is right. So when we land
in arc_init_IRQ() interrupts have already been disabled.

So I'm dropping this patch and instead adding another one which removes the intr
bits touching part !

OK ?

-Vineet
