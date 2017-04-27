From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Thu, 27 Apr 2017 16:33:50 +0300
Subject: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1493299300.25985.17.camel@synopsys.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
 <1492784977.16657.6.camel@synopsys.com>
 <1492787583.24567.120.camel@linux.intel.com>
 <1493049305.25985.4.camel@synopsys.com>
 <1493052970.24567.168.camel@linux.intel.com>
 <1493133369.25985.10.camel@synopsys.com>
 <1493143941.24567.196.camel@linux.intel.com>
 <1493219075.24567.211.camel@linux.intel.com>
 <1493299300.25985.17.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1493300030.24567.235.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2017-04-27@13:21 +0000, Eugeniy Paltsev wrote:
> On Wed, 2017-04-26@18:04 +0300, Andy Shevchenko wrote:
> > On Tue, 2017-04-25@21:12 +0300, Andy Shevchenko wrote:
> > > On Tue, 2017-04-25@15:16 +0000, Eugeniy Paltsev wrote:
> > > > On Mon, 2017-04-24@19:56 +0300, Andy Shevchenko wrote:
> > > > > On Mon, 2017-04-24@15:55 +0000, Eugeniy Paltsev wrote:

> > > > Hmm, this looks OK. (In my example (hsu/hsu.c driver) error
> > > > descriptors
> > > > are not freed even after terminate_all is called)
> > > 
> > > If it's active it will be freed.
> > > Otherwise caller should check somewhere that descriptor fails.
> > > 
> > > But actually this is fragile and we need to monitor failed
> > > descriptors.
> > > Thanks for reporting.
> > > 
> > > > 
> > > > > Of course, if you want to keep by some reason (should be
> > > > > stated
> > > > > what
> > > > > the reason in comment) erred descriptors, you can do that.
> > > > 
> > > > So, I'll create desc_error list and store failed descriptors in
> > > > this
> > > > list until terminate_all() is called.
> > > > Is it OK implementation?
> > > 
> > > Nope, we need to amend virt-chan API for that. I'm on it. Will
> > > send
> > > a series soon.
> > 
> > I have to correct what I wrote before.
> > 
> > We have two options:
> > a) one I proposed above;
> > b) move descriptor to complete list and call complete callback with
> > result.
> > 
> > So, it looks like the b) variant is what is done already in 4 (did I
> > calculate correctly?) drivers and respective users.
> 
> In my opinion we should call error descriptor complete callback.
> But I don't think we should move error descriptor to desc_completed
> list.
> 
> When descriptor following our error descriptor will be completed
> successfully vchan tasklet will be called.
> So all descriptors from desc_completed list will be freed (including
> our error descriptor)
> We'll lost information about error descriptors and we'll not be able
> to
> return correct status from dma_async_is_tx_complete().

While I more agree on the point that we better to have explicit list of
failed descriptors, here is another point that user (which is interested
in error checking) has to provide callback_result instead of callback.

> In my opinion, we should create desc_error list.
> When we get error we'll move descriptor to desc_error list and call
> complete callback.

Vinod, Lars, others, what is(are) your opinion(s)?

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
