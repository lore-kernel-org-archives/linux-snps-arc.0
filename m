From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 10 Jun 2019 15:55:41 +0000
Subject: ARC Assembler: bundle_align_mode directive support
References: <3962a9ad199cea45b1cfadb80be551aab83b7028.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A2525686@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 6/8/19 11:21 AM, Eugeniy Paltsev wrote:
> Hi Cupertino,
>
> I tried to use ".bundle_align_mode" directive in ARC assembly, but I got following error:
> ----------------->8--------------
> Assembler messages:
> Error: unknown pseudo-op: `.bundle_align_mode'
> ----------------->8--------------
>
> Is it possible to implement it in ARC assembler?
> There is some context about the reason we want to have it:
>
> I'm trying to add support of jump labels for ARC in linux kernel. Jump labels
> provide an interface to generate static branches using self-modifying code.
> This allows us to implement conditional branches where changing branch
> direction is expensive but branch selection is basically 'free'.
>
> There is nuance in current implementation:
> We need to patch code by rewriting 32-bit NOP by 32-bit BRANCH instruction (or vice versa).
> It can be easily done with following code:
> ----------------->8--------------
> write_32_bit(new_instruction)
> flush_l1_dcache_range_this_cpu
> invalidate_l1_icache_range_all_cpu
> ----------------->8--------------
>
> I$ update will be atomic in most of cases except the patched instruction share
> two L1 cache lines (so first 16 bits of instruction are in the one cache line and
> last 16 bit are in another cache line).
> In such case we can execute half-updated instruction if we are patching live code (and we are unlucky enough :)

While I understand your need for alignment, I don't see how you can possibly
execute stray lines.
dcache flush will be propagated by hardware (SCU) to all cores (as applicable) and
the icache cache flush xcall is synchronous and will have to finish on all cores
before we proceed to execute the cod eitself.

>
> As of today I simply align by 4 byte instruction which can be patched with ".balign 4" directive:
> ----------------->8--------------
> static __always_inline bool arch_static_branch_jump(struct static_key *key,
>     bool branch)
> {
> asm_volatile_goto(".balign 4\n"
>  "1:\n"
>  "b %l[l_yes]\n" // <- instruction which can be patched
>  ".pushsection __jump_table, \"aw\"\n"
>  ".word 1b, %l[l_yes], %c0\n"
>  ".popsection\n"
>  : : "i" (&((char *)key)[branch]) : : l_yes);
>
> return false;
> l_yes:
> return true;
> }
> ----------------->8--------------
>
> In that case patched instruction is aligned with one 16-bit NOP if this is required.
> However 'align by 4' directive is much stricter than it actually required. 

I don't quite understand. Can u write a couple of lines of pseudo assembly to show
what the issue is.

> It's enough
> that our 32-bit instruction don't cross l1 cache line boundary.
> That will save us from adding useless NOP padding in most of the cases.
> It can be implemented with ".bundle_align_mode" directive which isn't supported by ARC AS unfortunately.

This seems like a reasonable request (contingent to the difficulty of
implementation in binutils). but I can't comprehend why you would need it.
