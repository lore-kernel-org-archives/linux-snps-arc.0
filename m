From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Mon, 10 Jun 2019 10:04:49 +0530
Subject: [RFC V3] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
In-Reply-To: <20190607201202.GA32656@bombadil.infradead.org>
References: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
 <20190607201202.GA32656@bombadil.infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f1b109a3-ef4c-359c-a124-e219e84a6266@arm.com>
To: linux-snps-arc@lists.infradead.org



On 06/08/2019 01:42 AM, Matthew Wilcox wrote:
> Before:
> 
>> @@ -46,23 +46,6 @@ kmmio_fault(struct pt_regs *regs, unsigned long addr)
>>  	return 0;
>>  }
>>  
>> -static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
>> -{
>> -	if (!kprobes_built_in())
>> -		return 0;
>> -	if (user_mode(regs))
>> -		return 0;
>> -	/*
>> -	 * To be potentially processing a kprobe fault and to be allowed to call
>> -	 * kprobe_running(), we have to be non-preemptible.
>> -	 */
>> -	if (preemptible())
>> -		return 0;
>> -	if (!kprobe_running())
>> -		return 0;
>> -	return kprobe_fault_handler(regs, X86_TRAP_PF);
>> -}
> 
> After:
> 
>> +++ b/include/linux/kprobes.h
>> @@ -458,4 +458,20 @@ static inline bool is_kprobe_optinsn_slot(unsigned long addr)
>>  }
>>  #endif
>>  
>> +static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
>> +					      unsigned int trap)
>> +{
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * To be potentially processing a kprobe fault and to be allowed
>> +	 * to call kprobe_running(), we have to be non-preemptible.
>> +	 */
>> +	if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
>> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))
>> +			ret = 1;
>> +	}
>> +	return ret;
>> +}
> 
> Do you really think this is easier to read?
> 
> Why not just move the x86 version to include/linux/kprobes.h, and replace
> the int with bool?

Will just return bool directly without an additional variable here as suggested
before. But for the conditional statement, I guess the proposed one here is more
compact than the x86 one.

> 
> On Fri, Jun 07, 2019@04:04:15PM +0530, Anshuman Khandual wrote:
>> Very similar definitions for notify_page_fault() are being used by multiple
>> architectures duplicating much of the same code. This attempts to unify all
>> of them into a generic implementation, rename it as kprobe_page_fault() and
>> then move it to a common header.
> 
> I think this description suffers from having been written for v1 of
> this patch.  It describes what you _did_, but it's not what this patch
> currently _is_.
> 
> Why not something like:
> 
> Architectures which support kprobes have very similar boilerplate around
> calling kprobe_fault_handler().  Use a helper function in kprobes.h to
> unify them, based on the x86 code.
> 
> This changes the behaviour for other architectures when preemption
> is enabled.  Previously, they would have disabled preemption while
> calling the kprobe handler.  However, preemption would be disabled
> if this fault was due to a kprobe, so we know the fault was not due
> to a kprobe handler and can simply return failure.  This behaviour was
> introduced in commit a980c0ef9f6d ("x86/kprobes: Refactor kprobes_fault()
> like kprobe_exceptions_notify()")

Will replace commit message with above.

> 
>>  arch/arm/mm/fault.c      | 24 +-----------------------
>>  arch/arm64/mm/fault.c    | 24 +-----------------------
>>  arch/ia64/mm/fault.c     | 24 +-----------------------
>>  arch/powerpc/mm/fault.c  | 23 ++---------------------
>>  arch/s390/mm/fault.c     | 16 +---------------
>>  arch/sh/mm/fault.c       | 18 ++----------------
>>  arch/sparc/mm/fault_64.c | 16 +---------------
>>  arch/x86/mm/fault.c      | 21 ++-------------------
>>  include/linux/kprobes.h  | 16 ++++++++++++++++
> 
> What about arc and mips?

+ Vineet Gupta <vgupta at synopsys.com> 
+ linux-snps-arc at lists.infradead.org

+ James Hogan <jhogan at kernel.org>
+ Paul Burton <paul.burton at mips.com>
+ Ralf Baechle <ralf at linux-mips.org>
+ linux-mips at vger.kernel.org

Both the above architectures dont call kprobe_fault_handler() from the
page fault context (do_page_fault() to be specific). Though it gets called
from mips kprobe_exceptions_notify (DIE_PAGE_FAULT). Am I missing something
here ?
