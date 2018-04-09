From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Apr 2018 10:52:09 +0000
Subject: dma-mapping: clear harmful GFP_* flags in common code
In-Reply-To: <1522249966.2593.14.camel@synopsys.com>
References: <20180328133535.17302-1-hch@lst.de>
 <20180328133535.17302-2-hch@lst.de> <1522249966.2593.14.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1523271128.5268.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

May we have
e89f5b370153 ("dma-mapping: Don't clear GFP_ZERO in dma_alloc_attrs")
back-ported to 4.16 kernel as it fixes:

57bf5a8 ("dma-mapping: clear harmful GFP_* flags in common code").

For more info about introduced problem see this thread:
http://lists.infradead.org/pipermail/linux-snps-arc/2018-March/003652.html

-Alexey
