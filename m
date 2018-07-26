From: hch@lst.de (Christoph Hellwig)
Date: Thu, 26 Jul 2018 11:11:55 +0200
Subject: [PATCH] ARC: fix broken noncoherent cache ops
In-Reply-To: <20180724141302.4305-1-Eugeniy.Paltsev@synopsys.com>
References: <20180724141302.4305-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180726091155.GA24209@lst.de>
To: linux-snps-arc@lists.infradead.org

On Tue, Jul 24, 2018@05:13:02PM +0300, Eugeniy Paltsev wrote:
> All DMA devices on ARC haven't worked with SW cache control
> since commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
> This happens because we don't check direction argument at all in
> new implementation. Fix that.
> 
> Fixies: commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Looks sensible.  Might be worth explaining that ARC can speculate
into the areas under DMA, which is why this is required.
