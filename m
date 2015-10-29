From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 29 Oct 2015 14:32:23 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <20151029133122.GK8644@n2100.arm.linux.org.uk>
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <20151029133122.GK8644@n2100.arm.linux.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446129143.3203.19.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Russel,

On Thu, 2015-10-29@13:31 +0000, Russell King - ARM Linux wrote:
> On Thu, Oct 29, 2015@01:47:35AM +0300, Alexey Brodkin wrote:
> > diff --git a/lib/div64.c b/lib/div64.c
> > index 62a698a..3055328 100644
> > --- a/lib/div64.c
> > +++ b/lib/div64.c
> > +/*
> > + * If the divisor happens to be constant, we determine the appropriate
> > + * inverse at compile time to turn the division into a few inline
> > + * multiplications instead which is much faster.
> > + */
> >  uint32_t __attribute__((weak)) __div64_32(uint64_t *n, uint32_t base)
> >  {
> > -	uint64_t rem = *n;
> > -	uint64_t b = base;
> > -	uint64_t res, d = 1;
> > -	uint32_t high = rem >> 32;
> > -
> > -	/* Reduce the thing a bit first */
> > -	res = 0;
> > -	if (high >= base) {
> > -		high /= base;
> > -		res = (uint64_t) high << 32;
> > -		rem -= (uint64_t) (high*base) << 32;
> > -	}
> > +	unsigned int __r, __b = base;
> >  
> > -	while ((int64_t)b > 0 && b < rem) {
> > -		b = b+b;
> > -		d = d+d;
> > -	}
> > +	if (!__builtin_constant_p(__b) || __b == 0) {
> 
> Can you explain who __builtin_constant_p(__b) can be anything but false
> here?  I can't see that this will ever be true.
> 
> This is a function in its own .c file - the compiler will have no
> knowledge about the callers of this function scattered throughout the
> kernel, and it has to assume that the 'base' argument to this function
> is variable.  So, __builtin_constant_p(__b) will always be false, which
> means this if () statement will always be true and the else clause will
> never be used.

Essentially constant propagation will only happen if __div64_32() is inlined.
For that we need to add "inline" specifier to __div64_32(), but that in its
turn will prevent use of arch-specific more optimal __div64_32() implementation.

And that was my main question how to implement this properly: have better generic
do_div() or __div64_32() as its heavy lifting part and still keep an ability for
some architectures to use their own implementations.

-Alexey
