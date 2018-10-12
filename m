From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 12 Oct 2018 19:40:04 +0000
Subject: [PATCH 12/18] arch/tlb: Clean up simple architectures
References: <20180926113623.863696043@infradead.org>
 <20180926114801.146189550@infradead.org>
 <C2D7FE5348E1B147BCA15975FBA23075012B09A59E@us01wembx1.internal.synopsys.com>
 <20181011150406.GL9848@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0ADA16@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/11/2018 08:06 AM, Peter Zijlstra wrote:
> On Wed, Oct 03, 2018@05:03:50PM +0000, Vineet Gupta wrote:
>> On 09/26/2018 04:56 AM, Peter Zijlstra wrote:
>>> There are generally two cases:
>>>
>>>  1) either the platform has an efficient flush_tlb_range() and
>>>     asm-generic/tlb.h doesn't need any overrides at all.
>>>
>>>  2) or an architecture lacks an efficient flush_tlb_range() and
>>>     we override tlb_end_vma() and tlb_flush().
>>>
>>> Convert all 'simple' architectures to one of these two forms.
>>>
>>> --- a/arch/arc/include/asm/tlb.h
>>> +++ b/arch/arc/include/asm/tlb.h
>>> @@ -9,29 +9,6 @@
>>>  #ifndef _ASM_ARC_TLB_H
>>>  #define _ASM_ARC_TLB_H
>>>  
>>> -#define tlb_flush(tlb)				\
>>> -do {						\
>>> -	if (tlb->fullmm)			\
>>> -		flush_tlb_mm((tlb)->mm);	\
>>> -} while (0)
>>> -
>>> -/*
>>> - * This pair is called at time of munmap/exit to flush cache and TLB entries
>>> - * for mappings being torn down.
>>> - * 1) cache-flush part -implemented via tlb_start_vma( ) for VIPT aliasing D$
>>> - * 2) tlb-flush part - implemted via tlb_end_vma( ) flushes the TLB range
>>> - *
>>> - * Note, read https://urldefense.proofpoint.com/v2/url?u=http-3A__lkml.org_lkml_2004_1_15_6&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=c14YS-cH-kdhTOW89KozFhBtBJgs1zXscZojEZQ0THs&m=5jiyvgRek4SKK5DUWDBGufVcuLez5G-jJCh3K-ndHsg&s=7uAzzw_jdAXMfb07B-vGPh3V1vggbTAsB7xL6Kie47A&e=
>>> - */
>>> -
>>> -#define tlb_end_vma(tlb, vma)						\
>>> -do {									\
>>> -	if (!tlb->fullmm)						\
>>> -		flush_tlb_range(vma, vma->vm_start, vma->vm_end);	\
>>> -} while (0)
>>> -
>>> -#define __tlb_remove_tlb_entry(tlb, ptep, address)
>>> -
>>>  #include <linux/pagemap.h>
>>>  #include <asm-generic/tlb.h>
>> LGTM per discussion in an earlier thread. However given that for "simpler" arches
>> the whole series doesn't apply can you please beef up the changelog so I don't go
>> scratching my head 2 years down the line. It currently describes the hows of
>> things but not exactly whys: shift_arg_pages missing tlb_start_vma,
>> move_page_tables look dodgy, yady yadda ?
> Right you are. Thanks for pointing out the somewhat sparse Changelog;
> typically I end up kicking myself a few years down the line.
>
> I think I will in fact change the implementation a little and provide a
> symbol/Kconfig to switch the default implementation between
> flush_tlb_vma() and flush_tlb_mm().
>
> That avoids some of the repetition. But see here a preview of the new
> Changelog, does that clarify things enough?
>
> ---
> Subject: arch/tlb: Clean up simple architectures
> From: Peter Zijlstra <peterz at infradead.org>
> Date: Tue Sep 4 17:04:07 CEST 2018
>
> The generic mmu_gather implementation is geared towards range tracking
> and provided the architecture provides a fairly efficient
> flush_tlb_range() implementation (or provides a custom tlb_flush()
> implementation) things will work well.
>
> The one case this doesn't cover well is where there is no (efficient)
> range invalidate at all. In this case we can select
> MMU_GATHER_NO_RANGE.
>
> So this reduces to two cases:
>
>  1) either the platform has an efficient flush_tlb_range() and
>     asm-generic/tlb.h doesn't need any overrides at all.
>
>  2) or an architecture lacks an efficient flush_tlb_range() and
>     we need to select MMU_GATHER_NO_RANGE.
>
> Convert all 'simple' architectures to one of these two forms.
>
> alpha:	    has no range invalidate -> 2
> arc:	    already used flush_tlb_range() -> 1
> c6x:	    has no range invalidate -> 2
> hexagon:    has an efficient flush_tlb_range() -> 1
>             (flush_tlb_mm() is in fact a full range invalidate,
> 	     so no need to shoot down everything)
> m68k:	    has inefficient flush_tlb_range() -> 2
> microblaze: has no flush_tlb_range() -> 2
> mips:	    has efficient flush_tlb_range() -> 1
> 	    (even though it currently seems to use flush_tlb_mm())
> nds32:	    already uses flush_tlb_range() -> 1
> nios2:	    has inefficient flush_tlb_range() -> 2
> 	    (no limit on range iteration)
> openrisc:   has inefficient flush_tlb_range() -> 2
> 	    (no limit on range iteration)
> parisc:	    already uses flush_tlb_range() -> 1
> sparc32:    already uses flush_tlb_range() -> 1
> unicore32:  has inefficient flush_tlb_range() -> 2
> 	    (no limit on range iteration)
> xtensa:	    has efficient flush_tlb_range() -> 1
>
> Note this also fixes a bug in the existing code for a number
> platforms. Those platforms that did:
>
>   tlb_end_vma() -> if (!fullmm) flush_tlb_*()
>   tlb_flush -> if (full_mm) flush_tlb_mm()
>
> missed the case of shift_arg_pages(), which doesn't have @fullmm set,
> nor calls into tlb_*vma(), but still frees page-tables and thus needs
> an invalidate. The new code handles this by detecting a non-empty
> range, and either issuing the matching range invalidate or a full
> invalidate, depending on the capabilities.
>
> Cc: Nick Piggin <npiggin at gmail.com>
> Cc: "David S. Miller" <davem at davemloft.net>
> Cc: Michal Simek <monstr at monstr.eu>
> Cc: Helge Deller <deller at gmx.de>
> Cc: Greentime Hu <green.hu at gmail.com>
> Cc: Richard Henderson <rth at twiddle.net>
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar at linux.vnet.ibm.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: Ley Foon Tan <lftan at altera.com>
> Cc: Jonas Bonn <jonas at southpole.se>
> Cc: Mark Salter <msalter at redhat.com>
> Cc: Richard Kuo <rkuo at codeaurora.org
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Paul Burton <paul.burton at mips.com>
> Cc: Max Filippov <jcmvbkbc at gmail.com>
> Cc: Guan Xuetao <gxt at pku.edu.cn>
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>

Very nice. Thx for doing this.

Once you have redone this, please point me to a branch so I can give this a spin.
I've always been interested in tracking down / optimizing the full TLB flushes -
which ARC implements by simply moving the MMU/process to a new ASID (TLB entries
tagged with an 8 bit value - unique per process). When I started looking into this
, a simple ls (fork+execve) would increment the ASID by 13 which I'd optimized to
a reasonable 4. Haven't checked that in recent times though so would be fun to
revive that measurement.

-Vineet
