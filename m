From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Wed, 10 Feb 2016 12:50:12 +0200
Subject: [PATCH] mm,thp: khugepaged: call pte flush at the time of collapse
In-Reply-To: <1455080175-10987-1-git-send-email-vgupta@synopsys.com>
References: <1455080175-10987-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160210105012.GA23604@node.shutemov.name>
To: linux-snps-arc@lists.infradead.org

On Wed, Feb 10, 2016@10:26:15AM +0530, Vineet Gupta wrote:
> This showed up on ARC when running LMBench bw_mem tests as
> Overlapping TLB Machine Check Exception triggered due to STLB entry
> (2M pages) overlapping some NTLB entry (regular 8K page).
> 
> bw_mem 2m touches a large chunk of vaddr creating NTLB entries.
> In the interim khugepaged kicks in, collapsing the contiguous ptes into
> a single pmd. pmdp_collapse_flush()->flush_pmd_tlb_range() is called to
> flush out NTLB entries for the ptes. This for ARC (by design) can only
> shootdown STLB entries (for pmd). The stray NTLB entries cause the overlap
> with the subsequent STLB entry for collapsed page.
> So make pmdp_collapse_flush() call pte flush interface not pmd flush.
> 
> Note that originally all thp flush call sites in generic code called
> flush_tlb_range() leaving it to architecture to implement the flush for
> pte and/or pmd. Commit 12ebc1581ad11454 changed this by calling a new
> opt-in API flush_pmd_tlb_range() which made the semantics more explicit
> but failed to distinguish the pte vs pmd flush in generic code, which is
> what this patch fixes.
> 
> Note that ARC can fixed w/o touching the generic pmdp_collapse_flush()
> by defining a ARC version, but that defeats the purpose of generic
> version, plus sementically this is the right thing to do.
> 
> Fixes STAR 9000961194: LMBench on AXS103 triggering duplicate TLB
> exceptions with super pages
> 
> Cc: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar at linux.vnet.ibm.com>
> Cc: Andrea Arcangeli <aarcange at redhat.com>
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: <stable at vger.kernel.org> #4.4
> Cc: <linux-snps-arc at lists.infradead.org>
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-mm at kvack.org
> Fixes: 12ebc1581ad11454 ("mm,thp: introduce flush_pmd_tlb_range")
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>

-- 
 Kirill A. Shutemov
