From: linux@arm.linux.org.uk (Russell King - ARM Linux)
Date: Thu, 29 Oct 2015 13:31:22 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151029133122.GK8644@n2100.arm.linux.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, Oct 29, 2015@01:47:35AM +0300, Alexey Brodkin wrote:
> diff --git a/lib/div64.c b/lib/div64.c
> index 62a698a..3055328 100644
> --- a/lib/div64.c
> +++ b/lib/div64.c
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

Can you explain who __builtin_constant_p(__b) can be anything but false
here?  I can't see that this will ever be true.

This is a function in its own .c file - the compiler will have no
knowledge about the callers of this function scattered throughout the
kernel, and it has to assume that the 'base' argument to this function
is variable.  So, __builtin_constant_p(__b) will always be false, which
means this if () statement will always be true and the else clause will
never be used.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
