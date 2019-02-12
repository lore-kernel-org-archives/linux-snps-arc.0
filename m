From: robh@kernel.org (Rob Herring)
Date: Tue, 12 Feb 2019 14:24:19 -0600
Subject: [PATCH 03/12] of: mark early_init_dt_alloc_reserved_memory_arch
 static
In-Reply-To: <20190211133554.30055-4-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-4-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_JsqJ2Qt6=TTD250C9qW7Kv8rZn5PyB_C78FUhWwfgOnjPHg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@7:36 AM Christoph Hellwig <hch@lst.de> wrote:
>
> This function is only used in of_reserved_mem.c, and never overridden
> despite the __weak marker.
>
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  drivers/of/of_reserved_mem.c    | 2 +-
>  include/linux/of_reserved_mem.h | 7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Rob Herring <robh at kernel.org>

Looks like this one isn't a dependency, so I can take it if you want.

Rob
