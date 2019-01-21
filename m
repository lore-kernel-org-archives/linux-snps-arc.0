From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Sun, 20 Jan 2019 16:26:29 -0800
Subject: [GIT PULL] ARC updates for 5.0-rc3
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0bc45ec8-3470-917b-fff6-6ddffafeda98@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

ARC updates for 5.0-rc3 (or rc4, it is likely too late for sunday)

Please pull !

Thx,
-Vineet
------------------------------->
The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.0-rc3

for you to fetch changes up to e6a72b7daeeb521753803550f0ed711152bb2555:

  ARCv2: lib: memeset: fix doing prefetchw outside of buffer (2019-01-17 16:24:39
-0800)

----------------------------------------------------------------
ARC updates for 5.0-rc3

 - Perf support for raw events

 - boot log printing: return stack, action points

 - fix memset to avoid prefetchw bleeding past end of buffer

 - do_page_fault fix for mmap_sem held while returning to userspace

 - other miscll fixes

----------------------------------------------------------------
Eugeniy Paltsev (8):
      ARC: fix __ffs return value to avoid build warnings
      ARC: adjust memblock_reserve of kernel memory
      ARC: perf: map generic branches to correct hardware condition
      ARC: perf: trivial code cleanup
      ARC: perf: introduce Kernel PMU events support
      ARC: perf: move HW events mapping to separate function
      ARC: perf: avoid kernel killing where it is possible
      ARCv2: lib: memeset: fix doing prefetchw outside of buffer

Masahiro Yamada (1):
      arc: remove redundant kernel-space generic-y

Vineet Gupta (5):
      ARCv2: boot log: BPU return stack depth
      ARC: boot log: print Action point details
      ARC: show_regs: lockdep: avoid page allocator...
      ARC: show_regs: lockdep: re-enable preemption
      ARC: mm: do_page_fault fixes #1: relinquish mmap_sem if signal arrives while
handle_mm_fault

 arch/arc/include/asm/Kbuild       |   4 -
 arch/arc/include/asm/arcregs.h    |  12 +-
 arch/arc/include/asm/bitops.h     |   6 +-
 arch/arc/include/asm/perf_event.h |   3 +-
 arch/arc/kernel/perf_event.c      | 241 ++++++++++++++++++++++++++++----------
 arch/arc/kernel/setup.c           |  27 +++--
 arch/arc/kernel/troubleshoot.c    |  30 +++--
 arch/arc/lib/memset-archs.S       |  40 +++++--
 arch/arc/mm/fault.c               |  13 +-
 arch/arc/mm/init.c                |   3 +-
 10 files changed, 276 insertions(+), 103 deletions(-)
