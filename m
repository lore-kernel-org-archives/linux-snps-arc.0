From: paul.burton@mips.com (Paul Burton)
Date: Tue, 12 Feb 2019 02:02:48 +0000
Subject: [PATCH 1/2] dma-mapping: add a kconfig symbol for
 arch_setup_dma_ops availability
In-Reply-To: <20190204081420.15083-2-hch@lst.de>
References: <20190204081420.15083-1-hch@lst.de>
 <20190204081420.15083-2-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212020246.pnxg2tlwejvu45ze@pburton-laptop>
To: linux-snps-arc@lists.infradead.org

Hi Christoph,

On Mon, Feb 04, 2019@09:14:19AM +0100, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  arch/arc/Kconfig                     |  1 +
>  arch/arc/include/asm/Kbuild          |  1 +
>  arch/arc/include/asm/dma-mapping.h   | 13 -------------
>  arch/arm/Kconfig                     |  1 +
>  arch/arm/include/asm/dma-mapping.h   |  4 ----
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/dma-mapping.h |  4 ----
>  arch/mips/Kconfig                    |  1 +
>  arch/mips/include/asm/dma-mapping.h  | 10 ----------
>  arch/mips/mm/dma-noncoherent.c       |  8 ++++++++

Acked-by: Paul Burton <paul.burton at mips.com> # MIPS

Thanks,
    Paul
