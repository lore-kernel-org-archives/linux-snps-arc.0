From: christian.ruppert@alitech.com (christian.ruppert@alitech.com)
Date: Tue, 8 Mar 2016 14:56:29 +0100
Subject: [PATCH v2 7/9] ARC: use fixed frequencies in
 arc_set_early_base_baud()
In-Reply-To: <1457439972-20285-8-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
 <1457439972-20285-8-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <OF2E92DD14.F9BD34D1-ONC1257F70.004C6256-C1257F70.004C737A@alitech.com>
To: linux-snps-arc@lists.infradead.org

Vineet Gupta <Vineet.Gupta1 at synopsys.com> wrote on 08.03.2016 13:26:10:
> From: Alexey Brodkin <abrodkin at synopsys.com>
> 
> UARTs usually have fixed clock so we're switching to use of
> constant values instead of something derived from core clock
> frequency.
> 
> Among other things this will allow us to get rid of
> arc_{get|set}_core_freq() and switch to generic clock
> framework later on.
> 
> Cc: Christian Ruppert <christian.ruppert at alitech.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Acked-by: Christian Ruppert <christian.ruppert at alitech.com>

> ---
> Changes v1 -> v2
>  - Base baud TB10x needs to be 166.66 not 166.67   [Christian]
> 
> v1:
>  - http://lists.infradead.org/pipermail/linux-snps-arc/2016-
> February/000453.html
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/devtree.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> index 7e844fd8213f..fecbc96df828 100644
> --- a/arch/arc/kernel/devtree.c
> +++ b/arch/arc/kernel/devtree.c
> @@ -28,14 +28,12 @@ unsigned int __init arc_early_base_baud(void)
> 
>  static void __init arc_set_early_base_baud(unsigned long dt_root)
>  {
> -   unsigned int core_clk = arc_get_core_freq();
> -
>     if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
> -      arc_base_baud = core_clk/3;
> +      arc_base_baud = 166666666;   /* Fixed 166.6MHz clk (TB10x) */
>     else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp"))
>        arc_base_baud = 33333333;   /* Fixed 33MHz clk (AXS10x) */
>     else
> -      arc_base_baud = core_clk;
> +      arc_base_baud = 50000000;   /* Fixed default 50MHz */
>  }
>  #else
>  #define arc_set_early_base_baud(dt_root)
> -- 
> 2.5.0
> 
