From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 5 Nov 2015 03:13:49 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
 <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1510301113530.630@knanqh.ubzr>
 <1446220442.4394.42.camel@synopsys.com>
 <alpine.LFD.2.20.1510301253140.630@knanqh.ubzr>
 <yw1xy4ekb68f.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1511041835380.630@knanqh.ubzr>
 <alpine.LFD.2.20.1511041847280.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D0813@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 05 November 2015 05:18 AM, Nicolas Pitre wrote:
> On Wed, 4 Nov 2015, Nicolas Pitre wrote:
>
>> On Fri, 30 Oct 2015, M?ns Rullg?rd wrote:
>>
>>> Nicolas Pitre <nicolas.pitre at linaro.org> writes:
>>>
>>>> I'm going to do it anyway given that I already have it for ARM.  It'll 
>>>> be opt-in, so if your arch doesn't provide it then the current C 
>>>> implementation will be used by default.
>>> Great.  I'll try it out on MIPS once you've posted the patch.
>> You should have seen the patches by now.
>>
>> I've put them along with a bunch of do_div() usage fixes here:
>>
>>   http://git.linaro.org/people/nicolas.pitre/linux.git
> More precisely:
>
>   http://git.linaro.org/people/nicolas.pitre/linux.git div64

Hi Nico,

While we are current on the topic I was wondering about another optimization in
this area.
The slowpath __div64_32() generates both quotient and remainder. The more general
use case in kernel only cares about quotient.

git grep "\sdo_div(" |  wc -l
841
git grep "=\sdo_div(" |  wc -l
116

Is it possible to optimize the code, if remainder was *not* needed explicitly. I
understand that the hand divide will still need some sort of running tally of
remainder but can the code be any better in this case. That way we can introduce
another API do_div_norem() and start proliferating it for the cases where
remainder is not used.

Thx,
-Vineet
