From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 3 Apr 2019 19:29:22 +0000
Subject: [PATCH] ARC: fix memory nodes topology in case of highmem enabled
References: <20190401184242.7636-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146440183@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/1/19 11:43 AM, Eugeniy Paltsev wrote:
> Tweak generic node topology in case of CONFIG_HIGHMEM enabled to
> prioritize allocations from ZONE_HIGHMEM to avoid ZONE_NORMAL
> pressure.

Can you explain the "pressure" part a bit more concretely - as in when did you saw
crashes, oom, yadi yada ....

> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Tested on both NSIM and HSDK (require memory apertures remmaping and
> device tree patching)

How can one test this patch w/o those - are they secret which rest of world should
not know about :-)
Jokes apart, at the very least, please include them as part of changelog "as
indicative code" which people can use in testing if needed.
Preferably they need to be part of platform code under the right config (HIGHMEM +
PAE etc)

FWIW as mentioned on other thread, for my setup of PAE + 2GB  HIGHMEM (so 2 nodes)
1. I didn't need any AXI aperture remapping
2. Didn't see any extra mem pressure / failures when running glibc testsuite

>
>  arch/arc/include/asm/Kbuild     |  1 -
>  arch/arc/include/asm/topology.h | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arc/include/asm/topology.h
>
> diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
> index caa270261521..e64e0439baff 100644
> --- a/arch/arc/include/asm/Kbuild
> +++ b/arch/arc/include/asm/Kbuild
> @@ -18,7 +18,6 @@ generic-y += msi.h
>  generic-y += parport.h
>  generic-y += percpu.h
>  generic-y += preempt.h
> -generic-y += topology.h
>  generic-y += trace_clock.h
>  generic-y += user.h
>  generic-y += vga.h
> diff --git a/arch/arc/include/asm/topology.h b/arch/arc/include/asm/topology.h
> new file mode 100644
> index 000000000000..c273506931c9
> --- /dev/null
> +++ b/arch/arc/include/asm/topology.h
> @@ -0,0 +1,30 @@
> +#ifndef _ASM_ARC_TOPOLOGY_H
> +#define _ASM_ARC_TOPOLOGY_H
> +
> +/*
> + * On ARC (w/o PAE) HIGHMEM addresses are smaller (0x0 based) than addresses in
> + * NORMAL aka low memory (0x8000_0000 based).
> + * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM which requires multiple

s/imlemented/implemented
> + * nodes. So here is memory node map depending on the CONFIG_HIGHMEM
> + * enabled/disabled:
> + *
> + * CONFIG_HIGHMEM disabled:
> + *  - node 0: ZONE_NORMAL memory only.
> + *
> + * CONFIG_HIGHMEM enabled:
> + *  - node 0: ZONE_NORMAL memory only.
> + *  - node 1: ZONE_HIGHMEM memory only.

Perhaps we could reduce the text above by having 2 lines and adding a "()" comment
for node 1

+ *  - node 0: ZONE_NORMAL memory  (always)
+ *  - node 1: ZONE_HIGHMEM memory (HIGHMEM only)



> + *
> + * In case of CONFIG_HIGHMEM enabled we tweak generic node topology and mark
> + * node 1 as the closest to all CPUs to prioritize allocations from ZONE_HIGHMEM
> + * where it is possible to avoid ZONE_NORMAL pressure.
> + */
> +#ifdef CONFIG_HIGHMEM
> +#define cpu_to_node(cpu)	((void)(cpu), 1)
> +#define cpu_to_mem(cpu)		((void)(cpu), 1)
> +#define cpumask_of_node(node)	((node) == 1 ? cpu_online_mask : cpu_none_mask)
> +#endif /* CONFIG_HIGHMEM */
> +
> +#include <asm-generic/topology.h>
> +
> +#endif /* _ASM_ARC_TOPOLOGY_H */

Otherwise LGTM. I would like to give this a spin myself, but first need to know
what tests cause the increased failures which this patch mitigates.

Thx,
-Vineet
