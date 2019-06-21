From: namit@vmware.com (Nadav Amit)
Date: Fri, 21 Jun 2019 18:37:52 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <20190621121259.GU3463@hirez.programming.kicks-ass.net>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
 <20190620070120.GU3402@hirez.programming.kicks-ass.net>
 <a0a1aa81-d46e-71db-ff7b-207bc468068d@synopsys.com>
 <20190620212256.GC3436@hirez.programming.kicks-ass.net>
 <20190621120923.GT3463@hirez.programming.kicks-ass.net>
 <20190621121259.GU3463@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <D25EC873-572E-457C-AEB1-DC0C1FAF8E85@vmware.com>
To: linux-snps-arc@lists.infradead.org

> On Jun 21, 2019,@5:12 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> 
> On Fri, Jun 21, 2019@02:09:23PM +0200, Peter Zijlstra wrote:
> 
>> --- /dev/null
>> +++ b/arch/x86/include/asm/jump_label_asm.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_X86_JUMP_LABEL_ASM_H
>> +#define _ASM_X86_JUMP_LABEL_ASM_H
>> +
>> +#include <asm/asm.h>
>> +#include <asm/nops.h>
>> +
>> +#ifdef __ASSEMBLY__
>> +
>> +.macro STATIC_BRANCH_ENTRY l_target:req l_yes:req key:req branch:req
>> +	.pushsection __jump_table, "aw"
>> +	.long		\l_target - ., \l_yes - .
>> +#ifdef __X86_64__
>> +	.quad		(\key - .) + \branch
>> +#else
>> +	.long		(\key - .) + \branch
>> +#endif
>> +	.popsection
>> +.endm
>> +
>> +.macro STATIC_BRANCH_NOP l_yes:req key:req branch:req
>> +.Lstatic_branch_nop_\@:
>> +.iflt 127 - .
> 
> That should've been:
> 
> .if \l_yes - . < 127
> 
> too, I had been playing with various forms to see when it compiles.
> But as soon as a label (either \l_yes or '.' gets used) it barfs.

I think the error makes sense as it creates a ?circular dependency?:
assembly of the code might affect the label address, and this address affect
the assembly.
