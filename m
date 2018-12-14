From: hch@lst.de (Christoph Hellwig)
Date: Fri, 14 Dec 2018 09:25:13 +0100
Subject: ensure dma_alloc_coherent always returns zeroed memory
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181214082515.14835-1-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

For security reasons we already returned zeroed memory from
dma_alloc_coherent on most common platforms, but some implementation
missed out.  Make sure we provide a consistent behavior.
