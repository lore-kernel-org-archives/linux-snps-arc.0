From: James.Bottomley@HansenPartnership.com (James Bottomley)
Date: Mon, 17 Jul 2017 09:46:30 -0700
Subject: semantics of dma_map_single()
In-Reply-To: <23203d16-da54-99c7-0eba-c082eba120d7@synopsys.com>
References: <dc128260-6641-828a-3bb6-c2f0b4f09f78@synopsys.com>
 <20170717064220.GA15807@lst.de>
 <23203d16-da54-99c7-0eba-c082eba120d7@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1500309990.3244.2.camel@HansenPartnership.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2017-07-17@09:06 -0700, Vineet Gupta wrote:
> Hi Christoph,
> 
> On 07/16/2017 11:42 PM, Christoph Hellwig wrote:
> > 
> > I would expect that it would support any contiguous range in
> > the kernel mapping (e.g. no vmalloc and friends).??But it's not
> > documented anywhere, and if no in kernel users makes use of that
> > fact at the moment it might be better to document a page size
> > limitation and add asserts to enforce it.
> 
> My first thought was indeed to add a BUG_ON for @size > PAGE_SIZE
> (also accounting for offset etc), but I have a feeling this will
> cause too many breakages. So perhaps it would be better to add the
> fact to Documentation that it can handle any physically contiguous
> range.

Actually, that's not historically right. ?dma_map_single() was
originally designed to be called on any region that was kmalloc'd
meaning it was capable of mapping physically contiguous > PAGE_SIZE
regions.

For years (decades?) we've been eliminating the specialised
dma_map_single() calls in favour of dma_map_sg, so it's possible there
may not be any large region consumers anymore, so it *may* be safe to
enforce a PAGE_SIZE limit, but not without auditing the remaining
callers.

James
