From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 17 Dec 2015 10:58:55 +0530
Subject: + arc-convert-to-dma_map_ops.patch added to -mm tree
In-Reply-To: <20151124075047.GA29572@lst.de>
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
 <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
 <20151124075047.GA29572@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56724817.7090003@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 24 November 2015 01:20 PM, hch@lst.de wrote:
> Hi Vineet,
> 
> the original version went through the buildbot, which succeeded.  It seems
> like the official buildbot does not support arc, and might benefit from
> helping to set up an arc environment.  However in the meantime Guenther
> send me output from his buildbot and I sent a fix for arc.
> 

Hi Andrew, Christoph

The dma mapping conversion build error fixlet (below) exists as a separate patch
which will break bisectability. Will it be possible to squash it into the orig commit.

Thx,
-Vineet

commit 7f33b4a409493b81c24741dbad6700aae99d8ed0
Author: Christoph Hellwig <hch at lst.de>
Date:   Fri Dec 11 15:59:33 2015 +1100

    arc: dma mapping fixes

    Signed-off-by: Christoph Hellwig <hch at lst.de>
    Reported-by: Guenter Roeck <linux at roeck-us.net>
    Signed-off-by: Andrew Morton <akpm at linux-foundation.org>
