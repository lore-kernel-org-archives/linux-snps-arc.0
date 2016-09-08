From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 8 Sep 2016 15:24:10 -0700
Subject: [PATCH] ARCv2: Implement atomic64 based on LLOCKD/SCONDD
 instructions
In-Reply-To: <1473362967-23750-1-git-send-email-vgupta@synopsys.com>
References: <1473362967-23750-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7012c761-a355-d830-22bf-48db96a12452@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/08/2016 12:29 PM, Vineet Gupta wrote:
> One thing I'm not sure of is the lack of explicit memory clobber in
> barrier-less ops e.g. atomic64_add() (BTW same is true for 32-bit
> atomic_add() as well). Per commit 398aa66827 ("ARM: 6212/1: atomic ops:
> add memory constraints to inline asm ") Will fixed ARM code by adding
> appropriate constraint to atomic64_add(). For ARC instead adding memory
> clobber to atomic64_set() does the trick (otherwise self-test is broked)
> This is on ARC we can't possibly use "m" in atomic64_add() since that make gcc
> emit register relative effective addresses which LLOCKD/SCONDD are not
> allowed by ISA

So interestingly my self-test run fine, but I had this oldish version stashed
somewhere which did something liek below and that clearly generates wrong code.

int my_test_atomic(void)
{
    long v0 = 0x33333333;
    long onestwos = 0x11112222;

    atomic_t v = ATOMIC_INIT(v0);
    long long r = v0;
    int ret = 0;

    atomic_set(&v, v0); r = v0;
    atomic_add(onestwos, &v);
    r += onestwos;
    if (v.counter != r) {      /* <------ */
                ret = 3;   /* error */
    }

    return ret;
}

key here is the check - if we access the atomic directly, I get error. If I use
atomic_read() which forces a reload due to volatile, things are hunky dory. So it
seems to me we don't need memory clobber or equivalent in barrier less atomics
except the set. Seems too fragile ?

-Vineet
