From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 27 Apr 2016 19:45:52 +0530
Subject: [GIT PULL] ARC fixes for 4.6-rc4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5720C998.9020308@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

Please pull.

Thx,
-Vineet
-------------->
The following changes since commit c3b46c73264b03000d1e18b22f5caf63332547c9:

  Linux 4.6-rc4 (2016-04-17 19:13:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.6-rc6-fixes

for you to fetch changes up to 1b10cb21d888c021bedbe678f7c26aee1bf04ffa:

  ARC: add support for reserved memory defined by device tree (2016-04-27 17:06:56
+0530)

----------------------------------------------------------------
ARC fixes for 4.6-rc6

 - LOCKDEP now words for ARCv2 builds
 - Enabling DT reserved-memory binding to work (for forthcoming HDMI driver)

----------------------------------------------------------------
Alexey Brodkin (2):
      ARC: support generic per-device coherent dma mem
      ARC: add support for reserved memory defined by device tree

Eric Engestrom (1):
      Documentation: dt: arc: fix spelling mistakes

Evgeny Voevodin (1):
      ARCv2: Enable LOCKDEP

 .../devicetree/bindings/arc/archs-pct.txt          |  2 +-
 Documentation/devicetree/bindings/arc/pct.txt      |  2 +-
 arch/arc/Kconfig                                   |  2 ++
 arch/arc/include/asm/irqflags-arcv2.h              | 36 +++++++++++++++++++++-
 arch/arc/kernel/entry-arcv2.S                      | 10 +++++-
 arch/arc/kernel/entry-compact.S                    |  3 ++
 arch/arc/mm/init.c                                 |  4 +++
 7 files changed, 55 insertions(+), 4 deletions(-)
