From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Tue, 12 Feb 2019 08:50:20 +0100
Subject: [PATCH 09/12] dma-mapping: remove the DMA_MEMORY_EXCLUSIVE flag
In-Reply-To: <20190211133554.30055-10-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-10-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212075020.GC5924@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@02:35:51PM +0100, Christoph Hellwig wrote:
> All users of dma_declare_coherent want their allocations to be
> exclusive, so default to exclusive allocations.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  Documentation/DMA-API.txt                     |  9 +------
>  arch/arm/mach-imx/mach-imx27_visstrim_m10.c   | 12 +++------
>  arch/arm/mach-imx/mach-mx31moboard.c          |  3 +--
>  arch/sh/boards/mach-ap325rxa/setup.c          |  5 ++--
>  arch/sh/boards/mach-ecovec24/setup.c          |  6 ++---
>  arch/sh/boards/mach-kfr2r09/setup.c           |  5 ++--
>  arch/sh/boards/mach-migor/setup.c             |  5 ++--
>  arch/sh/boards/mach-se/7724/setup.c           |  6 ++---
>  arch/sh/drivers/pci/fixups-dreamcast.c        |  3 +--
>  .../soc_camera/sh_mobile_ceu_camera.c         |  3 +--
>  drivers/usb/host/ohci-sm501.c                 |  3 +--
>  drivers/usb/host/ohci-tmio.c                  |  2 +-
>  include/linux/dma-mapping.h                   |  7 ++----
>  kernel/dma/coherent.c                         | 25 ++++++-------------
>  14 files changed, 29 insertions(+), 65 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
