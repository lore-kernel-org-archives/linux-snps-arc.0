From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 20 Jun 2019 18:34:55 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <20190620070120.GU3402@hirez.programming.kicks-ass.net>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
 <20190620070120.GU3402@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a945de7d3b6f2da03c62c9e1043e125b4c4211aa.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,
On Thu, 2019-06-20@09:01 +0200, Peter Zijlstra wrote:
> On Wed, Jun 19, 2019@11:55:41PM +0000, Vineet Gupta wrote:
> > On 6/19/19 1:12 AM, Peter Zijlstra wrote:
> > > I'm assuming you've looked at what x86 currently does and found
> > > something like that doesn't work for ARC?
> > 
> > Just looked at x86 code and it seems similar
> 
> I think you missed a bit.
> 
> > > > > +	WRITE_ONCE(*instr_addr, instr);
> > > > > +	flush_icache_range(entry->code, entry->code + JUMP_LABEL_NOP_SIZE);
> > > So do you have a 2 byte opcode that traps unconditionally? In that case
> > > I'm thinking you could do something like x86 does. And it would avoid
> > > that NOP padding you do to get the alignment.
> > 
> > Just to be clear there is no trapping going on in the canonical sense of it. There
> > are regular instructions for NO-OP and Branch.
> > We do have 2 byte opcodes for both but as described the branch offset is too
> > limited so not usable.
> 
> In particular we do not need the alignment.
> 
> So what the x86 code does is:
> 
>  - overwrite the first byte of the instruction with a single byte trap
>    instruction
> 
>  - machine wide IPI which synchronizes I$
> 
> At this point, any CPU that encounters this instruction will trap; and
> the trap handler will emulate the 'new' instruction -- typically a jump.
> 
>   - overwrite the tail of the instruction (if there is a tail)
> 
>   - machine wide IPI which syncrhonizes I$
> 
> At this point, nobody will execute the tail, because we'll still trap on
> that first single byte instruction, but if they were to read the
> instruction stream, the tail must be there.
> 
>   - overwrite the first byte of the instruction to now have a complete
>     instruction.
> 
>   - machine wide IPI which syncrhonizes I$
> 
> At this point, any CPU will encounter the new instruction as a whole,
> irrespective of alignment.
> 
> 
> So the benefit of this scheme is that is works irrespective of the
> instruction fetch window size and don't need the 'funny' alignment
> stuff.
> 

Thanks for explanation. Now I understand how this x86 magic works.

However it looks like even more complex than ARM implementation.
As I understand on ARM they do something like that:
---------------------------->8-------------------------
on_each_cpu {
	write_instruction
	flush_data_cache_region
	invalidate_instruction_cache_region
}
---------------------------->8-------------------------

https://elixir.bootlin.com/linux/v5.1/source/arch/arm/kernel/patch.c#L121

Yep, there is some overhead - as we don't need to do white and D$ flush on each cpu
but that makes code simple and avoids additional checks.

And I don't understand in which cases x86 approach with trap is better.
In this ARM implementation we do one machine wide IPI instead of three in x86 trap approach.

Probably there is some x86 specifics I don't get?


> Now, I've no idea if something like this is feasible on ARC; for it to
> work you need that 2 byte trap instruction -- since all instructions are
> 2 byte aligned, you can always poke that without issue.

Yep we have 2 byte trap (trap_s instruction).

Actually there are even two candidates another candidates which can be used
instead trap_s to avoid adding additional code to trap handler:
SWI_S - software interrupt
and
UNIMP_S - instruction with funny name 'unimplemented instruction'


-- 
 Eugeniy Paltsev
