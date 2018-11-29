From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 29 Nov 2018 21:16:29 +0000
Subject: [PATCH v2] ARC: io.h: Implement reads{x}()/writes{x}()
References: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146419EBB@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/29/18 6:29 AM, Jose Abreu wrote:
> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
> This can lead to misfunction of some drivers as generic functions do a
> plain dereference of a pointer that can be unaligned.
>
> Let's use {get/put}_unaligned() helper instead of plain dereference of
> pointer in order to fix this. 

Please add a few lines of comment about what the accessor does in general - maybe
copy-paste from generic file if needed.

> +#define __raw_readsx(t,f) \
> +static inline void __raw_reads##f(const volatile void __iomem *addr, \
> +				  void *buffer, unsigned int count) \
> +{ \
> +	if (count) { \

Could you reduce 1 level of indentation by checking for !count and return.

> +		const unsigned long bptr = (unsigned long)buffer; \
> +		u##t *buf = buffer; \
> +\
> +		do { \
> +			u##t x = __raw_read##f(addr); \
> +\
> +			/* Some ARC CPU's don't support unaligned accesses */ \
> +			if (bptr % ((t) / 8)) { \

This math is loop invariant so instead of using bptr here, have something like
is_aligned = (unsigned long)buffer % ((t) / 8)) outside the loop. A reasonable
compiler already does that but this one is easier on eyes.

> +				put_unaligned(x, buf++); \
> +			} else { \
> +				*buf++ = x; \
> +			} \
> +		} while (--count); \
> +	} \
> +}

Per your later post the compiler is doing the good job here, but sometimes it
might not. Adding a condition inside a loop is not a good idea in general. Better
to code the 2 loops seperately.

> +
> +#define __raw_readsb __raw_readsb
> +__raw_readsx(8, b);

The trailing ; is not needed

> +#define __raw_readsw __raw_readsw
> +__raw_readsx(16, w);
> +#define __raw_readsl __raw_readsl
> +__raw_readsx(32, l);

> +
>  #define __raw_writeb __raw_writeb
>  static inline void __raw_writeb(u8 b, volatile void __iomem *addr)
>  {
> @@ -126,6 +155,32 @@ static inline void __raw_writel(u32 w, volatile void __iomem *addr)
>  
>  }
>  
> +#define __raw_writesx(t,f) \
> +static inline void __raw_writes##f(volatile void __iomem *addr, \
> +				   const void *buffer, unsigned int count) \
> +{ \
> +	if (count) { \
> +		const unsigned long bptr = (unsigned long)buffer; \
> +		const u##t *buf = buffer; \
> +\
> +		do { \
> +			/* Some ARC CPU's don't support unaligned accesses */ \
> +			if (bptr % ((t) / 8)) { \
> +				__raw_write##f(get_unaligned(buf++), addr); \
> +			} else { \
> +				__raw_write##f(*buf++, addr); \
> +			} \
> +		} while (--count); \
> +	} \
> +}

Same as for read !

> +
> +#define __raw_writesb __raw_writesb
> +__raw_writesx(8, b);
> +#define __raw_writesw __raw_writesw
> +__raw_writesx(16, w);
> +#define __raw_writesl __raw_writesl
> +__raw_writesx(32, l);

Ditto !
