From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Feb 2019 09:17:17 -0800
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <20190208105519.26750-1-abrodkin@synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/8/19 2:55 AM, Alexey Brodkin wrote:
> By default ARCH_SLAB_MINALIGN is defined in "include/linux/slab.h" as
> "__alignof__(unsigned long long)" which looks fine but not for ARC.

Just for the record, the issue happens because a LLOCKD (exclusive 64-bit load)
was trying to use a 32-bit aligned effective address (for atomic64_t), not allowed
by ISA (LLOCKD can only take 64-bit aligned address, even when the CPU has
unaligned access enabled).

This in turn was happening because this word is embedded in some other struct and
happens to be 4 byte aligned


> ARC tools ABI sets align of "long long" the same as for "long" = 4
> instead of 8 one may think of.

Right, this was indeed unexpected and not like most other arches. ARCv2 ISA allows
regular 64-bit loads/stores (LDD/STD) to take 32-bit aligned addresses. Thus ABI
relaxing the alignment for 64-bit data potentially causes more packing and less
space waste. But on the flip side we need to waste space at arbitrary places liek
this.

So this is all good and theory, but I'm not 100% sure how slab alignment helps
here (and is future proof). So the outer struct with embedded atomic64_t was
allocated via slab and your patch ensures that outer struct is 64-bit aligned ?

But how does that guarantee that all embedded atomic64_t in there will be 64-bit
aligned (in future say) in the light of ARC ABI and the gcc bug/feature which
Peter alluded to

   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54188
   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=10360

> Thus slab allocator may easily allocate a buffer which is 32-bit aligned.
> And most of the time it's OK until we start dealing with 64-bit atomics
> with special LLOCKD/SCONDD instructions which (as opposed to their 32-bit
> counterparts LLOCK/SCOND) operate with full 64-bit words but those words
> must be 64-bit aligned.

Some of this text needed to go above to give more context.

> 
> Fixes Ext4 folder removal:
> --------------------->8-------------------
> [    4.015732] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
> [    4.167881]

..

> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: <stable at vger.kernel.org> # 4.8+
> ---
>  arch/arc/include/asm/cache.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
> index f393b663413e..74f8fcaaef5c 100644
> --- a/arch/arc/include/asm/cache.h
> +++ b/arch/arc/include/asm/cache.h
> @@ -52,6 +52,16 @@
>  #define cache_line_size()	SMP_CACHE_BYTES
>  #define ARCH_DMA_MINALIGN	SMP_CACHE_BYTES
>  
> +/*
> + * Make sure slab-allocated buffers are 64-bit aligned.
> + * This is required for llockd/scondd to deal with 64-bit aligned dwords.
> + * By default ARCH_SLAB_MINALIGN is __alignof__(long long) which in
> + * case of ARC is 4 instead of 8!
> + */
> +#ifdef CONFIG_ARC_HAS_LL64
> +#define ARCH_SLAB_MINALIGN	8
> +#endif
> +
>  extern void arc_cache_init(void);
>  extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
>  extern void read_decode_cache_bcr(void);
> 
