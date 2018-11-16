From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 16 Nov 2018 13:44:24 +0300
Subject: [PATCH 0/3] ARC: ARCv2: Introduce SmaRT support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181116104427.25264-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add compile-time 'ARC_SMART_TRACE' option for enabling SmaRT support.
Small real time trace (SmaRT) is an optional on-chip debug hardware
component that captures instruction-trace history. It stores the
address of the most recent non-sequential instructions executed into
internal buffer.

NOTE:
this PATCH series has prerequisite:
  http://patchwork.ozlabs.org/patch/986820/

Changes RFCv2->PATCHv1:
 * Move smart_exists, smart_supported and smart_stack_size functions
   to smart.h
 * Improve Kconfig SmaRT help description.
 * Other minor changes.

Changes RFCv1->RFCv2:
 * Changes in output display:
   * Only print VMAs if they are changed.
   * Split entry for two lines and print source and destination
     addresses on different lines.
 * Add procfs options to configure/suspend SmaRT in runtime.
 * Add SmaRT version check. Limit supported SmaRT versions to >= 0x03.
 * Move all SmaRT related stuff to smart.h and smart.c
 * Other minor changes.

Eugeniy Paltsev (3):
  ARC: split show_faulting_vma for logic and representation parts
  ARC: ARCv2: Introduce SmaRT support
  ARC: show detaled SmaRT configuration in mumbojumbo

 arch/arc/Kconfig               |  12 ++
 arch/arc/include/asm/arcregs.h |  23 ++++
 arch/arc/include/asm/bug.h     |   9 ++
 arch/arc/include/asm/smart.h   |  62 ++++++++++
 arch/arc/kernel/Makefile       |   1 +
 arch/arc/kernel/setup.c        |  21 +++-
 arch/arc/kernel/smart.c        | 253 +++++++++++++++++++++++++++++++++++++++++
 arch/arc/kernel/traps.c        |   8 ++
 arch/arc/kernel/troubleshoot.c |  46 ++++++--
 arch/arc/mm/fault.c            |   2 +
 10 files changed, 420 insertions(+), 17 deletions(-)
 create mode 100644 arch/arc/include/asm/smart.h
 create mode 100644 arch/arc/kernel/smart.c

-- 
2.14.5
