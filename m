From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 30 May 2019 19:16:36 +0000
Subject: single copy atomicity for double load/stores on 32-bit systems
References: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
 <20190530185358.GG28207@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2520D9C@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/30/19 11:55 AM, Paul E. McKenney wrote:
>
>> I'm not sure how to interpret "natural alignment" for the case of double
>> load/stores on 32-bit systems where the hardware and ABI allow for 4 byte
>> alignment (ARCv2 LDD/STD, ARM LDRD/STRD ....)
>>
>> I presume (and the question) that lkmm doesn't expect such 8 byte load/stores to
>> be atomic unless 8-byte aligned
> I would not expect 8-byte accesses to be atomic on 32-bit systems unless
> some special instruction was in use.  But that usually means special
> intrinsics or assembly code.

Thx for confirming.

In cases where we *do* expect the atomicity, it seems there's some existing type
checking but isn't water tight.
e.g.

#define __smp_load_acquire(p)                        \
({                                    \
    typeof(*p) ___p1 = READ_ONCE(*p);                \
    compiletime_assert_atomic_type(*p);                \
    __smp_mb();                            \
    ___p1;                                \
})

#define compiletime_assert_atomic_type(t)                \
    compiletime_assert(__native_word(t),                \
        "Need native word sized stores/loads for atomicity.")

#define __native_word(t) \
    (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
     sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))


So it won't catch the usage of 4 byte aligned long long which gcc targets to
single double load instruction.

Thx,
-Vineet
