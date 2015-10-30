From: mans@mansr.com (=?iso-8859-1?Q?M=E5ns_Rullg=E5rd?=)
Date: Fri, 30 Oct 2015 12:40:19 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr> (Nicolas Pitre's
 message of "Thu, 29 Oct 2015 21:26:25 -0400 (EDT)")
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
To: linux-snps-arc@lists.infradead.org

Nicolas Pitre <nicolas.pitre at linaro.org> writes:

> On Wed, 28 Oct 2015, Nicolas Pitre wrote:
>
>> On Thu, 29 Oct 2015, Alexey Brodkin wrote:
>> 
>> > Fortunately we already have much better __div64_32() for 32-bit ARM.
>> > There in case of division by constant preprocessor calculates so-called
>> > "magic number" which is later used in multiplications instead of divisions.
>> 
>> It's not magic, it is science.  :-)
>> 
>> > It's really nice and very optimal but obviously works only for ARM
>> > because ARM assembly is involved.
>> > 
>> > Now why don't we extend the same approach to all other 32-bit arches
>> > with multiplication part implemented in pure C. With good compiler
>> > resulting assembly will be quite close to manually written assembly.
>
> Well... not as close at least on ARM.  Maybe 2x to 3x more costly than 
> the one with assembly.  Still better than 100x or so without this 
> optimization.

That's more or less what I found on MIPS too.

>> > But there's at least 1 problem which I don't know how to solve.
>> > Preprocessor magic only happens if __div64_32() is inlined (that's
>> > obvious - preprocessor has to know if divider is constant or not).
>> > 
>> > But __div64_32() is already marked as weak function (which in its turn
>> > is required to allow some architectures to provide its own optimal
>> > implementations). I.e. addition of "inline" for __div64_32() is not an
>> > option.
>> 
>> You can't inline __div64_32().  It should remain as is and used only for 
>> the slow path.
>> 
>> For the constant based optimization to work, you need to modify do_div() 
>> in include/asm-generic/div64.h directly.
>
> OK... I was intrigued, so I adapted my ARM code to the generic case, 
> including the overflow avoidance optimizations.  Please have look and 
> tell me how this works for you.
>
> If this patch is accepted upstream, then it could be possible to 
> abstract only the actual multiplication part with some architecture 
> specific assembly.

Good idea.

-- 
M?ns Rullg?rd
mans at mansr.com
