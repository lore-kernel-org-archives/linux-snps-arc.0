From: hch@lst.de (Christoph Hellwig)
Date: Mon, 17 Jul 2017 08:42:20 +0200
Subject: semantics of dma_map_single()
In-Reply-To: <dc128260-6641-828a-3bb6-c2f0b4f09f78@synopsys.com>
References: <dc128260-6641-828a-3bb6-c2f0b4f09f78@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170717064220.GA15807@lst.de>
To: linux-snps-arc@lists.infradead.org

I would expect that it would support any contiguous range in
the kernel mapping (e.g. no vmalloc and friends).  But it's not
documented anywhere, and if no in kernel users makes use of that
fact at the moment it might be better to document a page size
limitation and add asserts to enforce it.
