From: paul.burton@mips.com (Paul Burton)
Date: Tue, 12 Feb 2019 02:17:26 +0000
Subject: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
In-Reply-To: <20190211133554.30055-7-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190212021724.cp4snlcqbm3kqtzu@pburton-laptop>
To: linux-snps-arc@lists.infradead.org

Hi Christoph,

On Mon, Feb 11, 2019@02:35:48PM +0100, Christoph Hellwig wrote:
> This API is primarily used through DT entries, but two architectures
> and two drivers call it directly.  So instead of selecting the config
> symbol for random architectures pull it in implicitly for the actual
> users.  Also rename the Kconfig option to describe the feature better.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Acked-by: Paul Burton <paul.burton at mips.com> # MIPS

Thanks,
    Paul
