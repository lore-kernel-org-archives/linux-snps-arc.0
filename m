From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 22:52:21 +0100
Subject: [PATCH v2 01/10] ARC: timer: rtc: implement read loop in "C" vs.
 inline asm
In-Reply-To: <1478208701-30923-2-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103215221.GM1859@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@02:31:32PM -0700, Vineet Gupta wrote:
> The current code doesn't even compile ....

Give a better description in the log, especially if this patch is supposed to
go to stable@
 
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

Is the condition correct ? If I refer to your previous answer, the bit will be
set for status if the counter wrapped up. So in this case, we won't exit the
loop until we wrap up, no ?

>  	return stamp.full;
>  }
> -- 
> 2.7.4
> 
