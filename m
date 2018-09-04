From: hch@lst.de (Christoph Hellwig)
Date: Tue, 4 Sep 2018 23:11:07 +0200
Subject: [PATCH v2 0/4] ARC: allow to use IOC and non-IOC DMA devices
 simultaneously
In-Reply-To: <ae6d35d6-ee1e-abde-5e5c-a4c489d1abb7@synopsys.com>
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
 <ae6d35d6-ee1e-abde-5e5c-a4c489d1abb7@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180904211107.GA8202@lst.de>
To: linux-snps-arc@lists.infradead.org

On Tue, Sep 04, 2018@01:14:49PM -0700, Vineet Gupta wrote:
> Apologies for the delay in getting to this - series applied and pushed to for-curr

This is going to create really annoying merge conflicts with
work pending for the dma-mapping tree.  That's why I requested earlier
to merge it either via the dma-mapping tree or some shared branch.
