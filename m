From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Tue, 12 Feb 2019 08:49:06 +0100
Subject: [PATCH 02/12] device.h: dma_mem is only needed for
 HAVE_GENERIC_DMA_COHERENT
In-Reply-To: <20190211133554.30055-3-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-3-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212074906.GA5924@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@02:35:44PM +0100, Christoph Hellwig wrote:
> No need to carry an unused field around.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  include/linux/device.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
