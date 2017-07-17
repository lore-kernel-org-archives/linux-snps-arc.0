From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 17 Jul 2017 09:06:29 -0700
Subject: semantics of dma_map_single()
In-Reply-To: <20170717064220.GA15807@lst.de>
References: <dc128260-6641-828a-3bb6-c2f0b4f09f78@synopsys.com>
 <20170717064220.GA15807@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <23203d16-da54-99c7-0eba-c082eba120d7@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Christoph,

On 07/16/2017 11:42 PM, Christoph Hellwig wrote:
> I would expect that it would support any contiguous range in
> the kernel mapping (e.g. no vmalloc and friends).  But it's not
> documented anywhere, and if no in kernel users makes use of that
> fact at the moment it might be better to document a page size
> limitation and add asserts to enforce it.

My first thought was indeed to add a BUG_ON for @size > PAGE_SIZE (also accounting 
for offset etc), but I have a feeling this will cause too many breakages. So 
perhaps it would be better to add the fact to Documentation that it can handle any 
physically contiguous range.

-Vineet
