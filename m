From: David.Laight@ACULAB.COM (David Laight)
Date: Thu, 29 Nov 2018 14:38:59 +0000
Subject: [PATCH v2] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
References: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ff1e11923e92405d883474d715008c0a@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Jose Abreu
> Sent: 29 November 2018 14:29
> 
> Some ARC CPU's do not support unaligned loads/stores. Currently, generic
> implementation of reads{b/w/l}()/writes{b/w/l}() is being used with ARC.
> This can lead to misfunction of some drivers as generic functions do a
> plain dereference of a pointer that can be unaligned.
> 
> Let's use {get/put}_unaligned() helper instead of plain dereference of
> pointer in order to fix this.
...
> +#define __raw_readsx(t,f) \
> +static inline void __raw_reads##f(const volatile void __iomem *addr, \
> +				  void *buffer, unsigned int count) \
> +{ \
> +	if (count) { \
> +		const unsigned long bptr = (unsigned long)buffer; \
> +		u##t *buf = buffer; \
> +\
> +		do { \
> +			u##t x = __raw_read##f(addr); \
> +\
> +			/* Some ARC CPU's don't support unaligned accesses */ \
> +			if (bptr % ((t) / 8)) { \
> +				put_unaligned(x, buf++); \
> +			} else { \
> +				*buf++ = x; \
> +			} \
> +		} while (--count); \
> +	} \
> +}

Does the compiler move the alignment test outside the loop?
You really want two copies of the loop body.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
