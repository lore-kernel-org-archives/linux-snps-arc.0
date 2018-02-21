From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 21 Feb 2018 13:23:52 -0800
Subject: [PATCH] bug.h: Work around GCC PR82365 in BUG()
In-Reply-To: <e35cd0ea-b1b1-b8a1-6d01-6a17da091407@synopsys.com>
References: <20171219114112.939391-1-arnd@arndb.de>
 <8e42a1de-f619-7a4e-6d58-f90f53f5f38f@synopsys.com>
 <CAK8P3a2fXQHCN7gqNL9j7AeZqy7NXAMW1bqyFJs3G1M_M4BQ4A@mail.gmail.com>
 <f31caa9b-89f0-4168-04bf-14a98595865e@synopsys.com>
 <CAK8P3a25RgC0qPCrGfutSnLHr77NqK74dW2g0m7fcMnm5Ou8yg@mail.gmail.com>
 <27bfdc23-1774-cf07-dab4-ab253a41d2f7@synopsys.com>
 <CAK8P3a0UKLJkmU_zVDyODMZR0G47i=zscNpgGZO4LryvmdUt6Q@mail.gmail.com>
 <861992dd-a28d-0f8c-572f-4194d15238df@synopsys.com>
 <20180207160138.0705eeca67d8cc4d6309381c@linux-foundation.org>
 <e35cd0ea-b1b1-b8a1-6d01-6a17da091407@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2d57e8c6-069c-c4b7-0eb2-6abb8fa2181f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/07/2018 05:20 PM, Vineet Gupta wrote:
>
>> Didn't do ;)
>>
>> Is Arnd's patch good to merge or do we need a fixup?
>>
>>
>> From: Arnd Bergmann <arnd at arndb.de>
>> Subject: bug.h: work around GCC PR82365 in BUG()
>>
>> Looking at functions with large stack frames across all architectures led
>> me discovering that BUG() suffers from the same problem as
>> fortify_panic(), which I've added a workaround for already.? In short,
>> variables that go out of scope by calling a noreturn function or
>> __builtin_unreachable() keep using stack space in functions afterwards.
>>
>> A workaround that was identified is to insert an empty assembler statement
>> just before calling the function that doesn't return.? I'm adding a macro
>> "barrier_before_unreachable()" to document this, and insert calls to that
>> in all instances of BUG() that currently suffer from this problem.
>>
..
..

>> ---
>>
>> ? arch/arc/include/asm/bug.h??????????? |??? 3 ++-
>> ? arch/cris/include/arch-v10/arch/bug.h |?? 11 +++++++++--
>> ? arch/ia64/include/asm/bug.h?????????? |??? 6 +++++-
>> ? arch/m68k/include/asm/bug.h?????????? |??? 3 +++
>> ? arch/sparc/include/asm/bug.h????????? |??? 6 +++++-
>> ? include/asm-generic/bug.h???????????? |??? 1 +
>> ? include/linux/compiler-gcc.h????????? |?? 15 ++++++++++++++-
>> ? include/linux/compiler.h????????????? |??? 5 +++++
>> ? 8 files changed, 44 insertions(+), 6 deletions(-)
>>
>> diff -puN arch/arc/include/asm/bug.h~bugh-work-around-gcc-pr82365-in-bug 
>> arch/arc/include/asm/bug.h
>> --- a/arch/arc/include/asm/bug.h~bugh-work-around-gcc-pr82365-in-bug
>> +++ a/arch/arc/include/asm/bug.h
>> @@ -23,7 +23,8 @@ void die(const char *str, struct pt_regs
>> ? ? #define BUG()??? do {??????????????????????????????? \
>> ????? pr_warn("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
>> -??? dump_stack();??????????????????????????????? \
>> +??? barrier_before_unreachable();??????????????????????? \
>> +??? __builtin_trap();??????????????????????????? \
>> ? } while (0)
>
> For ARC, it is double win.
>
> 1. Fixes 3 -Wreturn-type warnings
>
> | ../net/core/ethtool.c:311:1: warning: control reaches end of non-void function 
> [-Wreturn-type]
> | ../kernel/sched/core.c:3246:1: warning: control reaches end of non-void 
> function [-Wreturn-type]
> | ../include/linux/sunrpc/svc_xprt.h:180:1: warning: control reaches end of 
> non-void function [-Wreturn-type]
>
> 2. bloat-o-meter reports code size improvements as gcc elides the generated code 
> for stack return.
>
>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>?? # for arch/arc
> Tested-by: Vineet Gupta <vgupta at synopsys.com>?? # for arch/arc

Ping ?
