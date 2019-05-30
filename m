From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 30 May 2019 10:58:08 -0700
Subject: extraneous generated EXTB (was Re: [PATCH 4/9] ARC: mm: do_page_fault
 refactor #3: tidyup vma access permission code)
In-Reply-To: <1558131743.2682.33.camel@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
 <1557880176-24964-5-git-send-email-vgupta@synopsys.com>
 <1558027448.2682.11.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2517B16@us01wembx1.internal.synopsys.com>
 <1558131743.2682.33.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7923928f-1f4e-3fa8-3d38-40fcb2074b4a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/17/19 3:23 PM, Eugeniy Paltsev wrote:
> Hmmm,
> 
> so load the bool variable from memory is converted to such asm code:
> 
> ----------------->8------------------- 
> ldb	r2,[some_bool_address]
> extb_s	r2,r2
> ----------------->8-------------------
> 
> Could you please describe that the magic is going on there?
> 
> This extb_s instruction looks completely useless here, according on the LDB description from PRM:
> ----------------->8-------------------
> LD LDH LDW LDB LDD:
> The size of the requested data is specified by the data size field <.zz> and by default, data is zero
> extended from the most-significant bit of the data to the most-significant bit of the destination
> register.
> ----------------->8-------------------
> 
> Am I missing something?


@Claudiu is that a target specific optimization/tuning in ARC backend ?


> 
> On Thu, 2019-05-16@17:37 +0000, Vineet Gupta wrote:
>> On 5/16/19 10:24 AM, Eugeniy Paltsev wrote:
>>>> +    unsigned int write = 0, exec = 0, mask;
>>>
>>> Probably it's better to use 'bool' type for 'write' and 'exec' as we really use them as a boolean variables.
>>
>> Right those are semantics, but the generated code for "bool" is not ideal - given
>> it is inherently a "char" it is promoted first to an int with an additional EXTB
>> which I really dislike.
>> Guess it is more of a style thing.
>>
>> -Vineet
