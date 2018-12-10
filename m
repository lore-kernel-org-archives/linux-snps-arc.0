From: hch@lst.de (Christoph Hellwig)
Date: Mon, 10 Dec 2018 17:32:56 +0100
Subject: [PATCH 6/6] sparc: merge 32-bit and 64-bit version of pci.h
In-Reply-To: <20181208.205806.42785512174962944.davem@davemloft.net>
References: <20181208174115.16237-1-hch@lst.de>
 <20181208174115.16237-7-hch@lst.de>
 <20181208.205806.42785512174962944.davem@davemloft.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181210163256.GA27331@lst.de>
To: linux-snps-arc@lists.infradead.org

Dave, can you pick the series up through the sparc tree?  I could also
merge it through the dma-mapping tree, but given that there is no
dependency on it the sparc tree seem like the better fit.
