From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 16 Jul 2019 20:22:58 +0000
Subject: [GIT PULL] ARC updates for 5.3-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <99fc2ead-d7d8-1c54-b493-02e79e2fc24e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Bunch of changes for ARC, some long due, for the new release. Please pull.

Thx,
-Vineet
------------------------>
The following changes since commit 6fbc7275c7a9ba97877050335f290341a1fd8dbf:

  Linux 5.2-rc7 (2019-06-30 11:25:36 +0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.3-rc1

for you to fetch changes up to 24a20b0a443fd485852d51d08e98bbd9d212e0ec:

  ARC: [plat-hsdk]: Enable AXI DW DMAC in defconfig (2019-07-08 09:24:47 +0100)

----------------------------------------------------------------
ARC updates for 5.3-rc1

 - long due rewrite of do_page_fault

 - refactoring of entry/exit code to utilize the double load/store instructions

 - hsdk platform updates

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: [haps] Add Virtio support

Arnd Bergmann (1):
      ARC: hide unused function unw_hdr_alloc

Eugeniy Paltsev (2):
      ARC: [plat-hsdk]: enable DW SPI controller
      ARC: [plat-hsdk]: Enable AXI DW DMAC in defconfig

Vineet Gupta (14):
      ARC: mm: do_page_fault refactor #1: remove label @good_area
      ARC: mm: do_page_fault refactor #2: remove short lived variable
      ARC: mm: do_page_fault refactor #3: tidyup vma access permission code
      ARC: mm: do_page_fault refactor #4: consolidate retry related logic
      ARC: mm: do_page_fault refactor #5: scoot no_context to end
      ARC: mm: do_page_fault refactor #6: error handlers to use same pattern
      ARC: mm: do_page_fault refactor #7: fold the various error handling
      ARC: mm: do_page_fault refactor #8: release mmap_sem sooner
      ARCv2: entry: comments about hardware auto-save on taken interrupts
      ARCv2: entry: push out the Z flag unclobber from common EXCEPTION_PROLOGUE
      ARCv2: entry: avoid a branch
      ARCv2: entry: rewrite to enable use of double load/stores LDD/STD
      ARC: entry: EV_Trap expects r10 (vs. r9) to have exception cause
      ARCv2: entry: simplify return to Delay Slot via interrupt

 arch/arc/boot/dts/haps_hs.dts        |  30 +++
 arch/arc/boot/dts/hsdk.dts           |  14 ++
 arch/arc/configs/haps_hs_defconfig   |   5 +-
 arch/arc/configs/hsdk_defconfig      |   5 +
 arch/arc/include/asm/entry-arcv2.h   | 361 ++++++++++++++++++-----------------
 arch/arc/include/asm/entry-compact.h |   4 +-
 arch/arc/include/asm/linkage.h       |  18 ++
 arch/arc/kernel/asm-offsets.c        |   7 +
 arch/arc/kernel/entry-arcv2.S        |  62 ++----
 arch/arc/kernel/entry-compact.S      |   2 +-
 arch/arc/kernel/entry.S              |   4 +-
 arch/arc/kernel/unwind.c             |   9 +-
 arch/arc/mm/fault.c                  | 185 ++++++++----------
 arch/arc/mm/tlbex.S                  |  11 ++
 14 files changed, 377 insertions(+), 340 deletions(-)
