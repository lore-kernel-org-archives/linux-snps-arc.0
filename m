From: lee.jones@linaro.org (Lee Jones)
Date: Wed, 13 Feb 2019 07:27:16 +0000
Subject: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
In-Reply-To: <20190211133554.30055-7-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190213072716.GC1863@dell>
To: linux-snps-arc@lists.infradead.org

On Mon, 11 Feb 2019, Christoph Hellwig wrote:

> This API is primarily used through DT entries, but two architectures
> and two drivers call it directly.  So instead of selecting the config
> symbol for random architectures pull it in implicitly for the actual
> users.  Also rename the Kconfig option to describe the feature better.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  arch/arc/Kconfig            | 1 -
>  arch/arm/Kconfig            | 2 +-
>  arch/arm64/Kconfig          | 1 -
>  arch/csky/Kconfig           | 1 -
>  arch/mips/Kconfig           | 1 -
>  arch/riscv/Kconfig          | 1 -
>  arch/sh/Kconfig             | 2 +-
>  arch/unicore32/Kconfig      | 1 -
>  arch/x86/Kconfig            | 1 -

>  drivers/mfd/Kconfig         | 2 ++

If everyone else is happy with these changes, then so am I.

  Acked-by: Lee Jones <lee.jones at linaro.org>

>  drivers/of/Kconfig          | 3 ++-
>  include/linux/device.h      | 2 +-
>  include/linux/dma-mapping.h | 8 ++++----
>  kernel/dma/Kconfig          | 2 +-
>  kernel/dma/Makefile         | 2 +-
>  15 files changed, 13 insertions(+), 17 deletions(-)

-- 
Lee Jones [???]
Linaro Services Technical Lead
Linaro.org ? Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
