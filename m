From: JBeulich@suse.com (Jan Beulich)
Date: Mon, 23 Nov 2015 06:42:34 -0700
Subject: dwarf unwinder question
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D2E16@IN01WEMBXA.internal.synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F44D2DF8@IN01WEMBXA.internal.synopsys.com>
 <56531F8502000078000B7D52@prv-mh.provo.novell.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D2E16@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <565325DA02000078000B7D89@prv-mh.provo.novell.com>
To: linux-snps-arc@lists.infradead.org

>>> On 23.11.15@14:27, <Vineet.Gupta1@synopsys.com> wrote:
> On Monday 23 November 2015 06:45 PM, Jan Beulich wrote:
>>>>> On 23.11.15@14:03, <Vineet.Gupta1@synopsys.com> wrote:
>>> I was wondering if u could answer a question in that respect: 
>>> arch/arc/kernel/unwind.c
>>>
>>> If the binary search for a PC fails, it resorts to linear search, which for 
>>> our
>>> case was taking 3 million cycles (vs. normal ~2000).
>>> Do you remember why this linear search step was needed - after all the binary
>>> lookup table is created out of early parsing of the same data.
>>>
>>> The fail scenario is for hand asm symbols lacking gcc generated dwarf info 
>>> and we
>>> don't have yet the CFI pseudo ops support in assembler.
>>> I can fix memset etc to have empty dwarf info, still unwinder needs this 
>>> fixing.
>>>
>>> In case of perf, an overflow interrupt in hand optimized memset leads into 
>>> the
>>> unwinder slow path linear search which causes RCU stalls and such.
>>> I'm going to remove it but was wondering if u could provide some historic 
>>> background.
>> Iirc there was no binary lookup at all originally. When it got added,
>> it seemed odd to remove the linear lookup altogether (want to keep
>> it at least for the case where the binary lookup table couldn't be
>> built for whatever reason), and code structure seemed most
>> reasonable to simply do one after the other instead of just either.
>> I'm pretty sure the linear lookup could be skipped if you're sure the
>> binary lookup table is correct and complete.
> 
> Thx for quick reply. I'll remove the linear search as part of many other 
> tweaks to
> speed it up - we can elide a lot of general dwarf checks / rechecks - given 
> that
> it is used only for kernel unwinding (not user space).

Don't tell Linus if you're removing any checks...

Jan
