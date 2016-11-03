From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 18:02:56 +0100
Subject: [PATCH 2/9] ARC: timer: rtc: implement read loop in "C" vs.
 inline asm
In-Reply-To: <1477954096-770-3-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103170256.GC1859@mai>
To: linux-snps-arc@lists.infradead.org

On Mon, Oct 31, 2016@03:48:09PM -0700, Vineet Gupta wrote:
> To allow for easy movement into drivers/clocksource
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/time.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
> index a2db010cde18..2c51e3cafad0 100644
> --- a/arch/arc/kernel/time.c
> +++ b/arch/arc/kernel/time.c
> @@ -153,14 +153,11 @@ static cycle_t arc_read_rtc(struct clocksource *cs)
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
> +	do {
> +		stamp.low = read_aux_reg(AUX_RTC_LOW);
> +		stamp.high = read_aux_reg(AUX_RTC_HIGH);
> +		status = read_aux_reg(AUX_RTC_CTRL);
> +	} while (!(status & 0x80000000UL));

Replace the literal 0x80000000UL by a macro.

What is the 'status' for ?
  
>  	return stamp.full;
>  }
> -- 
> 2.7.4
> 
