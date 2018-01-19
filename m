From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 19 Jan 2018 15:08:42 +0000
Subject: [U-Boot] Please pull ARC changes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1516374522.3150.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Tom,

Please pull a series for ARC.

Here we fix L2 cache (AKA SLC) operation found once we disabled
usage of IO-coherency in U-Boot, improve support of clock-generation
unit (AKA CGU) and also doing some minor clean-up and updates.

The following changes since commit 086ebcd40e9bf8efc520f1b177fd8e3cc0e506fa:

  Merge git://git.denx.de/u-boot-fsl-qoriq (2018-01-17 13:48:35 -0500)

are available in the Git repository at:

  git://git.denx.de/u-boot-arc.git 

for you to fetch changes up to 8f44e1ee799d75eb2b296a7525dc0c3003a3644c:

  ARC: devboards: Allow huge uImages (up to 128 MiB) (2018-01-19 17:59:35 +0300)

----------------------------------------------------------------
Alexey Brodkin (1):
      ARC: devboards: Allow huge uImages (up to 128 MiB)

Eugeniy Paltsev (9):
      ARC: ARCv2: Cache: Fixed operation without IOC
      ARC: Cache: Disable IOC by default
      ARC: Cache: Fix style violations reported by checkpatch
      ARC: HSDK: Hang on panic
      ARC: HSDK: CGU: Update AXI, TUN, ARC clock options
      ARC: HSDK: CGU: Use plat data instead of priv data
      ARC: HSDK: CGU: Add 'Hz' when printing clock frequency
      ARC: HSDK: DTS: Add cgu-clk node
      ARC: Invalidate instruction and data caches early on boot

 arch/arc/dts/hsdk.dts                     |   6 ++++
 arch/arc/include/asm/arcregs.h            |   7 ++++
 arch/arc/lib/cache.c                      | 208 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------
-------
 arch/arc/lib/start.S                      |  12 +++++++
 configs/hsdk_defconfig                    |   1 +
 drivers/clk/clk-hsdk-cgu.c                | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 include/configs/axs10x.h                  |   2 +-
 include/configs/hsdk.h                    |   2 +-
 include/dt-bindings/clock/snps,hsdk-cgu.h |   8 +++--
 9 files changed, 328 insertions(+), 95 deletions(-)

-Alexey
