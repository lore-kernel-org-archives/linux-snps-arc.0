From: noamca@mellanox.com (Noam Camus)
Date: Sun, 28 May 2017 09:51:57 +0300
Subject: [PATCH v2 00/11] ARC plat-eznps upstream cont.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

Change Log
-----------
v1 --> v2:
Outcome of Alexey Brodkin comments
1) Turned mem_service into weak symbol, so it can be override
by any platform
2) remove ifedf wrapper on '88' lable at assembly of TLB exception.


With this patch set I continue the effort of upstreaming the
eznps platform for arch/arc.

it combine of patches for typos and other for HW erratas and some
for performance.
All selected as ones that may be obvious for merge with arc next.

This was based on for-curr branch as the mos updated one I found
at this point of time. 

Liav Rehana (2):
  ARC: typo fix in mm/fault.c
  ARC: typos fix in kernel/entry-compact.S

Noam Camus (9):
  ARC: set level of log per CPU during boot to be debug level
  ARC: send ipi to all cpus sharing task mm in case of page fault
  ARC: [plat-eznps] typo fix at Kconfig
  ARC: [plat-eznps] Fix TLB Errata
  ARC: [plat-eznps] disabled stall counter due to a HW bug
  ARC: [plat-eznps] spinlock aware for MTM
  ARC: [plat-eznps] use schd.wft instruction instead of sleep at idle
    task
  ARC: enable platform specific mem_service implementation
  ARC: [plat-eznps] Handle memory error as an exception

 arch/arc/include/asm/cacheflush.h       |    3 ++-
 arch/arc/include/asm/spinlock.h         |    6 ++++++
 arch/arc/kernel/entry-compact.S         |   25 +++++++++++++------------
 arch/arc/kernel/process.c               |    7 +++++++
 arch/arc/kernel/setup.c                 |    6 +++---
 arch/arc/kernel/smp.c                   |    4 ++--
 arch/arc/mm/cache.c                     |   14 +++++++++++---
 arch/arc/mm/fault.c                     |    2 +-
 arch/arc/mm/tlb.c                       |    4 ++--
 arch/arc/mm/tlbex.S                     |    9 +++++++++
 arch/arc/plat-eznps/Kconfig             |   15 +++++++++++++--
 arch/arc/plat-eznps/entry.S             |   14 ++++++++++++++
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 arch/arc/plat-eznps/mtm.c               |    2 --
 14 files changed, 84 insertions(+), 28 deletions(-)
