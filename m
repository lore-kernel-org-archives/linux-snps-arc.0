From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Fri, 28 Jul 2017 15:07:00 -0700
Subject: [PATCH 0/5] Initial support for Adaptrum Anarion SOC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170728220707.13960-1-alex.g@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

We've reached the point where we can boot a basic linux system on the
new SOC, and I'm very excited to share the code I've developed in the
process.

This series includes a new driver for the QSPI controller on the chip,
although the flash layout is not specified in the devicetree. The
flash layout is still being worked on, as it depends on finalizing
other components.

The scope of this series is to add enough support to get to a working
system. Keep in mind that the SOC is emulated on an FPGA, and things
are not running too fast. For this reason, as there's yet no way to
get any meaningful speed measurements with the CPU clock at 12 MHz.
Once the silicon arrives, I'll look at the performance aspect and
other aspects that we simply can't support on an FPGA.

Alex

Alexandru Gagniuc (5):
  of: Add vendor prefix for Adaptrum, Inc.
  ARC: [plat-anarion] Add early boot workarounds for Anarion SOC
  net: stmmac: Add Adaptrum Anarion GMAC glue layer
  mtd: spi-nor: Add driver for Adaptrum Anarion QSPI controller
  ARC: DTS: Add device-tree for Anarion-based development board

 .../devicetree/bindings/mtd/anarion-quadspi.txt    |  22 +
 .../devicetree/bindings/net/anarion-gmac.txt       |  25 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arc/Kconfig                                   |   1 +
 arch/arc/Makefile                                  |   1 +
 arch/arc/boot/dts/adaptrum_anarion.dtsi            | 107 +++++
 arch/arc/boot/dts/adaptrum_anarion_fpga.dts        |  49 +++
 arch/arc/plat-anarion/Kconfig                      |  10 +
 arch/arc/plat-anarion/Makefile                     |   7 +
 arch/arc/plat-anarion/platform.c                   |  39 ++
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/anarion-quadspi.c              | 490 +++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   9 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 151 +++++++
 16 files changed, 921 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/anarion-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/net/anarion-gmac.txt
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts
 create mode 100644 arch/arc/plat-anarion/Kconfig
 create mode 100644 arch/arc/plat-anarion/Makefile
 create mode 100644 arch/arc/plat-anarion/platform.c
 create mode 100644 drivers/mtd/spi-nor/anarion-quadspi.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c

-- 
2.9.3
