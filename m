From: viro@ZenIV.linux.org.uk (Al Viro)
Date: Fri, 19 Aug 2016 18:06:42 +0100
Subject: [arc] get_user() not clearing destination on failure
In-Reply-To: <41c1db61-8b1c-fbc8-f7aa-f1a4504913f9@synopsys.com>
References: <20160818030045.GN2356@ZenIV.linux.org.uk>
 <41c1db61-8b1c-fbc8-f7aa-f1a4504913f9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160819170641.GQ2356@ZenIV.linux.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, Aug 18, 2016@11:11:09PM -0700, Vineet Gupta wrote:
> On 08/17/2016 08:00 PM, Al Viro wrote:

> Just curious - why is that. The typical usage paradigm is check for return value
> and if 0 only then proceed to use the actual value.
> 
> Also for discussion sake, will eliminating the intermediate __x be helpful - so it
> would use the actual variable defined in caller of get_user() so if it is init
> properly, the value would be "retained" for -EFAULT. Anyways all of this is just
> for understanding better.

The effect of __get_user(v, p) should mirror that of v = *p had p been a kernel
pointer.  Including the sign expansion/truncation/etc.

That's what those casts and assignments are about, and unless you want to
play with doing usual arithmetical conversion in your assembler bits, it
has to stay in C.  Sure, we could have __get_user(v, p) use v instead of
(in your case) __x and do v = (__typeof(*p))v; to trigger the conversions,
but... that's where the second problem bites: __get_user() has to be a macro,
and __get_user(a[i++], p) would obviously break with that approach.

So there's no realistic way to get rid of that intermediate - not without
a massive PITA with folding conversions into asm part and playing with
__builtin_choose_expr/__builtin_types_compatible_p, which is going to be
both painful and very easy to get wrong.

As for checking for error and discarding the results if it has happened...
not always possible or reasonable.  If you are using __get_user() in the
first place, you are likely to be on a fairly hot path (otherwise the
normal get_user() would've worked just as well).  And having explicit test
and branch after each of those can be unpleasant enough.  Which means that
you do something like a series of err |= __get_user(...); and check err
once in the end (or have something like __get_user_err(..., err) or
__get_user_ex() as x86 does, etc.).  Which means that by the time you get
to "OK, we sod off now" path, you don't know which of __get_user() has
failed.  If any of the destinations are not immediately destroyed, you
get a fun questions along the lines of "which ones do I clean?", and even
simpler "how do I make sure that none of them is missed by an accident?"

The same goes for get_user(), except that instead of "we use it on hot paths"
we have "it's used by arseloads of ioctls in arseloads of drivers, with
general code quality being what one would expect"...
