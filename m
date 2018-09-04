From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 4 Sep 2018 21:34:43 +0000
Subject: [PATCH v2 0/4] ARC: allow to use IOC and non-IOC DMA devices
 simultaneously
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
 <ae6d35d6-ee1e-abde-5e5c-a4c489d1abb7@synopsys.com>
 <20180904211107.GA8202@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B091717@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/04/2018 02:07 PM, Christoph Hellwig wrote:
> On Tue, Sep 04, 2018@01:14:49PM -0700, Vineet Gupta wrote:
>> Apologies for the delay in getting to this - series applied and pushed to for-curr
> This is going to create really annoying merge conflicts with
> work pending for the dma-mapping tree.  That's why I requested earlier
> to merge it either via the dma-mapping tree or some shared branch.

Sorry I missed that request of yours on top of the last msg. I would really want
this to get into 4.19 (understand that merge window is done etc) given that
there's a bunch of other changes lined up behind this one. I was just sucked up
into "other" stuff and could not get to it sooner. Please bear with me this once -
hopefully it would be smoother going fwd.

Thx,
-Vineet
