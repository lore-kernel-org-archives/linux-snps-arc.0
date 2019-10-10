From: kirill.shutemov@linux.intel.com (Kirill A. Shutemov)
Date: Thu, 10 Oct 2019 11:28:03 +0300
Subject: [PATCH v3] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
In-Reply-To: <20191009185731.25814-1-vgupta@synopsys.com>
References: <20191009184350.18323-1-vgupta@synopsys.com>
 <20191009185731.25814-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191010082803.biaon6gq7yxvrvrq@black.fi.intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Oct 09, 2019@06:57:31PM +0000, Vineet Gupta wrote:
> Add the intermediate p4d accessors to make it 5 level compliant.
> 
> This is a non-functional change anyways since ARC has software page walker
> with 2 lookup levels (pgd -> pte)
> 
> There is slight code bloat due to pulling in needless p*d_free_tlb()
> macros which needs to be addressed seperately.
> 
> | bloat-o-meter2 vmlinux-with-5LEVEL_HACK vmlinux-patched
> | add/remove: 0/0 grow/shrink: 2/0 up/down: 128/0 (128)
> | function                                     old     new   delta
> | free_pgd_range                               546     656    +110
> | p4d_clear_bad                                  2      20     +18
> | Total: Before=4137148, After=4137276, chg 0.000000%
> 
> Cc: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>

-- 
 Kirill A. Shutemov
