From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Jun 2019 23:55:41 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 6/19/19 1:12 AM, Peter Zijlstra wrote:
> On Tue, Jun 18, 2019@04:16:20PM +0000, Vineet Gupta wrote:
>
>>> +/*
>>> + * To make atomic update of patched instruction available we need to guarantee
>>> + * that this instruction doesn't cross L1 cache line boundary.
>>> + *
> Oh urgh. Is that the only way ARC can do text patching? 

Nothing seems out of the ordinary here. Perhaps Eugeniy's comment confused you, so
let me explain the whole thing - likely obvious to you anyways.

I-cache is non snooping on ARC (like most embedded style arches) so self modifying
code has to flush corresponding D and I cache lines. Instructions can be 2 byte
aligned and could be 2, 4, 6, 8 bytes long, so a 4 byte NOP can potentially
straddle cache line, needing 2 lines to be flushed. The cache maintenance ops work
on region or line but coherency unit nonetheless operates on line sized units
meaning 2 line ops may not be atomic on a remote cpu. So in the pathetic corner
case we can have "other (non patching) CPU execute the code around patched PC with
partial old/new fragments. So we ensure a patched instruction never crosses a
cache line - using .balign 4. This causes a slight mis-optimization that all
patched instruction locations are forced to be 4 bytes aligned while ISA allows
code to be 2 byte aligned. The cost is an extra NOP_S (2 bytes) - no big deal in
grand scheme of things in IMO.

FWIW I tried to avoid all of this by using the 2 byte NOP_S and B_S variants which
ensures we can never straddle cache line so the alignment issue goes away. There's
a nice code size reduction too - see [1] . But I get build link errors in
networking code around DO_ONCE where the unlikely code is too much and offset
can't be encoded in signed 10 bits which B_S is allowed.

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-June/005875.html
> We've actually
> considered something like this on x86 at some point, but there we have
> the 'fun' detail that the i-fetch window does not in fact align with L1
> size on all uarchs, so that got complicated real fast.

As described above we don't have such an issue. I/D flushing works - its just that
they are not be atomic

> I'm assuming you've looked at what x86 currently does and found
> something like that doesn't work for ARC?

Just looked at x86 code and it seems similar

>
>>> +/* Halt system on fatal error to make debug easier */
>>> +#define arc_jl_fatal(format...)						\
>>> +({									\
>>> +	pr_err(JUMPLABEL_ERR format);					\
>>> +	BUG();								\
>> Does it make sense to bring down the whole system vs. failing and returning.
>> I see there is no error propagation to core code, but still.
> It is what x86 does. And I've been fairly adamant about doing so. When
> the kernel text is compromised, do you really want to continue running
> it?

Agree, but the errors here are not in the middle of code patching itself. They are
found before committing to patching say because patched code straddles line (which
BTW can never happen given the .balign, it is perhaps a pedantic safety net), or
the offset can't be encoded in B. So it is possible to  do a pr_err and just
return w/o any patching like an API call failed. But given that the error
propagation to core is not there - the assumption is it either always works or
panics, there is no "failing" semantics.

>
>>> +})
>>> +
>>> +static inline u32 arc_gen_nop(void)
>>> +{
>>> +	/* 1x 32bit NOP in middle endian */
> I dare not ask...

:-) The public PRM is being worked on for *real* so this will be remedied in a few
months at best.

Short answer is it specifies how instruction stream is laid out in code memory for
efficient next PC decoding given that ARC can freely intermix 2, 4, 6, 8 byte
instruction fragments w/o any restrictions.

Consier SWI insn encoding: per PRM is

31                                     0
--------------------------------------------------------------
00100    010    01    101111    0    000    000000    111111
--------------------------------------------------------------

In regular little endian notation, in memory it would have looked as

31                  0
 0x22    0x6F    0x00    0x3F 
  b3     b2      b1      b0

However in middle endian format, the 2 short words are flipped

31                   0
0x00    0x3F   0x22     0x6F   
  b1     b0      b3       b2

>
>>> +	WRITE_ONCE(*instr_addr, instr);
>>> +	flush_icache_range(entry->code, entry->code + JUMP_LABEL_NOP_SIZE);
> So do you have a 2 byte opcode that traps unconditionally? In that case
> I'm thinking you could do something like x86 does. And it would avoid
> that NOP padding you do to get the alignment.

Just to be clear there is no trapping going on in the canonical sense of it. There
are regular instructions for NO-OP and Branch.
We do have 2 byte opcodes for both but as described the branch offset is too
limited so not usable.

-Vineet
