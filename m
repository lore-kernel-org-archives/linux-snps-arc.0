From: mpe@ellerman.id.au (Michael Ellerman)
Date: Wed, 19 Oct 2016 22:50:40 +1100
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
 <5541266.ySlPfDOezF@wuerfel>
 <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87inso4kxb.fsf@concordia.ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

Vineet Gupta <Vineet.Gupta1 at synopsys.com> writes:
> On 10/17/2016 02:02 PM, Arnd Bergmann wrote:
>> On Monday, October 17, 2016 9:59:24 AM CEST Vineet Gupta wrote:
>>> On 10/17/2016 12:34 AM, Geert Uytterhoeven wrote:
>>>>> 48 error regressions:
>>>>>>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r0]':  => 476
>>>>>>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r13]':  => 475
>>>
>>> [snip...]
>>>
>>>>>>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r8]':  => 516
>>>>>>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r6,[r3]':  => 478
>>>> arcv2/axs103_smp_defconfig
>
> @Michael can I bother you to upgrade the tools or is this absolutely must for you.

Happy to, just short on time.

I tried building a new toolchain with buildroot, using the instructions
from last time, but the resulting toolchain doesn't relocate, ie. it has
hard-coded paths in it. Any ideas?

cheers
