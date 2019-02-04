From: hch@lst.de (Christoph Hellwig)
Date: Mon,  4 Feb 2019 09:14:18 +0100
Subject: add config symbols for arch_{setup,teardown}_dma_ops
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190204081420.15083-1-hch@lst.de>
To: linux-snps-arc@lists.infradead.org

Hi all,

this series adds kconfig symbols to indicate that the architecture
provides the arch_setup_dma_ops and arch_teardown_dma_ops hooks.

This avoids polluting dma-mapping.h which is included by just about
every driver with implementation details, and also removes some
clutter.
