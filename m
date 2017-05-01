From: vinod.koul@intel.com (Vinod Koul)
Date: Mon, 1 May 2017 11:21:26 +0530
Subject: [PATCH] Allow to use DMA_CTRL_REUSE flag for all channel types
In-Reply-To: <20170428133746.1855-1-Eugeniy.Paltsev@synopsys.com>
References: <20170428133746.1855-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170501055125.GN6263@localhost>
To: linux-snps-arc@lists.infradead.org

On Fri, Apr 28, 2017@04:37:46PM +0300, Eugeniy Paltsev wrote:
> In the current implementation dma_get_slave_caps is used to check
> state of descriptor_reuse option. But dma_get_slave_caps includes
> check if the channel supports slave transactions.
> So DMA_CTRL_REUSE flag can be set (even for MEM-TO-MEM tranfers)
> only if channel supports slave transactions.
> 
> Now we can use DMA_CTRL_REUSE flag for all channel types.
> Also it allows to test reusing mechanism with simply mem-to-mem dma
> test.

We do not want to allow that actually. Slave is always treated as a special
case, so resue was allowed.

With memcpy the assumptions are different and clients can do reuse.

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  include/linux/dmaengine.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 5336808..92cf8b0 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -1376,11 +1376,7 @@ static inline int dma_get_slave_caps(struct dma_chan *chan,
>  
>  static inline int dmaengine_desc_set_reuse(struct dma_async_tx_descriptor *tx)
>  {
> -	struct dma_slave_caps caps;
> -
> -	dma_get_slave_caps(tx->chan, &caps);
> -
> -	if (caps.descriptor_reuse) {
> +	if (tx->chan->device->descriptor_reuse) {
>  		tx->flags |= DMA_CTRL_REUSE;
>  		return 0;
>  	} else {
> -- 
> 2.9.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
~Vinod
