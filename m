From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 22 Aug 2016 11:05:54 -0700
Subject: [GIT PULL] ARC fixes for 4.8 rc4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <58648cc6-9a62-e8e0-868e-584120739f88@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet

-------------------->
The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.8-rc4-fixes

for you to fetch changes up to c57653dc94d0db7bf63067433ceaa97bdcd0a312:

  ARC: export __udivdi3 for modules (2016-08-19 14:09:33 -0700)

----------------------------------------------------------------
ARC Fixes for 4.8-rc4

- Support for Syscall ABI v4 with upstream gcc 6.x

- Lockdep fix (Daniel Mentz)

- gdb register clobber (Liav Rehana)

- Couple of missing exports for modules

- Other fixes here and there

----------------------------------------------------------------
Daniel Mentz (1):
      ARC: Call trace_hardirqs_on() before enabling irqs

Liav Rehana (1):
      ARC: use correct offset in pt_regs for saving/restoring user mode r25

Vineet Gupta (5):
      ARC: Elide redundant setup of DMA callbacks
      ARC: Support syscall ABI v4
      ARC: export kmap
      ARC: mm: fix build breakage with STRICT_MM_TYPECHECKS
      ARC: export __udivdi3 for modules

 arch/arc/include/asm/entry.h            |  4 ++--
 arch/arc/include/asm/irqflags-compact.h |  2 +-
 arch/arc/include/asm/pgtable.h          |  2 +-
 arch/arc/include/uapi/asm/elf.h         | 11 +++++++++--
 arch/arc/kernel/arcksyms.c              |  2 ++
 arch/arc/kernel/process.c               |  2 +-
 arch/arc/kernel/setup.c                 |  6 ++++--
 arch/arc/mm/cache.c                     |  9 +++++++++
 arch/arc/mm/highmem.c                   |  1 +
 9 files changed, 30 insertions(+), 9 deletions(-)
