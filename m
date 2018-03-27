From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Mar 2018 11:24:51 -0700
Subject: dma-mapping: clearing GFP_ZERO flag caused crashes of Ethernet on
 arc/hsdk board.
In-Reply-To: <CAHp75VeZSsdR1=ZhOM6jseYCP3m0GyE=8EjJUxWosze9BBw9rQ@mail.gmail.com>
References: <1522170774.2593.9.camel@synopsys.com>
 <CAHp75VeZSsdR1=ZhOM6jseYCP3m0GyE=8EjJUxWosze9BBw9rQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a4bc637f-9464-c585-c6d2-663e2e38f18f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Christoph, Andy

On 03/27/2018 11:11 AM, Andy Shevchenko wrote:
> On Tue, Mar 27, 2018 at 8:12 PM, Evgeniy Didin
> <Evgeniy.Didin@synopsys.com> wrote:
>> Hello,
>>
>> After commit  57bf5a8963f8 ("dma-mapping: clear harmful GFP_* flags in common code")  we noticed problems with Ethernet controller on one of our platforms (namely ARC HSDK).
>> I
>> n particular we see that removal of __GFP_ZERO flag in function dma_alloc_attrs() was the culprit because in our implementation of arc_dma_alloc() we only allocate zeroed pages if
>> that flag is explicitly set by the caller. Now with unconditional removal of that flag in dma_alloc_attrs() we allocate non-zeroed pages and that seem to cause problems.
>>
>> From
>> mentioned commit message I may conclude that architectural code is supposed to always allocate zeroed pages but I cannot find any requirement of that in kernel's documentation.
>> Coul
>> d you please point me to that requirement if that exists at all, then we'll implement a fix in our arch code like that:

[snip]

> Another question why caller can't ask for zero pages explicitly?

Question to whom ? The caller can ask for it - but the problem here is generic dma 
API code is clearing out GFP_ZERO and expecting arch code to memst unconditionally 
- is that expected of arch code - and is documented ?

That is broken to begin with - arch dma_alloc* simply passes thru gfp flags to 
page allocator and doesn't muck around with them. We could in theory but doesn't 
seem like the right thing to do IMO.

-Vineet
