From: bhelgaas@google.com (Bjorn Helgaas)
Date: Thu, 25 Feb 2016 11:37:21 -0600
Subject: [PATCH v10 0/4] Add PCI support to AXS10x
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160225172957.2103.8326.stgit@bhelgaas-glaptop2.roam.corp.google.com>
To: linux-snps-arc@lists.infradead.org

>From Joao's v9 posting
(http://lkml.kernel.org/r/cover.1454952698.git.jpinto at synopsys.com):

  "This patch set has the goal to add suppport for DesignWare PCIe RC in ARC
  AXS10x. It includes the necessary tweaks to:

   - the ARC architecture (PCI support)
   - the PCI subsystem (ARC CPU support)
   - to pcie-designware (Centralisation of wait for link routine)
   - to dra7xx, exynos, imx6 and spear13xx drivers to use the centralised
     code for link wait

  A simple module was (pcie-designware-plat) was created to contain the
  specific platform init code."

Here's what I'm looking for before putting this in "next":

  - An ack from the DesignWare maintainers (Jingoo or Pratyush)
  - An ack from Arnd for the DT updates/driver name/etc
  - A response from Murali about the Keystone establish_link strategy
    (I posted this question to Joao's v9 posting)
  - An update for pcie-qcom.d to use dw_pcie_wait_for_link() or a reason
    why it can't use it

This series is in my pci/host-synopsys branch here:
https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/log/?h=pci/host-synopsys

Joao, if you post a v11, please grab my pci/host-synopsys, make your edits,
then post the entire new v11 series as complete patches based on v4.5-rc1.

---

Joao Pinto (4):
      ARC: Add PCI support
      PCI: designware: Add generic dw_pcie_wait_for_link()
      PCI: designware: Add default link up check if sub-driver doesn't override
      PCI: designware: Add driver for prototyping kits based on ARC SDP


 .../devicetree/bindings/pci/designware-pcie.txt    |   17 ++
 MAINTAINERS                                        |    7 +
 arch/arc/Kconfig                                   |   26 ++++
 arch/arc/include/asm/dma.h                         |    5 +
 arch/arc/include/asm/io.h                          |    9 +
 arch/arc/include/asm/pci.h                         |   31 ++++
 arch/arc/kernel/Makefile                           |    1 
 arch/arc/kernel/pcibios.c                          |   22 +++
 arch/arc/plat-axs10x/Kconfig                       |    1 
 drivers/pci/Makefile                               |    1 
 drivers/pci/host/Kconfig                           |   11 ++
 drivers/pci/host/Makefile                          |    1 
 drivers/pci/host/pci-dra7xx.c                      |   11 --
 drivers/pci/host/pci-exynos.c                      |   11 --
 drivers/pci/host/pci-imx6.c                        |   11 --
 drivers/pci/host/pcie-designware-plat.c            |  138 ++++++++++++++++++++
 drivers/pci/host/pcie-designware.c                 |   29 ++++
 drivers/pci/host/pcie-designware.h                 |    6 +
 drivers/pci/host/pcie-spear13xx.c                  |   12 --
 19 files changed, 314 insertions(+), 36 deletions(-)
 create mode 100644 arch/arc/include/asm/pci.h
 create mode 100644 arch/arc/kernel/pcibios.c
 create mode 100644 drivers/pci/host/pcie-designware-plat.c
