From: Cupertino.Miranda@synopsys.com (Cupertino Miranda)
Date: Tue, 11 Jun 2019 20:40:28 +0000
Subject: ARC Assembler: bundle_align_mode directive support
In-Reply-To: <d79085cbc6126c2a4fad173934e1e9b29523abba.camel@synopsys.com>
References: <3962a9ad199cea45b1cfadb80be551aab83b7028.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2525686@us01wembx1.internal.synopsys.com>
 <d79085cbc6126c2a4fad173934e1e9b29523abba.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <015f8668b5fff15e781722165f38fa4beacffcf1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

If I understand well what this optimization would do is ... this
optimization would replace conditional code by fixed jumps that would
turn out to be always happening. Like fixed ARC build aux registers
based conditional jumps.

I don't understand several things:
 1st. Can't we invalidate multiple icache lines, and synchronize them
through all CPUs? I am afraid no one might know the actual truth to
this question. :-)
 2nd. Turns out all my questions are in number 1. :-D

Suggestion: Can't we make use of instruction slots to perform this ?
Please notice ei_s is a short 16 bit instruction. Replacing the
instruction with an "ei_s <index>" and a nop in case of 32 bit
instruction ? Do all of the Linux compatible target support instruction
slots ?
Anyway it will not solve the invalid instruction in the remaining
icache line.

For referemce, I still think this optimization is a little useless and
a can of worms, as for actual use cases the customer can know at
compile time all of the this constant jumps for its target.
No one that would care for performance would prefer this feature to
actual clear out of its code.

Looking at it, It seems to me that Linux kernel should evolve to a JIT
compilation approach, instead of this JIT juggling one.

Best regards,
Cupertino


On Tue, 2019-06-11@18:47 +0000, Eugeniy Paltsev wrote:
> Hi Vineet,
> 
> On Mon, 2019-06-10@15:55 +0000, Vineet Gupta wrote:
> > On 6/8/19 11:21 AM, Eugeniy Paltsev wrote:
> > > Hi Cupertino,
> > > 
> > > I tried to use ".bundle_align_mode" directive in ARC assembly,
> > > but I got following error:
> > > ----------------->8--------------
> > > Assembler messages:
> > > Error: unknown pseudo-op: `.bundle_align_mode'
> > > ----------------->8--------------
> > > 
> > > Is it possible to implement it in ARC assembler?
> > > There is some context about the reason we want to have it:
> > > 
> > > I'm trying to add support of jump labels for ARC in linux kernel.
> > > Jump labels
> > > provide an interface to generate static branches using self-
> > > modifying code.
> > > This allows us to implement conditional branches where changing
> > > branch
> > > direction is expensive but branch selection is basically 'free'.
> > > 
> > > There is nuance in current implementation:
> > > We need to patch code by rewriting 32-bit NOP by 32-bit BRANCH
> > > instruction (or vice versa).
> > > It can be easily done with following code:
> > > ----------------->8--------------
> > > write_32_bit(new_instruction)
> > > flush_l1_dcache_range_this_cpu
> > > invalidate_l1_icache_range_all_cpu
> > > ----------------->8--------------
> > > 
> > > I$ update will be atomic in most of cases except the patched
> > > instruction share
> > > two L1 cache lines (so first 16 bits of instruction are in the
> > > one cache line and
> > > last 16 bit are in another cache line).
> > > In such case we can execute half-updated instruction if we are
> > > patching live code (and we are unlucky enough :)
> > 
> > While I understand your need for alignment, I don't see how you can
> > possibly
> > execute stray lines.
> > dcache flush will be propagated by hardware (SCU) to all cores (as
> > applicable) and
> > the icache cache flush xcall is synchronous and will have to finish
> > on all cores
> > before we proceed to execute the cod eitself.
> > 
> 
> It's easy as hell - we may execute some code on one CPU and patch it
> on another CPU at the same moment :)
> 
> And here is the example of the situation when we can get the issue:
> - Let's imagine we have SMP system with CPU#0 and CPU#1.
> - We have instruction which share two L1 cache lines:
> ~ ---------------------------------|---------------------------------
> ~
> ~            |instruction-Z (32-bit instruction we
> patch)|            ~
> ~ ---------------------------------|---------------------------------
> ~
> ~   cache-line-X                   | cache-line-
> Y                     ~
> ~ ---------------------------------|---------------------------------
> ~
> 
> CPU#0 is trying to switch our static branch, so it will patch the
> code (instruction-Z)
> CPU#1 is executing this code with our static branch, so it execute
> the code (with instruction-Z) that will be patched.
> 
> 1) CPU#0: we generate new instruction (to replace 'instruction-Z')
>    and write it with 32-bit store (st). It is written to CPU#0 L1
> data cache.
> 2) CPU#0: we call our function flush_icache_range.
>    It firstly will flush L1 data cache region on CPU#0.
>    In our example it will flush CPU#0 L1 'cache-line-X' and 'cache-
> line-Y' to L2 cache.
> 3) CPU#1: we are executing code which is in 'cache-line-X'.
>    'cache-line-Y' is __NOT__ in the L1 instruction cache of CPU#1.
>    We need to execute 'instruction-Z', but only half of the
> instruction is in L1 instruction cache.
>    CPU#1 fetch 'cache-line-Y' to L1 instruction cache.
> 4)  Ooops: now we have corrupted 'instruction-Z' in L1 instruction
> cache of CPU#1:
>    First 16 bit of this instruction (which belongs to 'cache-line-X') 
> are old (not patched).
>    Last 16 bit of this instruction (which belongs to 'cache-line-Y')
> are new (patched).
> 
> > > As of today I simply align by 4 byte instruction which can be
> > > patched with ".balign 4" directive:
> > > ----------------->8--------------
> > > static __always_inline bool arch_static_branch_jump(struct
> > > static_key *key,
> > >     bool branch)
> > > {
> > > asm_volatile_goto(".balign 4\n"
> > >  "1:\n"
> > >  "b %l[l_yes]\n" // <- instruction which can be patched
> > >  ".pushsection __jump_table, \"aw\"\n"
> > >  ".word 1b, %l[l_yes], %c0\n"
> > >  ".popsection\n"
> > >  : : "i" (&((char *)key)[branch]) : : l_yes);
> > > 
> > > return false;
> > > l_yes:
> > > return true;
> > > }
> > > ----------------->8--------------
> > > 
> > > In that case patched instruction is aligned with one 16-bit NOP
> > > if this is required.
> > > However 'align by 4' directive is much stricter than it actually
> > > required.
> > 
> > I don't quite understand. Can u write a couple of lines of pseudo
> > assembly to show
> > what the issue is.
> 
> All instructions on ARCv2 are aligned by 2 byte (even if the
> instruction is 4-byte long).
> 
> Using '.balign' directive we align instruction which can be
> patched by 4 byte.
> So compiler will add one 'nop_s' before our instruction if it is not
> 4 byte aligned.
> 
> So this code
> ------------------->8---------------
> -----
>  .balign 4
>  1:
>  b %l[l_yes]   #<- instruction which can be patched
> ------------------->8--------------------
> may turn into this:
> -----------------
> -->8--------------------
> bla-bla-bla
>  b l_yes       #<- instruction which can be patched
> bla-bla-bla
> ------------------->8--------------------
> or that:
> ----
> --------------->8--------------------
> bla-bla-bla
>  nop_s         # padding
>  b l_yes       #<- instruction which can be patched
> bla-bla-bla
> ----------------
> --->8--------------------
> 
> In most of the cases this extra 'nop_s' is unnecessary as it is fine
> to have our instruction
> not 4 byte aligned if it doesn't cross l1 cache line boundary.
> 
> It is't the huge problem - but we are adding one unnecessary 'nop'
> while we try to optimize hot code.
> 
> > 
> > > It's enough
> > > that our 32-bit instruction don't cross l1 cache line boundary.
> > > That will save us from adding useless NOP padding in most of the
> > > cases.
> > > It can be implemented with ".bundle_align_mode" directive which
> > > isn't supported by ARC AS unfortunately.
> > 
> > This seems like a reasonable request (contingent to the difficulty
> > of
> > implementation in binutils). but I can't comprehend why you would
> > need it.
> 
> If we will have ".bundle_align_mode" directive supported we can add
> extra 'nop_s' only if it's really required
> (if our instruction _really_ cross L1 cache line boundary). So we
> won't add useless NOP to hot code.
> 
> --
>  Eugeniy Paltsev
