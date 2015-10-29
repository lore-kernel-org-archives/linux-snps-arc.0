From: rdunlap@infradead.org (Randy Dunlap)
Date: Thu, 29 Oct 2015 10:09:18 -0700
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <563252BE.9030506@infradead.org>
To: linux-snps-arc@lists.infradead.org

typos (spellos):

On 10/28/15 15:47, Alexey Brodkin wrote:
> ---
>  lib/div64.c | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 128 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/div64.c b/lib/div64.c
> index 62a698a..3055328 100644
> --- a/lib/div64.c
> +++ b/lib/div64.c
> @@ -23,37 +23,140 @@
>  /* Not needed on 64bit architectures */
>  #if BITS_PER_LONG == 32
>  
> +
> +/*
> + * If the divisor happens to be constant, we determine the appropriate
> + * inverse at compile time to turn the division into a few inline
> + * multiplications instead which is much faster.
> + */
>  uint32_t __attribute__((weak)) __div64_32(uint64_t *n, uint32_t base)
>  {
> -	uint64_t rem = *n;
> -	uint64_t b = base;
> -	uint64_t res, d = 1;
> -	uint32_t high = rem >> 32;
> -
> -	/* Reduce the thing a bit first */
> -	res = 0;
> -	if (high >= base) {
> -		high /= base;
> -		res = (uint64_t) high << 32;
> -		rem -= (uint64_t) (high*base) << 32;
> -	}
> +	unsigned int __r, __b = base;
>  
> -	while ((int64_t)b > 0 && b < rem) {
> -		b = b+b;
> -		d = d+d;
> -	}
> +	if (!__builtin_constant_p(__b) || __b == 0) {
> +		/* non-constant divisor (or zero): slow path */
> +		uint64_t rem = *n;
> +		uint64_t b = base;
> +		uint64_t res, d = 1;
> +		uint32_t high = rem >> 32;
> +
> +		/* Reduce the thing a bit first */
> +		res = 0;
> +		if (high >= base) {
> +			high /= base;
> +			res = (uint64_t) high << 32;
> +			rem -= (uint64_t) (high*base) << 32;
> +		}
> +
> +		while ((int64_t)b > 0 && b < rem) {
> +			b = b+b;
> +			d = d+d;
> +		}
> +
> +		do {
> +			if (rem >= b) {
> +				rem -= b;
> +				res += d;
> +			}
> +			b >>= 1;
> +			d >>= 1;
> +		} while (d);
>  
> -	do {
> -		if (rem >= b) {
> -			rem -= b;
> -			res += d;
> +		*n = res;
> +		__r = rem;
> +	} else if ((__b & (__b - 1)) == 0) {
> +		/*
> +		 * Trivial: __b is constant and a power of 2
> +		 * gcc does the right thing with this code.
> +		 * Even though code is the same as above but
> +		 * we make it visually as a separate path.
> +		 * Still only one of these branches will survive
> +		 * pre-processor stage, so let's leave it here.
> +		 */
> +		__r = *n;
> +		__r &= (__b - 1);
> +		*n /= __b;
> +	} else {
> +		/* Start of preprocessor calculations */
> +
> +		/*
> +		 * Multiply by inverse of __b: *n/b = *n*(p/b)/p
> +		 * We rely on the fact that most of this code gets
> +		 * optimized away at compile time due to constant
> +		 * propagation and only a couple inline assembly
> +		 * instructions should remain. Better avoid any
> +		 * code construct that might prevent that.
> +		 */
> +		unsigned long long __res, __x, __t, __m, __n = *n;
> +		unsigned int __p;
> +		/* preserve low part of *n for reminder computation */

		                               remainder

> +		__r = __n;
> +		/* determine number of bits to represent __b */
> +		__p = 1 << __div64_fls(__b);
> +		/* compute __m = ((__p << 64) + __b - 1) / __b */
> +		__m = (~0ULL / __b) * __p;
> +		__m += (((~0ULL % __b + 1) * __p) + __b - 1) / __b;
> +		/* compute __res = __m*(~0ULL/__b*__b-1)/(__p << 64) */
> +		__x = ~0ULL / __b * __b - 1;
> +		__res = (__m & 0xffffffff) * (__x & 0xffffffff);
> +		__res >>= 32;
> +		__res += (__m & 0xffffffff) * (__x >> 32);
> +		__t = __res;
> +		__res += (__x & 0xffffffff) * (__m >> 32);
> +		__t = (__res < __t) ? (1ULL << 32) : 0;
> +		__res = (__res >> 32) + __t;
> +		__res += (__m >> 32) * (__x >> 32);
> +		__res /= __p;
> +		/* End of preprocessor calculations */
> +
> +		/* Start of run-time calculations */
> +		__res = (unsigned int)__m * (unsigned int)__n;
> +		__res >>= 32;
> +		__res += (unsigned int)__m * (__n >> 32);
> +		__t = __res;
> +		__res += (unsigned int)__n * (__m >> 32);
> +		__t = (__res < __t) ? (1ULL << 32) : 0;
> +		__res = (__res >> 32) + __t;
> +		__res += (__m >> 32) * (__n >> 32);
> +		__res /= __p;
> +
> +		/*
> +		 * The reminder can be computed with 32-bit regs

		       remainder

> +		 * only, and gcc is good at that.
> +		 */
> +		{
> +			unsigned int __res0 = __res;
> +			unsigned int __b0 = __b;
> +
> +			__r -= __res0 * __b0;
>  		}
> -		b >>= 1;
> -		d >>= 1;
> -	} while (d);
> +		/* End of run-time calculations */
>  
> -	*n = res;
> -	return rem;
> +		*n = __res;
> +	}
> +	return __r;
>  }
>  
>  EXPORT_SYMBOL(__div64_32);



-- 
~Randy
