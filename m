From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 3 Jun 2019 09:40:12 -0700
Subject: [PATCH] ARC: build: Try to guess CROSS_COMPILE with
 cc-cross-prefix
In-Reply-To: <20190603063119.36544-1-abrodkin@synopsys.com>
References: <20190603063119.36544-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190603164012.GA29719@infradead.org>
To: linux-snps-arc@lists.infradead.org

I wish we could just set CROSS_COMPILE and ARCH in .config.  That would
make everyones life compile testing on multiple architectures so much
easier.
