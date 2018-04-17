From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Apr 2018 09:58:19 -0700
Subject: [PATCH] clocksource: arc_timer: add comments about locking while
 read GFRC
In-Reply-To: <20180417155232.4989-1-Eugeniy.Paltsev@synopsys.com>
References: <20180417155232.4989-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a87ce229-2142-f393-aabf-2b0750f19ae5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 04/17/2018 08:52 AM, Eugeniy Paltsev wrote:
> This came to light in some internal discussions and it is nice to have
> this documented rather than digging up the PRM (Prog Ref Manual) again.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Minor nits below, otherwise LGTM !
Acked-by: Vineet Gupta <vgupta at synopsys.com>

> ---
>   drivers/clocksource/arc_timer.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
> index 4927355f9cbe..b594c373debc 100644
> --- a/drivers/clocksource/arc_timer.c
> +++ b/drivers/clocksource/arc_timer.c
> @@ -61,6 +61,19 @@ static u64 arc_read_gfrc(struct clocksource *cs)
>   	unsigned long flags;
>   	u32 l, h;
>   
> +	/*
> +	 * MCIP_CMD/MCIP_READBACK registers are allocated

 From a programming model pov, there seems to be just one instance of 
MCIP_CMD/MCIP_READBACK however micro-architecturally there's an instance PER ARC 
CORE.....
> +	 * PER ARC CORE (not per cluster), and there are dedicated hardware
> +	 * decode logic (per core) inside ARConnect to handle simultaneous
> +	 * read/write accesses from cores via those two registers.
> +	 * So several concurrent commands to ARConnect are OK if they are
> +	 * trying to access two different sub-components (like GFRC,
> +	 * inter-core interrupt, etc...). HW also support simultaneously

s/support/supports/

> +	 * accessing GFRC by multiple cores.
> +	 * That's why it is safe to disable hard interrupts on the local CPU
> +	 * before access to GFRC instead of taking global MCIP spinlock
> +	 * defined in arch/arc/kernel/mcip.c
> +	 */
>   	local_irq_save(flags);
>   
>   	__mcip_cmd(CMD_GFRC_READ_LO, 0);
