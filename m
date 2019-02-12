From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Tue, 12 Feb 2019 08:50:46 +0100
Subject: [PATCH 07/12] dma-mapping: move CONFIG_DMA_CMA to
 kernel/dma/Kconfig
In-Reply-To: <20190211133554.30055-8-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-8-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212075046.GD5924@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@02:35:49PM +0100, Christoph Hellwig wrote:
> This is where all the related code already lives.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  drivers/base/Kconfig | 77 --------------------------------------------
>  kernel/dma/Kconfig   | 77 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+), 77 deletions(-)

Much nicer, thanks!

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
