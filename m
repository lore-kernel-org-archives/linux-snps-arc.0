From: helgaas@kernel.org (Bjorn Helgaas)
Date: Tue, 2 Feb 2016 11:14:37 -0600
Subject: [PATCH v7 0/2] adding PCI support to AXS10x
In-Reply-To: <cover.1454349430.git.jpinto@synopsys.com>
References: <cover.1454349430.git.jpinto@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160202171437.GD11085@localhost>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 01, 2016@06:07:43PM +0000, Joao Pinto wrote:
> This patch set has the goal to add suppport for DesignWare PCIe RC in ARC
> AXS10x. It includes the necessary tweaks to the ARC architecture, 
> necessary tweaks to the PCI subsystem and a new driver (pcie-synopsys).
> This new driver will be used extensively in the PCIe RC Prototyping Kit.
> 
> The patches were produced against Bjorn Helgaas' repository. It was properly
> tested in an IP Prototyping Kit.
> 
> Joao Pinto (2):
>   PCI support added to ARC
>   add new platform driver for PCI RC
> 
>  .../devicetree/bindings/pci/pcie-synopsys.txt      |  33 +++
>  MAINTAINERS                                        |   7 +
>  arch/arc/Kconfig                                   |  23 ++
>  arch/arc/include/asm/dma.h                         |   5 +
>  arch/arc/include/asm/io.h                          |   9 +
>  arch/arc/include/asm/pci.h                         |  31 +++
>  arch/arc/kernel/Makefile                           |   1 +
>  arch/arc/kernel/pcibios.c                          |  23 ++
>  arch/arc/plat-axs10x/Kconfig                       |   1 +
>  drivers/pci/Makefile                               |   1 +
>  drivers/pci/host/Kconfig                           |   8 +
>  drivers/pci/host/Makefile                          |   1 +
>  drivers/pci/host/pcie-synopsys.c                   | 257 +++++++++++++++++++++
>  13 files changed, 400 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/pcie-synopsys.txt
>  create mode 100644 arch/arc/include/asm/pci.h
>  create mode 100644 arch/arc/kernel/pcibios.c
>  create mode 100644 drivers/pci/host/pcie-synopsys.c

I applied these to pci/host-synopsys, and I plan to merge them for v4.5.

Bjorn
