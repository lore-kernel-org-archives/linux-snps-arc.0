From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Fri,  9 Aug 2019 13:03:17 +0530
Subject: [RFC V2 0/1] mm/debug: Add tests for architecture exported page table
 helpers
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
To: linux-snps-arc@lists.infradead.org

This series adds a test validation for architecture exported page table
helpers. Patch in the series adds basic transformation tests at various
levels of the page table.

This test was originally suggested by Catalin during arm64 THP migration
RFC discussion earlier. Going forward it can include more specific tests
with respect to various generic MM functions like THP, HugeTLB etc and
platform specific tests.

https://lore.kernel.org/linux-mm/20190628102003.GA56463 at arrakis.emea.arm.com/

Questions:

Should alloc_gigantic_page() be made available as an interface for general
use in the kernel. The test module here uses very similar implementation from
HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
needs to be exported through a header.

Testing:

Build and boot tested on arm64 and x86 platforms. While arm64 clears all
these tests, following errors were reported on x86.

1. WARN_ON(pud_bad(pud)) in pud_populate_tests()
2. WARN_ON(p4d_bad(p4d)) in p4d_populate_tests()

I would really appreciate if folks can help validate this test on other
platforms and report back problems if any. Suggestions, comments and
inputs welcome. Thank you.

Changes in V2:

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

RFC V1:

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

Anshuman Khandual (1):
  mm/pgtable/debug: Add test validating architecture page table helpers

 mm/Kconfig.debug       |  14 ++
 mm/Makefile            |   1 +
 mm/arch_pgtable_test.c | 400 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 415 insertions(+)
 create mode 100644 mm/arch_pgtable_test.c

-- 
2.20.1
