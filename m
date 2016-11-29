From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Tue, 29 Nov 2016 11:37:39 +0000
Subject: [PATCH] ARC: mm: PAE40: Cast pfn to pte_t in pfn_pte() macro
In-Reply-To: <1480333322.4245.18.camel@synopsys.com>
References: <1480306037-15415-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1480333322.4245.18.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC01024B1A@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org



> -----Original Message-----
> From: Alexey Brodkin [mailto:abrodkin at synopsys.com]
> Sent: Monday, November 28, 2016 2:43 PM
> To: yuriy.kolerov at synopsys.com
> Cc: linux-kernel at vger.kernel.org; Alexey.Brodkin at synopsys.com; Vineet
> Gupta <vgupta at synopsys.com>; linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH] ARC: mm: PAE40: Cast pfn to pte_t in pfn_pte() macro
> 
> Hi Yuriy,
> 
> Really nice catch!
> Though a couple of nitpicks below.
> 
> On Mon, 2016-11-28@07:07 +0300, Yuriy Kolerov wrote:
> > Originally pfn_pte(pfn, prot) macro had this definition:
> >
> > ????__pte(((pfn) << PAGE_SHIFT) | pgprot_val(prot))
> >
> > The value of pfn (Page Frame Number) is shifted to the left to get the
> > value of pte (Page Table Entry). Usually a 4-byte value is passed to
> > this macro as value of pfn. However if Linux is configured with
> > support of PAE40 then value of pte has 8-byte type because it must
> > contain additional 8 bits of the physical address. Thus if value of
> > pfn represents a physical page frame above of 4GB boundary then
> > shifting of pfn to the left by PAGE_SHIFT wipes most significant bits
> > of the 40-bit physical address.
> >
> > As a result all physical addresses above of 4GB boundary in systems
> > with PAE40 are mapped to virtual address incorrectly. An error may
> > occur when the kernel tries to unmap such bad pages:
> >
> > ????[ECR???]: 0x00050100 => Invalid Read @ 0x41414144 by insn @
> > 0x801644c6
> > ????[EFA???]: 0x41414144
> > ????[BLINK ]: unmap_page_range+0x134/0x700
> > ????[ERET??]: unmap_page_range+0x17a/0x700
> > ????[STAT32]: 0x8008021e : IE K
> > ????BTA: 0x801644c6	?SP: 0x901a5e84	?FP: 0x5ff35de8
> > ????LPS: 0x8026462c	LPE: 0x80264630	LPC: 0x00000000
> > ????r00: 0x8fcc4fc0	r01: 0x2fe68000	r02: 0x41414140
> > ????r03: 0x2c05c000	r04: 0x2fe6a000	r05: 0x0009ffff
> > ????r06: 0x901b6898	r07: 0x2fe68000	r08: 0x00000001
> > ????r09: 0x804a807c	r10: 0x0000067e	r11: 0xffffffff
> > ????r12: 0x80164480
> > ????Stack Trace:
> > ??????unmap_page_range+0x17a/0x700
> > ??????unmap_vmas+0x46/0x64
> > ??????do_munmap+0x210/0x450
> > ??????SyS_munmap+0x2c/0x50
> > ??????EV_Trap+0xfc/0x100
> 
> This example makes not much sense in its current form.
> I'd like to see how mentioned above problem leads to this failure. I.e. pfn =
> 0xXXX gave pte = 0xYYY and at truncated to 0xYYY address there's no data we
> expected thus reading from?0x41414144 end up in exception etc.
> 
> > So the value of pfn must be casted to pte_t before shifting to ensure
> > that 40-bit address will not be truncated:
> >
> > ????__pte(((pte_t) (pfn) << PAGE_SHIFT) | pgprot_val(prot))
> >
> > Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>
> > ---
> > ?arch/arc/include/asm/pgtable.h | 3 ++-
> > ?1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arc/include/asm/pgtable.h
> > b/arch/arc/include/asm/pgtable.h index 89eeb37..77bc51c 100644
> > --- a/arch/arc/include/asm/pgtable.h
> > +++ b/arch/arc/include/asm/pgtable.h
> > @@ -280,7 +280,8 @@ static inline void pmd_set(pmd_t *pmdp, pte_t
> > *ptep)
> >
> > ?#define pte_page(pte)		pfn_to_page(pte_pfn(pte))
> > ?#define mk_pte(page, prot)	pfn_pte(page_to_pfn(page), prot)
> > -#define pfn_pte(pfn, prot)	__pte(((pfn) << PAGE_SHIFT) |
> pgprot_val(prot))
> > +#define pfn_pte(pfn, prot) \
> > +	__pte(((pte_t) (pfn) << PAGE_SHIFT) | pgprot_val(prot))
> 
> I think it's better to split it in a bit different manner like:
> --------------------------------->8-----------------------------
> #define pfn_pte(pfn, prot)	__pte(((pte_t) (pfn) << PAGE_SHIFT) | \
> 				??????pgprot_val(prot))
> --------------------------------->8-----------------------------
> 
> Also see how this macro is implemented for example on ARM:
> http://lxr.free-electrons.com/source/arch/arm/include/asm/pgtable.h#L211
> -------------------->8------------------
> #define pfn_pte(pfn,prot)???????__pte(__pfn_to_phys(pfn) |
> pgprot_val(prot))
> -------------------->8------------------
> 
> Where __pfn_to_phys() is:
> http://lxr.free-electrons.com/source/include/asm-
> generic/memory_model.h#L78
> -------------------->8------------------
> #define __pfn_to_phys(pfn)??????PFN_PHYS(pfn)
> -------------------->8------------------
> 
> PFN_PHYS() is:
> http://lxr.free-electrons.com/source/include/linux/pfn.h#L20
> -------------------->8------------------
> #define PFN_PHYS(x)?????((phys_addr_t)(x) << PAGE_SHIFT)
> -------------------->8------------------
> 
> And finally phys_addr_t is:
> http://lxr.free-electrons.com/source/include/linux/types.h#L161
> -------------------->8------------------
> #ifdef CONFIG_PHYS_ADDR_T_64BIT
> typedef u64 phys_addr_t;
> #else
> typedef u32 phys_addr_t;
> #endif
> -------------------->8------------------
> 
> Not really sure though which implementation is better.
> I like your approach because its simplicity instead of another couple of layers
> of definitions but maybe there's a reason for this kind of complication. Funny
> enough other arches take their own approaches ranging from the same you
> did to this __pfn_to_phys() to casting to "long long".

Yes, you are right. __pfn_to_phys() does what is needed.

> -Alexey
