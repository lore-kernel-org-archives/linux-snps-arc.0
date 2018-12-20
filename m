From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 04:00:39 +0000
Subject: [PATCH] ARC: adjust memblock_reserve of kernel memory
References: <20181219161616.10422-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642269A@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/19/18 8:16 AM, Eugeniy Paltsev wrote:
> In setup_arch_memory we reserve the memory area wherein the kernel
> is located. Current implementation may reserve more memory than
> it actually required in case of CONFIG_LINUX_LINK_BASE is not
> equal to CONFIG_LINUX_RAM_BASE. This happens because we calculate
> start of the reserved region relatively to the CONFIG_LINUX_RAM_BASE
> and end of the region relatively to the CONFIG_LINUX_RAM_BASE.
>
> For example in case of HSDK board we wasted 256MiB of physical memory:
> ------------------->8------------------------------
> Memory: 770416K/1048576K available (5496K kernel code,
>     240K rwdata, 1064K rodata, 2200K init, 275K bss,
>     278160K reserved, 0K cma-reserved)
> ------------------->8------------------------------
>
> Fix that.
>
> Cc: stable at vger.kernel.org

For backports, please also check how far back this needs to be applied (else we
get bot emails specifying they don't apply to ver x, y z)

> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index f8fe5668b30f..a56e6a8ed259 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -137,7 +137,8 @@ void __init setup_arch_memory(void)
>  	 */
>  
>  	memblock_add_node(low_mem_start, low_mem_sz, 0);
> -	memblock_reserve(low_mem_start, __pa(_end) - low_mem_start);
> +	memblock_reserve(CONFIG_LINUX_LINK_BASE,
> +			 __pa(_end) - CONFIG_LINUX_LINK_BASE);
>  
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	if (initrd_start)

So I looked into the history for restricting stable, and it seems this was
introduced with our earlier work for HSDK.

Before commit 9ed68785f7f this code was ok, since low_mem_start =
CONFIG_LINUX_LINK_BASE.
With the patch we changed low_mem_start to CONFIG_LINUX_RAM_BASE and missed this.

-Vineet
