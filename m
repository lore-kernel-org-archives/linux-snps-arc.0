From: vgupta@synopsys.com (Vineet Gupta)
Date: Wed, 10 Feb 2016 08:39:43 +0530
Subject: [RFC] perf: fix building for ARCv1
In-Reply-To: <20160205161027.GG28242@kernel.org>
References: <C2D7FE5348E1B147BCA15975FBA23075F44CB023@IN01WEMBXA.internal.synopsys.com>
 <20151019095157.GM3816@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB43D@IN01WEMBXA.internal.synopsys.com>
 <20151020101133.GA17308@twins.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA23075F44CB4BF@IN01WEMBXA.internal.synopsys.com>
 <1446134296.3203.27.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CE67A@IN01WEMBXA.internal.synopsys.com>
 <1454516455.2811.4.camel__10775.5710989752$1454516490$gmane$org@synopsys.com>
 <56B2CFF2.4030503@synopsys.com>
 <HE1PR02MB13872D4A7A43E49B8440AEB5D6D20@HE1PR02MB1387.eurprd02.prod.outlook.com>
 <20160205161027.GG28242@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56BAA9F7.50807@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 05 February 2016 09:40 PM, acme@redhat.com wrote:
> Em Fri, Feb 05, 2016 at 11:18:52AM +0000, Noam Camus escreveu:
>> Well here for EZchip I also see the:
>> undefined reference to `__sync_add_and_fetch_4'
>> undefined reference to `__sync_sub_and_fetch_4'
> 
> Yeah, because there is no: tools/arch/arc/include/asm/atomic.h, can't
> you guys adapt arch/arc/include/asm/atomic.h to use in userspace?

Sure - however we need to support 3 variants: LLSC, !LLSC, EZCHIP

If needed, latter 2 could be done using a new atomic assist syscall

I presume kernel Kconfig items are no go in this header so this diversity
management needs to use toolchain defined macros e.g. __ezchip__


> 
> - Arnaldo
>  
>> This is since at file tools/include/asm/atomic.h we use the generic implementation
>> If for ARC I could use just like x86 my own header file then functions like:
>> atomic_inc()
>> atomic_dec_and_test()
>> Are easy to implement and you may see an example for such atomic methods in my patch set for the new platform.
>>
>> You however wants to use some GCC flag -matomic which I assume somehow will implement the above __sync*.
>> I can't find the implementation but if it uses LLSC then it won't work for me since I am not supporting LLSC.
> 
>> So seem that either I have my own header at kernel or that I need to
>> change the GCC implementation for __sync* to use my atomic
>> instructions.  I am personally tend to the x86 solution and not the
>> generic one since changing GCC will require to have new compiler
>> dependency.
