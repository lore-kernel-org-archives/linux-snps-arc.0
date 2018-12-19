From: hch@lst.de (Christoph Hellwig)
Date: Wed, 19 Dec 2018 17:59:39 +0100
Subject: ensure dma_alloc_coherent always returns zeroed memory
In-Reply-To: <20181214082515.14835-1-hch@lst.de>
References: <20181214082515.14835-1-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181219165939.GA26087@lst.de>
To: linux-snps-arc@lists.infradead.org

FYI, I've picked this up for dma-mapping for-next now.
