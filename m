From: hch@lst.de (Christoph Hellwig)
Date: Thu, 26 Jul 2018 11:13:23 +0200
Subject: [PATCH 2/4] ARC: allow to use IOC and non-IOC DMA devices
 simultaneously
In-Reply-To: <20180724101001.31965-3-Eugeniy.Paltsev@synopsys.com>
References: <20180724101001.31965-1-Eugeniy.Paltsev@synopsys.com>
 <20180724101001.31965-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180726091323.GB24209@lst.de>
To: linux-snps-arc@lists.infradead.org

>  	select DMA_NONCOHERENT_OPS
> +	select DMA_DIRECT_OPS

DMA_NONCOHERENT_OPS already selects DMA_DIRECT_OPS.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch at lst.de>
