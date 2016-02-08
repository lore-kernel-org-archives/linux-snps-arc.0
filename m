From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Mon,  8 Feb 2016 17:45:09 +0000
Subject: [PATCH v9 0/2] adding PCI support to AXS10x
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cover.1454952698.git.jpinto@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch set has the goal to add suppport for DesignWare PCIe RC in ARC
AXS10x. It includes the necessary tweaks to:
 - the ARC architecture (PCI support)
 - the PCI subsystem (ARC CPU support)
 - to pcie-designware (Centralisation of wait for link routine)
 - to dra7xx, exynos, imx6 and spear13xx drivers to use the centralised
 code for link wait

A simple module was (pcie-designware-plat) was created to contain the 
specific platform init code.

The patches were produced against Bjorn Helgaas' repository. It was properly
tested in an IP Prototyping Kit.

Joao Pinto (2):
  PCI support added to ARC
  pcie-designware platform driver

 .../devicetree/bindings/pci/designware-pcie.txt    |  17 +++
 arch/arc/Kconfig                                   |  23 ++++
 arch/arc/include/asm/dma.h                         |   5 +
 arch/arc/include/asm/io.h                          |   9 ++
 arch/arc/include/asm/pci.h                         |  31 +++++
 arch/arc/kernel/Makefile                           |   1 +
 arch/arc/kernel/pcibios.c                          |  23 ++++
 arch/arc/plat-axs10x/Kconfig                       |   1 +
 drivers/pci/Makefile                               |   1 +
 drivers/pci/host/Kconfig                           |  11 ++
 drivers/pci/host/Makefile                          |   1 +
 drivers/pci/host/pci-dra7xx.c                      |  11 +-
 drivers/pci/host/pci-exynos.c                      |  11 +-
 drivers/pci/host/pci-imx6.c                        |  11 +-
 drivers/pci/host/pcie-designware-plat.c            | 143 +++++++++++++++++++++
 drivers/pci/host/pcie-designware.c                 |  31 ++++-
 drivers/pci/host/pcie-designware.h                 |   6 +
 drivers/pci/host/pcie-spear13xx.c                  |  12 +-
 18 files changed, 311 insertions(+), 37 deletions(-)
 create mode 100644 arch/arc/include/asm/pci.h
 create mode 100644 arch/arc/kernel/pcibios.c
 create mode 100644 drivers/pci/host/pcie-designware-plat.c

-- 
1.8.1.5
