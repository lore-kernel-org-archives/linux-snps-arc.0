From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 14 Aug 2018 14:35:02 +0000
Subject: [PATCH] ARC: atomic64: fix atomic64_add_unless function
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B08CB78@us01wembx1.internal.synopsys.com>
References: <20180811160856.24936-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B08CB78@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1534257301.3962.79.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2018-08-14@13:42 +0000, Vineet Gupta wrote:
> On 08/11/2018 09:09 AM, Eugeniy Paltsev wrote:
> > Current implementation of 'atomic64_add_unless' function
> > (and hence 'atomic64_inc_not_zero') return incorrect value
> > if lover 32 bits of compared 64-bit number are equal and
> > higher 32 bits aren't.
> > 
> > For in following example atomic64_add_unless must return '1'
> > but it actually returns '0':
> > --------->8---------
> > atomic64_t val = ATOMIC64_INIT(0x4444000000000000LL);
> > int ret = atomic64_add_unless(&val, 1LL, 0LL)
> > --------->8---------
> > 
> > This happens because we write '0' to returned variable regardless
> > of higher 32 bits comparison result.
> > 
> > So fix it.
> > 
> > NOTE:
> >  this change was tested with atomic64_test.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> LGTM. Curious, was this from code review or did u actually run into this ?

I've accidentally run into this when I played with atomic64_* functions
trying to implement hack to automatically align LL64/SC64 data for atomic 64-bit
operations on ARC to avoid problems like:
https://www.mail-archive.com/linux-snps-arc at lists.infradead.org/msg03791.html

> Thx,
> -Vineet
> 
> > ---
> >  arch/arc/include/asm/atomic.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
> > index 11859287c52a..e840cb1763b2 100644
> > --- a/arch/arc/include/asm/atomic.h
> > +++ b/arch/arc/include/asm/atomic.h
> > @@ -578,11 +578,11 @@ static inline int atomic64_add_unless(atomic64_t *v, long long a, long long u)
> >  
> >  	__asm__ __volatile__(
> >  	"1:	llockd  %0, [%2]	\n"
> > -	"	mov	%1, 1		\n"
> >  	"	brne	%L0, %L4, 2f	# continue to add since v != u \n"
> >  	"	breq.d	%H0, %H4, 3f	# return since v == u \n"
> >  	"	mov	%1, 0		\n"
> >  	"2:				\n"
> > +	"	mov	%1, 1		\n"
> >  	"	add.f   %L0, %L0, %L3	\n"
> >  	"	adc     %H0, %H0, %H3	\n"
> >  	"	scondd  %0, [%2]	\n"
> 
> 
-- 
 Eugeniy Paltsev
