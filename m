From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 9 Jul 2018 15:54:09 +0200
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <20180709134550.29541-1-abrodkin@synopsys.com>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709135409.GQ2476@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@04:45:50PM +0300, Alexey Brodkin wrote:
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index f98a097e73f2..d65327cb83c9 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -24,8 +24,12 @@ struct devres_node {
>  
>  struct devres {
>  	struct devres_node		node;
> -	/* -- 3 pointers */
> -	unsigned long long		data[];	/* guarantee ull alignment */
> +	/*
> +	 * data[] must be 64 bit aligned even on 32 bit architectures
> +	 * because it might be accessed by instructions that require
> +	 * aligned memory arguments such as atomic64_t.
> +	 */
> +	u8 __aligned(8)			data[];
>  };

>From a quick reading in Documentation/driver-model/devres.txt this
devres muck is supposed to be device memory, right?

atomics (as in atomic*_t) are not defined for use on mmio.

wth kind of code is relying on this?
