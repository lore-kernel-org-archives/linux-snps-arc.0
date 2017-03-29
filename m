From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 29 Mar 2017 16:41:52 -0700
Subject: [PATCH] arcv2: Make sure busy bit is set properly on SLC flushing
In-Reply-To: <1490796911-4848-1-git-send-email-abrodkin@synopsys.com>
References: <1490796911-4848-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <35ad9cda-d493-869f-c65b-9d1ad5382ff3@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/29/2017 07:15 AM, Alexey Brodkin wrote:
> As reported in STAR 9001165532 if data cache gets disabled right before
> L2 cache invalidation we may read wrong value of L2 cache "busy" bit.
> So we won't wait before L2 cache gets properly flushed and so some
> data might not reach DDR at all thus we'll use older values from DDR
> next time they are accessed.
>
> For now we use a work-around with one extra read from SLC's control
> register which guarantees next read will return real value of "busy"
> bit.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Thx Alexey - pushed to for-curr !

> ---
>  arch/arc/mm/cache.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index d408fa21a07c..899f1d6b3560 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -633,6 +633,9 @@ noinline static void slc_entire_op(const int op)
>  
>  	write_aux_reg(ARC_REG_SLC_INVALIDATE, 1);
>  
> +	/* Make sure "busy" bit reports correct stataus, see STAR 9001165532 */
> +	read_aux_reg(r);
> +
>  	/* Important to wait for flush to complete */
>  	while (read_aux_reg(r) & SLC_CTRL_BUSY);
>  }
