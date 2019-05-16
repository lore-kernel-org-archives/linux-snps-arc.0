From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 16 May 2019 17:44:44 +0000
Subject: [PATCH 4/9] ARC: mm: do_page_fault refactor #3: tidyup vma access
 permission code
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A2517B16@us01wembx1.internal.synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
 <1557880176-24964-5-git-send-email-vgupta@synopsys.com>
 <1558027448.2682.11.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2517B16@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120A3C58405DD60FF6B4359A10A0@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta <vgupta at synopsys.com>
> Sent: Thursday, May 16, 2019 8:38 PM
> To: Eugeniy Paltsev <paltsev at synopsys.com>
> Cc: paltsev at snyopsys.com; linux-kernel at vger.kernel.org; Alexey Brodkin <abrodkin at synopsys.com>; linux-
> snps-arc at lists.infradead.org
> Subject: Re: [PATCH 4/9] ARC: mm: do_page_fault refactor #3: tidyup vma access permission code
> 
> On 5/16/19 10:24 AM, Eugeniy Paltsev wrote:
> >> +	unsigned int write = 0, exec = 0, mask;
> > Probably it's better to use 'bool' type for 'write' and 'exec' as we really use them as a boolean
> variables.
> 
> Right those are semantics, but the generated code for "bool" is not ideal - given
> it is inherently a "char" it is promoted first to an int with an additional EXTB
> which I really dislike.
> Guess it is more of a style thing.

In that sense maybe think about re-definition of "bool" type to 32-bit one
for entire architecture and get that benefit across the entire source tree?

-Alexey
