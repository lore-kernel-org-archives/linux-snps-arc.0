From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 4 Nov 2016 17:58:11 +0000
Subject: [PATCH v2 01/10] ARC: timer: rtc: implement read loop in "C"
 vs. inline asm
In-Reply-To: <1478208701-30923-2-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646785A901@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Friday, November 04, 2016 12:32 AM
> To: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Noam Camus <noamca at mellanox.com>; tglx at linutronix.de; linux-snps-arc at lists.infradead.org; linux-kernel at vger.kernel.org;
> Alexey.Brodkin at synopsys.com; Vineet Gupta <vgupta at synopsys.com>; stable at vger.kernel.org
> Subject: [PATCH v2 01/10] ARC: timer: rtc: implement read loop in "C" vs. inline asm
> 
> The current code doesn't even compile ....
> 
> CC: stable at vger.kernel.org
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/time.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
> index f927b8dc6edd..1a117b999c0c 100644
> --- a/arch/arc/kernel/time.c
> +++ b/arch/arc/kernel/time.c
> @@ -152,14 +152,17 @@ static cycle_t arc_read_rtc(struct clocksource *cs)
>  		cycle_t  full;
>  	} stamp;
> 
> -
> -	__asm__ __volatile(
> -	"1:						\n"
> -	"	lr		%0, [AUX_RTC_LOW]	\n"
> -	"	lr		%1, [AUX_RTC_HIGH]	\n"
> -	"	lr		%2, [AUX_RTC_CTRL]	\n"
> -	"	bbit0.nt	%2, 31, 1b		\n"
> -	: "=r" (stamp.low), "=r" (stamp.high), "=r" (status));
> +        /*
> +         * hardware has an internal state machine which tracks readout of
> +         * low/high and updates the CTRL.status if
> +         *  - interrupt/exception taken between the two reads
> +         *  - high increments after low has been read
> +         */
> +	do {
> +		stamp.low = read_aux_reg(AUX_RTC_LOW);
> +		stamp.high = read_aux_reg(AUX_RTC_HIGH);
> +		status = read_aux_reg(AUX_RTC_CTRL);
> +	} while (!(status & _BITUL(31)));

I think original Daniel's comment was about constant value used here.
Now with "_BITUL" it already looks much better but IMHO it would be even better if
31 gets converted here to something like:
------------------------>8--------------------
#define RTC_CTRL_A1_OFFSET 31
------------------------>8--------------------

-Alexey
