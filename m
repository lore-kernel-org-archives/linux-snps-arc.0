From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 05:34:10 +0300
Subject: [PATCH 00/10] ARC plat-eznps upstream cont.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamca@mellanox.com>

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

Noam Camus (8):
  ARC: set level of log per CPU during boot to be debug level
  ARC: send ipi to all cpus sharing task mm in case of page fault
  ARC: [plat-eznps] typo fix at Kconfig
  ARC: [plat-eznps] Fix TLB Errata
  ARC: [plat-eznps] disabled stall counter due to a HW bug
  ARC: [plat-eznps] spinlock aware for MTM
  ARC: [plat-eznps] use schd.wft instruction instead of sleep at idle
    task
  ARC: [plat-eznps] Handle memory error as an exception

 arch/arc/include/asm/cacheflush.h       |    3 +-
 arch/arc/include/asm/spinlock.h         |    6 +++++
 arch/arc/kernel/entry-compact.S         |   33 ++++++++++++++++++++----------
 arch/arc/kernel/process.c               |    7 ++++++
 arch/arc/kernel/setup.c                 |    6 ++--
 arch/arc/kernel/smp.c                   |    4 +-
 arch/arc/mm/cache.c                     |   14 ++++++++++--
 arch/arc/mm/fault.c                     |    2 +-
 arch/arc/mm/tlb.c                       |    4 +-
 arch/arc/mm/tlbex.S                     |   10 +++++++++
 arch/arc/plat-eznps/Kconfig             |   15 ++++++++++++-
 arch/arc/plat-eznps/include/plat/ctop.h |    1 +
 arch/arc/plat-eznps/mtm.c               |    2 -
 13 files changed, 80 insertions(+), 27 deletions(-)
