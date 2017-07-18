From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Jul 2017 08:36:51 -0700
Subject: [PATCH] arc: Hardcode ARCH_DMA_MINALIGN to max line length we may
 have
In-Reply-To: <1500388284-23466-1-git-send-email-abrodkin@synopsys.com>
References: <1500388284-23466-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8cf0a368-4912-e243-2039-32ee93e96c21@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/18/2017 07:31 AM, Alexey Brodkin wrote:
> Current implementation relies on L1 line length which might easily
> be smaller than L2 line (which is usually the case BTW).
>
> Imagine this typical case: L2 line is 128 bytes while L1 line is
> 64-bytes. Now we want to allocate small buffer and later use it for DMA
> (consider IOC is not available).
>
> kmalloc() allocates small KMALLOC_MIN_SIZE-sized, KMALLOC_MIN_SIZE-aligned
> That way if buffer happens to be aligned to L1 line and not L2 line we'll be
> flushing and invalidating extra portions of data from L2 which will cause
> cache coherency issues.
>
> And since KMALLOC_MIN_SIZE is bound to ARCH_DMA_MINALIGN the fix could
> be simple - set ARCH_DMA_MINALIGN to the largest cache line we may ever
> get. As of today neither L1 of ARC700 and ARC HS38 nor SLC might not be
> longer than 128 bytes.

The patch itself makes sense - but is this preventive / code review thing or does 
it really fix soem issue at your end ?

> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>   arch/arc/include/asm/cache.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
> index 19ebddffb279..e45eac8c5980 100644
> --- a/arch/arc/include/asm/cache.h
> +++ b/arch/arc/include/asm/cache.h
> @@ -47,7 +47,8 @@
>   	: "r"(data), "r"(ptr));		\
>   })
>   
> -#define ARCH_DMA_MINALIGN      L1_CACHE_BYTES
> +/* Largest line length for either L1 or L2 is 128 bytes */
> +#define ARCH_DMA_MINALIGN      128
>   
>   extern void arc_cache_init(void);
>   extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
