From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Tue, 27 Feb 2018 09:14:23 +0800
Subject: [PATCH 1/2 v3] mmc: dw_mmc: Fix the DTO timeout overflow
 calculation for 32-bit systems
In-Reply-To: <20180226143413.44134-2-Evgeniy.Didin@synopsys.com>
References: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
 <20180226143413.44134-2-Evgeniy.Didin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d955cc19-1398-3c05-4742-32664480d07d@rock-chips.com>
To: linux-snps-arc@lists.infradead.org


> Tested-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> Fixes: ARC STAR 9001306872 HSDK, sdio: board crashes when copying big files
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
> 
> CC: Alexey Brodkin <abrodkin at synopsys.com>
> CC: Eugeniy Paltsev <paltsev at synopsys.com>
> CC: Douglas Anderson <dianders at chromium.org>
> CC: Ulf Hansson <ulf.hansson at linaro.org>
> CC: linux-kernel at vger.kernel.org
> CC: linux-snps-arc at lists.infradead.org
> Cc: <stable at vger.kernel.org> #  9d9491a7da2a mmc: dw_mmc: Fix the DTO timeout calculation

As I said, the correct tag may be:

Reported-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com> # ARC STAR 
9001306872 HSDK, sdio: board crashes when copying big files
Tested-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
Fixes: 9d9491a7da2a ("mmc: dw_mmc: Fix the DTO timeout calculation")
Cc: <stable at vger.kernel.org>
Signed-off-by: Evgeniy Didin <Evgeniy.Didin at synopsys.com>
...
...


> ---
> Nothing changed since v2.
>   drivers/mmc/host/dw_mmc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

> -	drto_ms = DIV_ROUND_UP(MSEC_PER_SEC * drto_clks * drto_div,
> +
> +	drto_ms = DIV_ROUND_UP((u64)MSEC_PER_SEC * drto_clks * drto_div,
>   			       host->bus_hz);
>   

Hmm?

#define DIV_ROUND_DOWN_ULL(ll, d) \
	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })

#define DIV_ROUND_UP_ULL(ll, d)		DIV_ROUND_DOWN_ULL((ll) + (d) - 1, (d))


It uses intermediate unsigned long long _tmp for your "multiply", namely
MSEC_PER_SEC * drto_clks * drto_div, which could solves the problem.
So I don't see why DIV_ROUND_UP_ULL can't work for you?


>   	/* add a bit spare time */
> 
