From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Tue, 12 Feb 2019 08:49:40 +0100
Subject: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
In-Reply-To: <20190211133554.30055-7-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212074940.GB5924@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 11, 2019@02:35:48PM +0100, Christoph Hellwig wrote:
> This API is primarily used through DT entries, but two architectures
> and two drivers call it directly.  So instead of selecting the config
> symbol for random architectures pull it in implicitly for the actual
> users.  Also rename the Kconfig option to describe the feature better.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
