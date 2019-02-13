From: hch@lst.de (Christoph Hellwig)
Date: Wed, 13 Feb 2019 19:17:05 +0100
Subject: [PATCH 01/12] mfd/sm501: depend on HAS_DMA
In-Reply-To: <20190213072931.GD1863@dell>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-2-hch@lst.de> <20190213072931.GD1863@dell>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190213181705.GB19706@lst.de>
To: linux-snps-arc@lists.infradead.org

On Wed, Feb 13, 2019@07:29:31AM +0000, Lee Jones wrote:
> I would normally have taken this, but I fear it will conflict with
> [PATCH 06/12].  For that reason, just take my:
> 
>   Acked-by: Lee Jones <lee.jones at linaro.org>

Yes, I'll need it for the later patches in the series.

Thanks for the review.
