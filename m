From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 18 Aug 2016 23:11:09 -0700
Subject: [arc] get_user() not clearing destination on failure
In-Reply-To: <20160818030045.GN2356@ZenIV.linux.org.uk>
References: <20160818030045.GN2356@ZenIV.linux.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <41c1db61-8b1c-fbc8-f7aa-f1a4504913f9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/17/2016 08:00 PM, Al Viro wrote:
> First of all, my apologies if I'd managed to misread the ARC assembler
> in uaccess.h.  AFAICS, neither __arc_get_user_one() nor __arc_get_user_one_64()
> end up zeroing the destination upon exception.  Your __get_user_fn() is
> ({                                                              \
>         long __ret = 0; /* success by default */        \
>         switch (sz) {                                           \
>         case 1: __arc_get_user_one(*(k), u, "ldb", __ret); break;       \
>         case 2: __arc_get_user_one(*(k), u, "ldw", __ret); break;       \
>         case 4: __arc_get_user_one(*(k), u, "ld", __ret);  break;       \
>         case 8: __arc_get_user_one_64(*(k), u, __ret);     break;       \
>         }                                                       \
>         __ret;                                                  \
> })
> so it doesn't do that on its own either.  Neither does __get_user() (from
> asm-generic/uaccess.h) nor get_user() (ditto), so unless I've missed something
> subtle about your exception handling, after
> 	char c = 0;
> 	int y = get_user(c, unmapped_address);
> you will get -EFAULT in y and random junk in c.  We get to __get_user(c, ...),
> which turns into
> 	int __gu_err = -EFAULT;
> 	unsigned char __x;	// uninitialized
> 	__gu_err = __get_user_fn(1, unmapped_address, &__x);
> 	c = (char) __x;
> 	y = __gu_err;
> i.e.
> 	int __gu_err = -EFAULT;
> 	unsigned char __x;
> 	long __ret = 0;
>         __arc_get_user_one(*(&__x), unmapped_address, "ldb", __ret);
> 	__gu_err = __ret;
> 	c = (char) __x;
> 	y = __gu_err;
> and AFAICS your assembler in __arc_get_user_one() will boil down to something
> along the lines of
> 	r2 = unmapped_address;
> 1:	r1 = *(unsigned char *)r2;
> 2:
> 	__x = r1;
>
> fixup(1):
> 	__ret = -EFAULT;
> 	goto 2;
> with nothing to clear r1 on the fixup path.
>
> *IF* the above is correct 

It is - you got it all right

> (and I'm really unfamiliar with the architecture
> in question), you have a problem.  get_user() and __get_user() ought to
> clear the destination even in case of EFAULT. 

Just curious - why is that. The typical usage paradigm is check for return value
and if 0 only then proceed to use the actual value.

Also for discussion sake, will eliminating the intermediate __x be helpful - so it
would use the actual variable defined in caller of get_user() so if it is init
properly, the value would be "retained" for -EFAULT. Anyways all of this is just
for understanding better.

>  There definitely is a bug
> in asm-generic get_user() (it doesn't clear destination in case of access_ok()
> failure), but that's not ARC-specific.  I won't try to slap together a fix
> (no idea which forms of "zero that register" are better, for starters), but
> something like mov %1,0 in the fixup part might be needed.  

I'll send that over tomorrow - after a bit of testing.

> And I've really
> no idea whatsoever about the syntax in __arc_get_user_one_64() - it needs to
> clear the entire 64bit value there.

Yeah the %R asm modifier seems to be undocumented in gcc manual - and it has been
there forever. But I checked that it correctly generates a register pair for the
64-bit word.

-Vineet
