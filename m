From: noamca@mellanox.com (Noam Camus)
Date: Tue, 13 Jun 2017 17:03:44 +0300
Subject: [PATCH v2 00/12] plat-eznps upstream cont. set 2
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Chanlog:
V1 -> V2
1) I added "Handle memory error as an exception" patch from previous set
   It now turn do_memory_error() into weak sybol.
   It is then overriden by NPS400 platform, to simply call die().
2) This set is now based on arc-next branch
Summary:
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

Noam Camus (9):
  ARC: [plat-eznps] Handle memory error as an exception
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
 arch/arc/kernel/traps.c                         |    2 +-
 arch/arc/mm/cache.c                             |   14 ++-
 arch/arc/mm/fault.c                             |    8 ++
 arch/arc/mm/highmem.c                           |   16 ++-
 arch/arc/mm/init.c                              |    6 +
 arch/arc/mm/tlb.c                               |    4 +-
 arch/arc/mm/tlbex.S                             |   31 ++++++
 arch/arc/plat-eznps/Kconfig                     |   23 ++++
 arch/arc/plat-eznps/Makefile                    |    2 +-
 arch/arc/plat-eznps/ctop.c                      |   33 ++++++
 arch/arc/plat-eznps/entry.S                     |    2 +-
 arch/arc/plat-eznps/include/plat/ctop.h         |    1 +
 arch/arc/plat-eznps/mtm.c                       |   72 +++++++++++++-
 30 files changed, 510 insertions(+), 29 deletions(-)
 create mode 100644 arch/arc/include/asm/topology.h
 create mode 100644 arch/arc/kernel/topology.c
 create mode 100644 arch/arc/plat-eznps/ctop.c
