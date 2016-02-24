From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 24 Feb 2016 05:05:40 +0000
Subject: [PATCH] arc: make sure __delay() never gets executed with 0 loops
References: <1455554267-23886-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8BD8E@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 15 February 2016 10:07 PM, Alexey Brodkin wrote:
> Current implementation of __delay() function uses so-called
> zero-delay loops. And the only condition to exit that loop is
> LP_COUNT (loop count register) = 1 (but not 0 as it might be easily
> imagined).

So u can fix this better by doing a lp.nz, but....

> So if our calculation of "loops" gives 0 (and that is pretty possible
> given result of multiplication being >> 32) then zero-delay loop
> mechanism starts with LP_COUNT=0 and it ends up decrementing LP_COUNT
> while staying in the loop effectively producing close to infinite delay
> instead of very short one.
>
> I bumped into it with AXS101 + external DDR controller and caches
> disabled. In that case I've got very small
> loops_per_jiffy=0xf00:

I understand this gives you grief, but the code is doing exactly what it is asked to.
Since the system is slow, You are getting only 0xf00 (3840) loop iterations in 10ms.
So if you want say a delay of 1 micro-sec, you will need to loop for 3840 / 10000
~ 0 loops

This all assumes our lpj computation is correct - otherwise that needs fixing too.

Anyways I think for genuine cases where the number of loops is indeed computed to
0 because caller was passing too small a value, it is better to wait for looong
time to catch the bugger rather than silently returning. This is one of the cases
where disease is better than the cure !

> ------------------------>8--------------------
> Calibrating delay loop... 0.77 BogoMIPS (lpj=3862)
> ------------------------>8--------------------
>
> And on console output delays were way too long.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
>  Please enter the commit message for your changes. Lines starting
> ---
>  arch/arc/include/asm/delay.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/include/asm/delay.h b/arch/arc/include/asm/delay.h
> index 08e7e2a..1a7a1dc 100644
> --- a/arch/arc/include/asm/delay.h
> +++ b/arch/arc/include/asm/delay.h
> @@ -57,7 +57,8 @@ static inline void __udelay(unsigned long usecs)
>  	 */
>  	loops = ((u64) usecs * 4295 * HZ * loops_per_jiffy) >> 32;
>  
> -	__delay(loops);
> +	if (loops)
> +		__delay(loops);
>  }
>  
>  #define udelay(n) (__builtin_constant_p(n) ? ((n) > 20000 ? __bad_udelay() \
