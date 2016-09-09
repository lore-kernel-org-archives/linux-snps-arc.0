From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 9 Sep 2016 09:40:44 +0200
Subject: [PATCH] ARCv2: Implement atomic64 based on LLOCKD/SCONDD
 instructions
In-Reply-To: <7012c761-a355-d830-22bf-48db96a12452@synopsys.com>
References: <1473362967-23750-1-git-send-email-vgupta@synopsys.com>
 <7012c761-a355-d830-22bf-48db96a12452@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160909074044.GC10153@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, Sep 08, 2016@03:24:10PM -0700, Vineet Gupta wrote:
> On 09/08/2016 12:29 PM, Vineet Gupta wrote:
> > One thing I'm not sure of is the lack of explicit memory clobber in
> > barrier-less ops e.g. atomic64_add() (BTW same is true for 32-bit
> > atomic_add() as well). Per commit 398aa66827 ("ARM: 6212/1: atomic ops:
> > add memory constraints to inline asm ") Will fixed ARM code by adding
> > appropriate constraint to atomic64_add(). For ARC instead adding memory
> > clobber to atomic64_set() does the trick (otherwise self-test is broked)
> > This is on ARC we can't possibly use "m" in atomic64_add() since that make gcc
> > emit register relative effective addresses which LLOCKD/SCONDD are not
> > allowed by ISA
> 
> So interestingly my self-test run fine, but I had this oldish version stashed
> somewhere which did something liek below and that clearly generates wrong code.
> 
> int my_test_atomic(void)
> {
>     long v0 = 0x33333333;
>     long onestwos = 0x11112222;
> 
>     atomic_t v = ATOMIC_INIT(v0);
>     long long r = v0;
>     int ret = 0;
> 
>     atomic_set(&v, v0); r = v0;
>     atomic_add(onestwos, &v);
>     r += onestwos;
>     if (v.counter != r) {      /* <------ */
>                 ret = 3;   /* error */
>     }
> 
>     return ret;
> }
> 
> key here is the check - if we access the atomic directly, I get error. If I use
> atomic_read() which forces a reload due to volatile, things are hunky dory. So it
> seems to me we don't need memory clobber or equivalent in barrier less atomics
> except the set. Seems too fragile ?

Accessing atomic_t::counter without the accessors is undefined behaviour
and you pretty much get to keep whatever pieces, although volatile
accesses generally work (except when it doesn't, see blackfin SMP for
example).

atomic_set() should be at least WRITE_ONCE().
atomic_read() should be at least READ_ONCE().

atomic_$op(), atomic_fetch_$op_relaxed() and atomic_$op_return_relaxed()
need not imply any sort of barrier, compiler or otherwise.

atomic_fetch_$op() and atomic_$op_return(), which imply memory ordering,
also very much imply a compiler barrier, since all memory barriers do.
