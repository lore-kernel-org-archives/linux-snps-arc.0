From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Fri, 3 Jun 2016 09:17:00 +0200
Subject: [RFC v3 02/45] dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-3-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
 <1464881987-13203-3-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdXWMf7Dt77wSUj8NytQqb99jzDiAz46kJkAEz+6BX3Uvw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Krzysztof,

On Thu, Jun 2, 2016 at 5:39 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -5,13 +5,25 @@

> +/**
> + * List of possible attributes associated with a DMA mapping. The semantics
> + * of each attribute should be defined in Documentation/DMA-attributes.txt.
> + */
> +#define DMA_ATTR_WRITE_BARRIER         (1UL << 1)

Any particular reason they start at 2, not 1?

> +#define DMA_ATTR_WEAK_ORDERING         (1UL << 2)
> +#define DMA_ATTR_WRITE_COMBINE         (1UL << 3)
> +#define DMA_ATTR_NON_CONSISTENT                (1UL << 4)
> +#define DMA_ATTR_NO_KERNEL_MAPPING     (1UL << 5)
> +#define DMA_ATTR_SKIP_CPU_SYNC         (1UL << 6)
> +#define DMA_ATTR_FORCE_CONTIGUOUS      (1UL << 7)
> +#define DMA_ATTR_ALLOC_SINGLE_PAGES    (1UL << 8)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
