From: robh@kernel.org (Rob Herring)
Date: Tue, 12 Feb 2019 14:40:23 -0600
Subject: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
In-Reply-To: <20190211133554.30055-7-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_JsqL+LiJTF5kZz2hXGbQcH+D4U0jAQE376VSUVMQmdg=XFA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@7:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
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
>  drivers/of/Kconfig          | 3 ++-
>  include/linux/device.h      | 2 +-
>  include/linux/dma-mapping.h | 8 ++++----
>  kernel/dma/Kconfig          | 2 +-
>  kernel/dma/Makefile         | 2 +-
>  15 files changed, 13 insertions(+), 17 deletions(-)

> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 3607fd2810e4..f8c66a9472a4 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -43,6 +43,7 @@ config OF_FLATTREE
>
>  config OF_EARLY_FLATTREE
>         bool
> +       select DMA_DECLARE_COHERENT

Is selecting DMA_DECLARE_COHERENT okay on UML? We run the unittests with UML.

Maybe we should just get rid of OF_RESERVED_MEM. If we support booting
from DT, then it should always be enabled anyways.

>         select OF_FLATTREE
>
>  config OF_PROMTREE
> @@ -83,7 +84,7 @@ config OF_MDIO
>  config OF_RESERVED_MEM
>         bool
>         depends on OF_EARLY_FLATTREE
> -       default y if HAVE_GENERIC_DMA_COHERENT || DMA_CMA
> +       default y if DMA_DECLARE_COHERENT || DMA_CMA
>
>  config OF_RESOLVE
>         bool
