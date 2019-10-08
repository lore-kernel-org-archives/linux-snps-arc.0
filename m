From: kirill.shutemov@linux.intel.com (Kirill A. Shutemov)
Date: Wed, 9 Oct 2019 02:42:23 +0300
Subject: [PATCH] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
In-Reply-To: <20191008213836.19266-1-vgupta@synopsys.com>
References: <20191008213836.19266-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191008234223.wycjktby2t5gwz3o@black.fi.intel.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Oct 08, 2019@09:38:36PM +0000, Vineet Gupta wrote:
> Add the intermediate p4d accessors to make it 5 level compliant.
> 
> Thi sis non-functional change anyways since ARC has software page walker
     ^
     Typo.
> with 2 lookup levels (pgd -> pte)
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/include/asm/pgtable.h |  1 -
>  arch/arc/mm/fault.c            | 10 ++++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

Have you tested it with CONFIG_HIGHMEM=y? alloc_kmap_pgtable() has to be
converted too.

-- 
 Kirill A. Shutemov
