From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Fri, 11 Oct 2019 11:55:40 +0530
Subject: [PATCH V5 0/2] mm/debug: Add tests validating architecture page table
 helpers
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1570775142-31425-1-git-send-email-anshuman.khandual@arm.com>
To: linux-snps-arc@lists.infradead.org

This series adds a test validation for architecture exported page table
helpers. Patch in the series adds basic transformation tests at various
levels of the page table. Before that it exports gigantic page allocation
function from HugeTLB.

This test was originally suggested by Catalin during arm64 THP migration
RFC discussion earlier. Going forward it can include more specific tests
with respect to various generic MM functions like THP, HugeTLB etc and
platform specific tests.

https://lore.kernel.org/linux-mm/20190628102003.GA56463 at arrakis.emea.arm.com/

Changes in V5:

- Redefined and moved X86 mm_p4d_folded() into a different header per Kirill/Ingo
- Updated the config option comment per Ingo and dropped 'kernel module' reference
- Updated the commit message and dropped 'kernel module' reference
- Changed DEBUG_ARCH_PGTABLE_TEST into DEBUG_VM_PGTABLE per Ingo
- Moved config option from mm/Kconfig.debug into lib/Kconfig.debug
- Renamed core test function arch_pgtable_tests() as debug_vm_pgtable()
- Renamed mm/arch_pgtable_test.c as mm/debug_vm_pgtable.c
- debug_vm_pgtable() gets called from kernel_init_freeable() after init_mm_internals()
- Added an entry in Documentation/features/debug/ per Ingo
- Enabled the test on arm64 and x86 platforms for now

Changes in V4: (https://patchwork.kernel.org/project/linux-mm/list/?series=183465)

- Disable DEBUG_ARCH_PGTABLE_TEST for ARM and IA64 platforms

Changes in V3: (https://lore.kernel.org/patchwork/project/lkml/list/?series=411216)

- Changed test trigger from module format into late_initcall()
- Marked all functions with __init to be freed after completion
- Changed all __PGTABLE_PXX_FOLDED checks as mm_pxx_folded()
- Folded in PPC32 fixes from Christophe

Changes in V2:

https://lore.kernel.org/linux-mm/1568268173-31302-1-git-send-email-anshuman.khandual at arm.com/T/#t

- Fixed small typo error in MODULE_DESCRIPTION()
- Fixed m64k build problems for lvalue concerns in pmd_xxx_tests()
- Fixed dynamic page table level folding problems on x86 as per Kirril
- Fixed second pointers during pxx_populate_tests() per Kirill and Gerald
- Allocate and free pte table with pte_alloc_one/pte_free per Kirill
- Modified pxx_clear_tests() to accommodate s390 lower 12 bits situation
- Changed RANDOM_NZVALUE value from 0xbe to 0xff
- Changed allocation, usage, free sequence for saved_ptep
- Renamed VMA_FLAGS as VMFLAGS
- Implemented a new method for random vaddr generation
- Implemented some other cleanups
- Dropped extern reference to mm_alloc()
- Created and exported new alloc_gigantic_page_order()
- Dropped the custom allocator and used new alloc_gigantic_page_order()

Changes in V1:

https://lore.kernel.org/linux-mm/1567497706-8649-1-git-send-email-anshuman.khandual at arm.com/

- Added fallback mechanism for PMD aligned memory allocation failure

Changes in RFC V2:

https://lore.kernel.org/linux-mm/1565335998-22553-1-git-send-email-anshuman.khandual at arm.com/T/#u

- Moved test module and it's config from lib/ to mm/
- Renamed config TEST_ARCH_PGTABLE as DEBUG_ARCH_PGTABLE_TEST
- Renamed file from test_arch_pgtable.c to arch_pgtable_test.c
- Added relevant MODULE_DESCRIPTION() and MODULE_AUTHOR() details
- Dropped loadable module config option
- Basic tests now use memory blocks with required size and alignment
- PUD aligned memory block gets allocated with alloc_contig_range()
- If PUD aligned memory could not be allocated it falls back on PMD aligned
  memory block from page allocator and pud_* tests are skipped
- Clear and populate tests now operate on real in memory page table entries
- Dummy mm_struct gets allocated with mm_alloc()
- Dummy page table entries get allocated with [pud|pmd|pte]_alloc_[map]()
- Simplified [p4d|pgd]_basic_tests(), now has random values in the entries

Original RFC V1:

https://lore.kernel.org/linux-mm/1564037723-26676-1-git-send-email-anshuman.khandual at arm.com/

Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: Vlastimil Babka <vbabka at suse.cz>
Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Mike Rapoport <rppt at linux.vnet.ibm.com>
Cc: Jason Gunthorpe <jgg at ziepe.ca>
Cc: Dan Williams <dan.j.williams at intel.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Michal Hocko <mhocko at kernel.org>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Mark Brown <broonie at kernel.org>
Cc: Steven Price <Steven.Price at arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel at linaro.org>
Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
Cc: Kees Cook <keescook at chromium.org>
Cc: Tetsuo Handa <penguin-kernel at i-love.sakura.ne.jp>
Cc: Matthew Wilcox <willy at infradead.org>
Cc: Sri Krishna chowdary <schowdary at nvidia.com>
Cc: Dave Hansen <dave.hansen at intel.com>
Cc: Russell King - ARM Linux <linux at armlinux.org.uk>
Cc: Michael Ellerman <mpe at ellerman.id.au>
Cc: Paul Mackerras <paulus at samba.org>
Cc: Martin Schwidefsky <schwidefsky at de.ibm.com>
Cc: Heiko Carstens <heiko.carstens at de.ibm.com>
Cc: "David S. Miller" <davem at davemloft.net>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: James Hogan <jhogan at kernel.org>
Cc: Paul Burton <paul.burton at mips.com>
Cc: Ralf Baechle <ralf at linux-mips.org>
Cc: Kirill A. Shutemov <kirill at shutemov.name>
Cc: Gerald Schaefer <gerald.schaefer at de.ibm.com>
Cc: Christophe Leroy <christophe.leroy at c-s.fr>
Cc: Mike Kravetz <mike.kravetz at oracle.com>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-mips at vger.kernel.org
Cc: linux-arm-kernel at lists.infradead.org
Cc: linux-ia64 at vger.kernel.org
Cc: linuxppc-dev at lists.ozlabs.org
Cc: linux-s390 at vger.kernel.org
Cc: linux-sh at vger.kernel.org
Cc: sparclinux at vger.kernel.org
Cc: x86 at kernel.org
Cc: linux-kernel at vger.kernel.org

Anshuman Khandual (2):
  mm/hugetlb: Make alloc_gigantic_page() available for general use
  mm/debug: Add tests validating architecture page table helpers

 .../debug/debug-vm-pgtable/arch-support.txt        |  34 ++
 arch/arm64/Kconfig                                 |   1 +
 arch/x86/Kconfig                                   |   1 +
 arch/x86/include/asm/pgtable_64.h                  |   6 +
 include/asm-generic/pgtable.h                      |   6 +
 include/linux/hugetlb.h                            |   9 +
 init/main.c                                        |   1 +
 lib/Kconfig.debug                                  |  21 +
 mm/Makefile                                        |   1 +
 mm/debug_vm_pgtable.c                              | 438 +++++++++++++++++++++
 mm/hugetlb.c                                       |  24 +-
 11 files changed, 540 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/features/debug/debug-vm-pgtable/arch-support.txt
 create mode 100644 mm/debug_vm_pgtable.c

-- 
2.7.4
