From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 28 Jun 2018 16:59:14 -0700
Subject: [PATCH] ARC: Fix __swp_offset() implementation
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180628235914.20706-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

We encode offset from swapcache page in __swp_entry() this way, see [1]:
| /* Encode swap {type,off} tuple into PTE
|  * We reserve 13 bits for 5-bit @type, keeping bits 12-5 zero, ensuring that
|  * PAGE_PRESENT is zero in a PTE holding swap "identifier"
|  */
| #define __swp_entry(type, off)	((swp_entry_t) { \
| 					((type) & 0x1f) | ((off) << 13) })

But decode in __swp_offset() as:
| #define __swp_offset(pte_lookalike)	((pte_lookalike).val << 13)
which is obviously wrong, we should ">> 13" instead.

This basically fixes swap usage on ARC finally.

| # mkswap /dev/sda2
|
| # swapon -a -e /dev/sda2
| Adding 500728k swap on /dev/sda2.  Priority:-2 extents:1 across:500728k
|
| # free
|              total       used       free     shared    buffers     cached
| Mem:        765104      13456     751648       4736          8       4736
| -/+ buffers/cache:       8712     756392
| Swap:       500728          0     500728

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/include/asm/pgtable.h#n375

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: stable at vger.kernel.org
---
 arch/arc/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 08fe33830d4b..77676e18da69 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -379,7 +379,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 
 /* Decode a PTE containing swap "identifier "into constituents */
 #define __swp_type(pte_lookalike)	(((pte_lookalike).val) & 0x1f)
-#define __swp_offset(pte_lookalike)	((pte_lookalike).val << 13)
+#define __swp_offset(pte_lookalike)	((pte_lookalike).val >> 13)
 
 /* NOPs, to keep generic kernel happy */
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
-- 
2.17.1
