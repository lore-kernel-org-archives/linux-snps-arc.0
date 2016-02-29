From: helgaas@kernel.org (Bjorn Helgaas)
Date: Mon, 29 Feb 2016 13:22:11 -0600
Subject: [PATCH v11 0/4] ARC: Add PCI support
In-Reply-To: <6C7E76B729B341419CE4B84926C1D2CD010BCE1D@DE02WEMBXB.internal.synopsys.com>
References: <20160226162554.11964.96983.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <6C7E76B729B341419CE4B84926C1D2CD010BCE1D@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160229192211.GA10370@localhost>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 29, 2016@06:30:52PM +0000, Joao Pinto wrote:
> Hi Bjorn!
> 
> Is it possible to pull this patch set into 4.5?

No, it's a little late for v4.5.  We're already at v4.5-rc6, so it's
only critical bug fixes until the v4.6 merge window opens.

Bjorn

> -----Original Message-----
> From: linux-pci-owner at vger.kernel.org [mailto:linux-pci-owner at vger.kernel.org] On Behalf Of Bjorn Helgaas
> Sent: Friday, February 26, 2016 4:30 PM
> To: Joao Pinto
> Cc: mark.rutland at arm.com; Alexey.Brodkin at synopsys.com; arnd at arndb.de; pawel.moll at arm.com; ijc+devicetree at hellion.org.uk; linux-pci at vger.kernel.org; Vineet.Gupta1 at synopsys.com; Pratyush Anand; linux-kernel at vger.kernel.org; CARLOS.PALMINHA at synopsys.com; robh+dt at kernel.org; Murali Karicheri; galak at codeaurora.org; Jingoo Han; linux-snps-arc at lists.infradead.org
> Subject: [PATCH v11 0/4] ARC: Add PCI support
> 
> >From Joao's v9 posting
> (http://lkml.kernel.org/r/cover.1454952698.git.jpinto at synopsys.com):
> 
>   "This patch set has the goal to add suppport for DesignWare PCIe RC in ARC
>   AXS10x. It includes the necessary tweaks to:
> 
>    - the ARC architecture (PCI support)
>    - the PCI subsystem (ARC CPU support)
>    - to pcie-designware (Centralisation of wait for link routine)
>    - to dra7xx, exynos, imx6 and spear13xx drivers to use the centralised
>      code for link wait
> 
>   A simple module was (pcie-designware-plat) was created to contain the
>   specific platform init code."
> 
> Changes from v10:
>   - Update keystone link establishment to wait longer for link to come up
>     before re-initiating link training
>   - Also use generic dw_pcie_wait_for_link() in keystone and qcom drivers
> 
> I would still like acks from DesignWare maintainers (Jingoo or Pratyush), from Murali for the Keystone changes, and from Arnd for the DT updates.
> 
> This series is in my pci/host-synopsys branch here:
> https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/log/?h=pci/host-syn
> opsys
> ---
> 
> Joao Pinto (4):
>       ARC: Add PCI support
>       PCI: designware: Add generic dw_pcie_wait_for_link()
>       PCI: designware: Add default link up check if sub-driver doesn't override
>       PCI: designware: Add driver for prototyping kits based on ARC SDP
> 
> 
>  .../devicetree/bindings/pci/designware-pcie.txt    |   17 ++
>  MAINTAINERS                                        |    7 +
>  arch/arc/Kconfig                                   |   26 ++++
>  arch/arc/include/asm/dma.h                         |    5 +
>  arch/arc/include/asm/io.h                          |    9 +
>  arch/arc/include/asm/pci.h                         |   31 ++++
>  arch/arc/kernel/Makefile                           |    1 
>  arch/arc/kernel/pcibios.c                          |   22 +++
>  arch/arc/plat-axs10x/Kconfig                       |    1 
>  drivers/pci/Makefile                               |    1 
>  drivers/pci/host/Kconfig                           |   11 ++
>  drivers/pci/host/Makefile                          |    1 
>  drivers/pci/host/pci-dra7xx.c                      |   11 --
>  drivers/pci/host/pci-exynos.c                      |   13 --
>  drivers/pci/host/pci-imx6.c                        |   13 +-
>  drivers/pci/host/pci-keystone.c                    |   10 +
>  drivers/pci/host/pcie-designware-plat.c            |  138 ++++++++++++++++++++
>  drivers/pci/host/pcie-designware.c                 |   29 ++++
>  drivers/pci/host/pcie-designware.h                 |    6 +
>  drivers/pci/host/pcie-qcom.c                       |   10 -
>  drivers/pci/host/pcie-spear13xx.c                  |   14 --
>  21 files changed, 318 insertions(+), 58 deletions(-)  create mode 100644 arch/arc/include/asm/pci.h  create mode 100644 arch/arc/kernel/pcibios.c  create mode 100644 drivers/pci/host/pcie-designware-plat.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in the body of a message to majordomo at vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
