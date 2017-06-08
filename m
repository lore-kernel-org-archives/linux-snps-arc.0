From: noamca@mellanox.com (Noam Camus)
Date: Thu,  8 Jun 2017 18:20:24 +0300
Subject: [PATCH 00/11] plat-eznps upstream cont. set 2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496935235-46507-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

With this patch set I continue the effort of upstreaming the eznps platform for arch/arc.

It comprise of couple of patches from last set yet not accepted,
patches for HW erratas and some misc extensions such for HIGHMEM / NUMA.

This set got more generic ARC changes than previous set.
Additional ifdef seem like unavoidable, however it may seem Ugly.
Let's see if we need to do it more elegant.

Elad Kanfi (1):
  ARC: [plat-eznps] avoid toggling of DPC register

Liav Rehana (2):
  ARC: [plat-eznps] Update the init sequence of aux regs per cpu.
  ARC: [plat-eznps] handle dedicated AUX registers

Noam Camus (8):
  ARC: set level of log per CPU during boot to be debug level
  ARC: send ipi to all cpus sharing task mm in case of page fault
  ARC: Allow irq threading
  ARC: Add CPU topology
  ARC: Support more than one PGDIR for KVADDR
  ARC: [NUMA] added CONFIG_NUMA for plat-eznps
  ARC: [plat-eznps] new command line argument for HW scheduler at MTM
  ARC: [plat-eznps] Save/Restore extra auxiliary registers

 Documentation/admin-guide/kernel-parameters.txt |    9 ++
 arch/arc/Kconfig                                |   48 +++++++++
 arch/arc/include/asm/Kbuild                     |    1 -
 arch/arc/include/asm/arcregs.h                  |    7 ++
 arch/arc/include/asm/cacheflush.h               |    3 +-
 arch/arc/include/asm/entry-compact.h            |   24 +++++
 arch/arc/include/asm/highmem.h                  |    8 +-
 arch/arc/include/asm/pgtable.h                  |    9 ++
 arch/arc/include/asm/processor.h                |    8 +-
 arch/arc/include/asm/ptrace.h                   |    5 +
 arch/arc/include/asm/switch_to.h                |   11 ++
 arch/arc/include/asm/topology.h                 |   40 +++++++
 arch/arc/kernel/Makefile                        |    1 +
 arch/arc/kernel/process.c                       |    4 +
 arch/arc/kernel/setup.c                         |   13 ++-
 arch/arc/kernel/smp.c                           |    9 ++-
 arch/arc/kernel/topology.c                      |  125 +++++++++++++++++++++++
 arch/arc/mm/cache.c                             |   14 ++-
 arch/arc/mm/fault.c                             |    8 ++
 arch/arc/mm/highmem.c                           |   16 ++-
 arch/arc/mm/init.c                              |    6 +
 arch/arc/mm/tlb.c                               |    4 +-
 arch/arc/mm/tlbex.S                             |   31 ++++++
 arch/arc/plat-eznps/Kconfig                     |   11 ++
 arch/arc/plat-eznps/Makefile                    |    2 +-
 arch/arc/plat-eznps/ctop.c                      |   33 ++++++
 arch/arc/plat-eznps/entry.S                     |    2 +-
 arch/arc/plat-eznps/include/plat/ctop.h         |    1 +
 arch/arc/plat-eznps/mtm.c                       |   61 +++++++++++-
 29 files changed, 486 insertions(+), 28 deletions(-)
 create mode 100644 arch/arc/include/asm/topology.h
 create mode 100644 arch/arc/kernel/topology.c
 create mode 100644 arch/arc/plat-eznps/ctop.c
