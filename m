From: robh@kernel.org (Rob Herring)
Date: Tue, 12 Feb 2019 14:11:25 -0600
Subject: [PATCH 04/12] of: select OF_RESERVED_MEM automatically
In-Reply-To: <20190211133554.30055-5-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-5-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_JsqJFGhTa+izRTeUxjtbyOek-zynZofOJGDK+xZbD4r5H0Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@7:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The OF_RESERVED_MEM can be used if we have either CMA or the generic
> declare coherent code built and we support the early flattened DT.
>
> So don't bother making it a user visible options that is selected
> by most configs that fit the above category, but just select it when
> the requirements are met.
>
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  arch/arc/Kconfig     | 1 -
>  arch/arm/Kconfig     | 1 -
>  arch/arm64/Kconfig   | 1 -
>  arch/csky/Kconfig    | 1 -
>  arch/powerpc/Kconfig | 1 -
>  arch/xtensa/Kconfig  | 1 -
>  drivers/of/Kconfig   | 5 ++---
>  7 files changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Rob Herring <robh at kernel.org>
