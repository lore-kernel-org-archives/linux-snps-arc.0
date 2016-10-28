From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 28 Oct 2016 16:46:41 -0700
Subject: [GIT PULL] ARC updates for 4.9-rc3
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a586a3c9-82e8-8445-264d-803b8758a202@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull

Thx,
-Vineet

------>
The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.9-rc3

for you to fetch changes up to b75dcd9c7d352c7d9ea9010e95c708595094896a:

  ARC: module: print pretty section names (2016-10-28 10:10:29 -0700)

----------------------------------------------------------------
ARC updates for 4.9-rc4

- supporting IDU intc for UP builds

- Support gz, lzma compressed uImage [Daniel Mentz]

- Adjust /proc/cpuinfo for non-continuous cpu ids [Noam Camus]

- syscall for userspace cmpxchg assist for configs lacking hardware atomics

- rework of boot log printing mainly for identifying older arc700 cores

- retiring some old code, build toggles

----------------------------------------------------------------
Daniel Mentz (1):
      ARC: [build] Support gz, lzma compressed uImage

Noam Camus (1):
      ARC: Adjust cpuinfo for non-continuous cpu ids

Vineet Gupta (13):
      ARCv2: intc: untangle SMP, MCIP and IDU
      ARC: fix build warning in elf.h
      ARC: syscall for userspace cmpxchg assist
      ARCv2: IOC: use @ioc_enable not @ioc_exist where intended
      ARCv2: boot log: print IOC exists as well as enabled status
      ARC: boot log: refactor printing abt features not captured in BCRs
      ARC: boot log: don't assume SWAPE instruction support
      ARC: boot log: remove awkward space comma from MMU line
      ARC: boot log: refactor cpu name/release printing
      ARC: build: retire old toggles
      ARC: mm: retire ARC_DBG_TLB_MISS_COUNT...
      ARC: module: elide loop to save reference to .eh_frame
      ARC: module: print pretty section names

 arch/arc/Kconfig                   |  27 ++++-----
 arch/arc/Makefile                  |   3 -
 arch/arc/boot/Makefile             |  16 +++++-
 arch/arc/include/asm/arcregs.h     |   3 +-
 arch/arc/include/asm/cache.h       |   2 +-
 arch/arc/include/asm/elf.h         |   2 +-
 arch/arc/include/asm/mcip.h        |  16 ++++++
 arch/arc/include/asm/module.h      |   1 +
 arch/arc/include/asm/setup.h       |   6 +-
 arch/arc/include/asm/syscalls.h    |   1 +
 arch/arc/include/uapi/asm/unistd.h |   9 +--
 arch/arc/kernel/mcip.c             |  31 ++++------
 arch/arc/kernel/module.c           |  53 +++++++++--------
 arch/arc/kernel/process.c          |  33 +++++++++++
 arch/arc/kernel/setup.c            | 113 +++++++++++++++++++++----------------
 arch/arc/kernel/troubleshoot.c     | 110 ------------------------------------
 arch/arc/mm/cache.c                |  19 +++----
 arch/arc/mm/dma.c                  |   4 +-
 arch/arc/mm/tlb.c                  |   6 +-
 arch/arc/mm/tlbex.S                |  21 -------
 20 files changed, 203 insertions(+), 273 deletions(-)
