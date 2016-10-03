From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 3 Oct 2016 12:19:29 -0700
Subject: [GIT PULL] ARC changes for 4.9-rc1
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c01a88f1-3a1f-98fe-777f-c141bbf8b2e0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet
---------------------------->
The following changes since commit 3be7988674ab33565700a37b210f502563d932e6:

  Linux 4.8-rc7 (2016-09-18 17:27:41 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.9-rc1

for you to fetch changes up to ef25bacbb0193f98e9b297c00b54913086571094:

  ARC: [plat*] enables MODULE* (2016-09-30 14:59:48 -0700)

----------------------------------------------------------------
ARC changes for 4.9-rc1

 - ARCv2 support for native 64-bit atomics using LLOCK/SCONDD instructions
 - Support for upcoming 3.0 release of HS38 cores
 - Dwarf unwinder improvements
   - Enabling unwinding out of hand written assembler code using CFI pseudo-ops
   - switching to .eh_frame (as opposed to historic .debug_frame)
   - getting rid of bunch of adhoc band-aids in the process
 - Miscll fixes
   - perf supporting generic cache-references and cache-misses (Alexey)
   - default NODE_SHIFT (Noam Camus)
   - usage of KFLAG instruction to set IE (Yuriy)
 - Platforms
   - Adding "model" proprrty across the DT (Alexey)
   - Enabling MODULE_* in defconfigs

----------------------------------------------------------------
Alexey Brodkin (2):
      arc: Add "model" properly in device tree description of all boards
      arc: perf: Enable generic "cache-references" and "cache-misses" events

Noam Camus (2):
      ARC: [plat-eznps] add missing atomic_fetch_xxx operations
      ARC: CONFIG_NODES_SHIFT fix default values

Vineet Gupta (14):
      ARCv2: Add support for ZeBu Emulation platform for HS cores
      ARCv2: identify HS38 rel 3.0 cores
      ARCv2: Support dynamic peripheral address space in HS38 rel 3.0 cores
      ARCv2: Implement atomic64 based on LLOCKD/SCONDD instructions
      ARC: module: support R_ARC_32_PCREL relocation
      ARC: dw2 unwind: factor CIE specifics for .eh_frame/.debug_frame
      ARC: dw2 unwind: switch to .eh_frame based unwinding
      ARC: dw2 unwind: don't force dwarf 2
      ARC: entry: make ret_from_system_call local label
      ARC: dw2 unwind: add infrastructure for adding cfi pseudo ops to asm
      ARC: dw2 unwind: enable cfi pseudo ops in string lib
      ARC: .exit.* sections can be discarded in .eh_frame regime
      ARCv2: fix local_save_flags
      ARC: [plat*] enables MODULE*

Yuriy Kolerov (1):
      ARCv2: intc: Use kflag if STATUS32.IE must be reset

 arch/arc/Kconfig                       |   6 +-
 arch/arc/Makefile                      |   7 +-
 arch/arc/boot/dts/abilis_tb100_dvk.dts |   1 +
 arch/arc/boot/dts/abilis_tb101_dvk.dts |   1 +
 arch/arc/boot/dts/axs101.dts           |   1 +
 arch/arc/boot/dts/axs103.dts           |   1 +
 arch/arc/boot/dts/axs103_idu.dts       |   1 +
 arch/arc/boot/dts/nsim_700.dts         |   1 +
 arch/arc/boot/dts/nsim_hs.dts          |   1 +
 arch/arc/boot/dts/nsim_hs_idu.dts      |   1 +
 arch/arc/boot/dts/nsimosci.dts         |   1 +
 arch/arc/boot/dts/nsimosci_hs.dts      |   1 +
 arch/arc/boot/dts/nsimosci_hs_idu.dts  |   1 +
 arch/arc/boot/dts/vdk_hs38.dts         |   1 +
 arch/arc/boot/dts/vdk_hs38_smp.dts     |   1 +
 arch/arc/boot/dts/zebu_hs.dts          |  69 +++++++++
 arch/arc/boot/dts/zebu_hs_idu.dts      |  85 +++++++++++
 arch/arc/configs/axs101_defconfig      |   3 +
 arch/arc/configs/axs103_defconfig      |   3 +
 arch/arc/configs/axs103_smp_defconfig  |   3 +
 arch/arc/configs/nsim_hs_defconfig     |   5 +-
 arch/arc/configs/nsim_hs_smp_defconfig |   3 +
 arch/arc/configs/zebu_hs_defconfig     |  86 +++++++++++
 arch/arc/configs/zebu_hs_smp_defconfig |  89 +++++++++++
 arch/arc/include/asm/arcregs.h         |  10 +-
 arch/arc/include/asm/atomic.h          | 263 ++++++++++++++++++++++++++++++++-
 arch/arc/include/asm/cache.h           |   2 +-
 arch/arc/include/asm/dwarf.h           |  38 +++++
 arch/arc/include/asm/elf.h             |   3 +-
 arch/arc/include/asm/irqflags-arcv2.h  |   2 +-
 arch/arc/include/asm/linkage.h         |  12 ++
 arch/arc/include/asm/perf_event.h      |   3 +
 arch/arc/kernel/ctx_sw_asm.S           |   3 +-
 arch/arc/kernel/entry.S                |  24 +--
 arch/arc/kernel/intc-arcv2.c           |   2 +-
 arch/arc/kernel/module.c               |  19 +--
 arch/arc/kernel/perf_event.c           |   6 +-
 arch/arc/kernel/setup.c                |   5 +-
 arch/arc/kernel/unwind.c               |  24 ++-
 arch/arc/kernel/vmlinux.lds.S          |  21 +--
 arch/arc/lib/memcmp.S                  |   4 +-
 arch/arc/lib/memcpy-700.S              |   4 +-
 arch/arc/lib/memcpy-archs.S            |   4 +-
 arch/arc/lib/memset-archs.S            |   8 +-
 arch/arc/lib/memset.S                  |   8 +-
 arch/arc/lib/strchr-700.S              |   4 +-
 arch/arc/lib/strcmp-archs.S            |   4 +-
 arch/arc/lib/strcmp.S                  |   4 +-
 arch/arc/lib/strcpy-700.S              |   4 +-
 arch/arc/lib/strlen.S                  |   4 +-
 arch/arc/mm/cache.c                    |  23 ++-
 arch/arc/mm/ioremap.c                  |   2 +-
 arch/arc/plat-sim/platform.c           |   1 +
 53 files changed, 769 insertions(+), 114 deletions(-)
 create mode 100644 arch/arc/boot/dts/zebu_hs.dts
 create mode 100644 arch/arc/boot/dts/zebu_hs_idu.dts
 create mode 100644 arch/arc/configs/zebu_hs_defconfig
 create mode 100644 arch/arc/configs/zebu_hs_smp_defconfig
 create mode 100644 arch/arc/include/asm/dwarf.h
