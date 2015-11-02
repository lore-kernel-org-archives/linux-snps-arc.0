From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 06:32:12 +0000
Subject: [PATCH v1 09/20] ARC: add CONFIG_CLKSRC_OF support to time_init()
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-10-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFC8C@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 31 October 2015 06:50 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> External clock source can be used if included by one of
> DTS file of a chosen platform.
> Signed-off-by: Noam Camus <noamc at ezchip.com>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

> ---
>  arch/arc/kernel/time.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
> index dfad287..5313961 100644
> --- a/arch/arc/kernel/time.c
> +++ b/arch/arc/kernel/time.c
> @@ -283,6 +283,10 @@ void __init time_init(void)
>  		 */
>  		clocksource_register_hz(&arc_counter, arc_get_core_freq());
>  
> +#ifdef CONFIG_CLKSRC_OF
> +	clocksource_of_init();
> +#endif
> +
>  	/* sets up the periodic event timer */
>  	arc_local_timer_setup();
>  }
