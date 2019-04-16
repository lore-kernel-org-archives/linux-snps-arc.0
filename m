From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 16 Apr 2019 17:32:14 +0000
Subject: [PATCH 2/3] ARC: cache: check cache configuration on each CPU
References: <20190416171021.20049-1-Eugeniy.Paltsev@synopsys.com>
 <20190416171021.20049-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501A25015EE@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/16/19 10:10 AM, Eugeniy Paltsev wrote:
> ARC kernel code assumes that all cores have same cache config
> but as of today we check cache configuration only on master CPU.
> Fix that and check cache configuration on each CPU.

What is broken ? With current hardware it is impossible to have a SMP config with
different cache geometry, line size can definitely not be different.
This is adding needless cycles  for no apparent benefit.

>
> Also while I'm at it, split cache_init_master() for two parts:
>  * checks/setups related to master L1 caches
>  * the rest of cache checks/setups which need to be done once
>    (like IOC / SLC / dma callbacks setup)
>
> Both of these changes are prerequisites for autodetecting cache
> line size in runtime.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/mm/cache.c | 66 +++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 4135abec3fb0..1036bd56f518 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -1208,27 +1208,43 @@ noinline void __init arc_ioc_setup(void)
>  	__dc_enable();
>  }
>  
> +#if IS_ENABLED(CONFIG_ARC_HAS_ICACHE) || IS_ENABLED(CONFIG_ARC_HAS_DCACHE)
> +static void arc_l1_line_check(unsigned int line_len, const char *cache_name)
> +{
> +	if (!line_len)
> +		panic("%s support enabled but non-existent cache\n",
> +		      cache_name);
> +
> +	if (line_len != L1_CACHE_BYTES)
> +		panic("%s line size [%u] != expected [%u]",
> +		      cache_name, line_len, L1_CACHE_BYTES);
> +}
> +#endif /* IS_ENABLED(CONFIG_ARC_HAS_ICACHE) || IS_ENABLED(CONFIG_ARC_HAS_DCACHE) */
> +
>  /*
> - * Cache related boot time checks/setups only needed on master CPU:
> - *  - Geometry checks (kernel build and hardware agree: e.g. L1_CACHE_BYTES)
> - *    Assume SMP only, so all cores will have same cache config. A check on
> - *    one core suffices for all
> - *  - IOC setup / dma callbacks only need to be done once
> + * Cache related boot time checks needed on every CPU.
>   */
> -void __init arc_cache_init_master(void)
> +static void arc_l1_cache_check(unsigned int cpu)
>  {
> -	unsigned int __maybe_unused cpu = smp_processor_id();
> +	if (IS_ENABLED(CONFIG_ARC_HAS_ICACHE))
> +		arc_l1_line_check(cpuinfo_arc700[cpu].icache.line_len, "ICache");
> +
> +	if (IS_ENABLED(CONFIG_ARC_HAS_DCACHE))
> +		arc_l1_line_check(cpuinfo_arc700[cpu].dcache.line_len, "DCache");
> +}
>  
> +/*
> + * L1 Cache related boot time checks/setups needed on master CPU:
> + * This checks/setups are done in assumption that all CPU have same cache
> + * configuration (we validate this in arc_cache_check()):
> + *  - Geometry checks
> + *  - L1 cache line loop callbacks
> + */
> +void __init arc_l1_cache_init_master(unsigned int cpu)
> +{
>  	if (IS_ENABLED(CONFIG_ARC_HAS_ICACHE)) {
>  		struct cpuinfo_arc_cache *ic = &cpuinfo_arc700[cpu].icache;
>  
> -		if (!ic->line_len)
> -			panic("cache support enabled but non-existent cache\n");
> -
> -		if (ic->line_len != L1_CACHE_BYTES)
> -			panic("ICache line [%d] != kernel Config [%d]",
> -			      ic->line_len, L1_CACHE_BYTES);
> -
>  		/*
>  		 * In MMU v4 (HS38x) the aliasing icache config uses IVIL/PTAG
>  		 * pair to provide vaddr/paddr respectively, just as in MMU v3
> @@ -1242,13 +1258,6 @@ void __init arc_cache_init_master(void)
>  	if (IS_ENABLED(CONFIG_ARC_HAS_DCACHE)) {
>  		struct cpuinfo_arc_cache *dc = &cpuinfo_arc700[cpu].dcache;
>  
> -		if (!dc->line_len)
> -			panic("cache support enabled but non-existent cache\n");
> -
> -		if (dc->line_len != L1_CACHE_BYTES)
> -			panic("DCache line [%d] != kernel Config [%d]",
> -			      dc->line_len, L1_CACHE_BYTES);
> -
>  		/* check for D-Cache aliasing on ARCompact: ARCv2 has PIPT */
>  		if (is_isa_arcompact()) {
>  			int handled = IS_ENABLED(CONFIG_ARC_CACHE_VIPT_ALIASING);
> @@ -1271,6 +1280,14 @@ void __init arc_cache_init_master(void)
>  	 */
>  	BUILD_BUG_ON_MSG(L1_CACHE_BYTES > SMP_CACHE_BYTES,
>  			 "SMP_CACHE_BYTES must be >= any cache line length");
> +}
> +
> +/*
> + * Cache related boot time checks/setups needed on master CPU:
> + *  - IOC setup / SLC setup / dma callbacks only need to be done once
> + */
> +void __init arc_cache_init_master(void)
> +{
>  	if (is_isa_arcv2() && (l2_line_sz > SMP_CACHE_BYTES))
>  		panic("L2 Cache line [%d] > kernel Config [%d]\n",
>  		      l2_line_sz, SMP_CACHE_BYTES);
> @@ -1301,11 +1318,16 @@ void __init arc_cache_init_master(void)
>  
>  void __ref arc_cache_init(void)
>  {
> -	unsigned int __maybe_unused cpu = smp_processor_id();
> +	unsigned int cpu = smp_processor_id();
>  	char str[256];
>  
>  	pr_info("%s", arc_cache_mumbojumbo(0, str, sizeof(str)));
>  
> +	if (!cpu)
> +		arc_l1_cache_init_master(cpu);
> +
> +	arc_l1_cache_check(cpu);
> +
>  	if (!cpu)
>  		arc_cache_init_master();
>  
