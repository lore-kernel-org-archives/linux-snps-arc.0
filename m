From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 16 May 2019 11:57:16 -0700
Subject: [PATCH 4/9] ARC: mm: do_page_fault refactor #3: tidyup vma access
 permission code
In-Reply-To: <CY4PR1201MB0120A3C58405DD60FF6B4359A10A0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
 <1557880176-24964-5-git-send-email-vgupta@synopsys.com>
 <1558027448.2682.11.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2517B16@us01wembx1.internal.synopsys.com>
 <CY4PR1201MB0120A3C58405DD60FF6B4359A10A0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e76d2db0-14e9-2c65-947d-a2c1ccc7b832@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/16/19 10:44 AM, Alexey Brodkin wrote:
>> On 5/16/19 10:24 AM, Eugeniy Paltsev wrote:
>>>> +	unsigned int write = 0, exec = 0, mask;
>>> Probably it's better to use 'bool' type for 'write' and 'exec' as we really use them as a boolean
>> variables.
>>
>> Right those are semantics, but the generated code for "bool" is not ideal - given
>> it is inherently a "char" it is promoted first to an int with an additional EXTB
>> which I really dislike.
>> Guess it is more of a style thing.
> 
> In that sense maybe think about re-definition of "bool" type to 32-bit one
> for entire architecture and get that benefit across the entire source tree?

what bool maps to is driven by the ABI and while not explicit in the ARCv2 ABI
doc, I guess it is byte and hence can't be changed just like that.

-Vineet
