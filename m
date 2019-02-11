From: hch@lst.de (Christoph Hellwig)
Date: Mon, 11 Feb 2019 14:35:42 +0100
Subject: dma_declare_coherent spring cleaning
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190211133554.30055-1-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

Hi all,

this series removes various bits of dead code and refactors the
remaining functionality around dma_declare_coherent to be a somewhat
more coherent code base.
