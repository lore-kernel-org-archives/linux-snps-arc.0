From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu,  8 Nov 2018 10:11:58 -0800
Subject: [PATCH -next-akpm 0/3] Add support for fast mremap
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181108181201.88826-1-joelaf@google.com>
To: linux-snps-arc@lists.infradead.org

Hi,
Here is the "fast mremap" series. This just a repost with Kirill's Acked-bys
added and William's Reviewed-by added. Also fixed a UML build error reported
last week. I would like this to be considered for linux -next. The performance
numbers in the series are for testing on x86. The config enablement patch for
arm64 will be posted in the future after testing (see notes below).

List of patches in series:

(1) mm: select HAVE_MOVE_PMD in x86 for faster mremap

(2) mm: speed up mremap by 20x on large regions (v5)
v1->v2: Added support for per-arch enablement (Kirill Shutemov)
v2->v3: Updated commit message to state the optimization may also
	run for non-thp type of systems (Daniel Col).
v3->v4: Remove useless pmd_lock check (Kirill Shutemov)
	Rebased ontop of Linus's master, updated perf results based
        on x86 testing. Added Kirill's Acks.
v4->v5: Added William's Reviewed-by. Fixed arch/um build error
	due to set_pmd_at not defined. Rebased on linux-next/akpm.

(3) mm: treewide: remove unused address argument from pte_alloc functions (v2)
v1->v2: fix arch/um/ prototype which was missed in v1 (Anton Ivanov)
        update changelog with manual fixups for m68k and microblaze.

not included - (4) mm: select HAVE_MOVE_PMD in arm64 for faster mremap
    This patch is dropped since last posting pending further performance
    testing on arm64 with new TLB gather updates. See notes in patch
    titled "mm: speed up mremap by 500x on large regions" for more
    details.

Joel Fernandes (Google) (3):
mm: treewide: remove unused address argument from pte_alloc functions
(v2)
mm: speed up mremap by 20x on large regions (v5)
mm: select HAVE_MOVE_PMD in x86 for faster mremap

arch/Kconfig                                 |  5 ++
arch/alpha/include/asm/pgalloc.h             |  6 +-
arch/arc/include/asm/pgalloc.h               |  5 +-
arch/arm/include/asm/pgalloc.h               |  4 +-
arch/arm64/include/asm/pgalloc.h             |  4 +-
arch/hexagon/include/asm/pgalloc.h           |  6 +-
arch/ia64/include/asm/pgalloc.h              |  5 +-
arch/m68k/include/asm/mcf_pgalloc.h          |  8 +--
arch/m68k/include/asm/motorola_pgalloc.h     |  4 +-
arch/m68k/include/asm/sun3_pgalloc.h         |  6 +-
arch/microblaze/include/asm/pgalloc.h        | 19 +-----
arch/microblaze/mm/pgtable.c                 |  3 +-
arch/mips/include/asm/pgalloc.h              |  6 +-
arch/nds32/include/asm/pgalloc.h             |  5 +-
arch/nios2/include/asm/pgalloc.h             |  6 +-
arch/openrisc/include/asm/pgalloc.h          |  5 +-
arch/openrisc/mm/ioremap.c                   |  3 +-
arch/parisc/include/asm/pgalloc.h            |  4 +-
arch/powerpc/include/asm/book3s/32/pgalloc.h |  4 +-
arch/powerpc/include/asm/book3s/64/pgalloc.h | 12 ++--
arch/powerpc/include/asm/nohash/32/pgalloc.h |  4 +-
arch/powerpc/include/asm/nohash/64/pgalloc.h |  6 +-
arch/powerpc/mm/pgtable-book3s64.c           |  2 +-
arch/powerpc/mm/pgtable_32.c                 |  4 +-
arch/riscv/include/asm/pgalloc.h             |  6 +-
arch/s390/include/asm/pgalloc.h              |  4 +-
arch/sh/include/asm/pgalloc.h                |  6 +-
arch/sparc/include/asm/pgalloc_32.h          |  5 +-
arch/sparc/include/asm/pgalloc_64.h          |  6 +-
arch/sparc/mm/init_64.c                      |  6 +-
arch/sparc/mm/srmmu.c                        |  4 +-
arch/um/include/asm/pgalloc.h                |  4 +-
arch/um/kernel/mem.c                         |  4 +-
arch/unicore32/include/asm/pgalloc.h         |  4 +-
arch/x86/Kconfig                             |  1 +
arch/x86/include/asm/pgalloc.h               |  4 +-
arch/x86/mm/pgtable.c                        |  4 +-
arch/xtensa/include/asm/pgalloc.h            |  8 +--
include/linux/mm.h                           | 13 ++--
mm/huge_memory.c                             |  8 +--
mm/kasan/kasan_init.c                        |  2 +-
mm/memory.c                                  | 17 +++---
mm/migrate.c                                 |  2 +-
mm/mremap.c                                  | 64 +++++++++++++++++++-
mm/userfaultfd.c                             |  2 +-
virt/kvm/arm/mmu.c                           |  2 +-
46 files changed, 165 insertions(+), 147 deletions(-)

--
2.19.1.930.g4563a0d9d0-goog
