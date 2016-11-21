From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Mon, 21 Nov 2016 12:37:06 +0200
Subject: [PATCH v3 0/2] DW DMAC: update device tree
In-Reply-To: <1479722477.2487.5.camel@synopsys.com>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479497189.22212.41.camel@linux.intel.com>
 <1479722477.2487.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479724626.22212.50.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2016-11-21@10:02 +0000, Alexey Brodkin wrote:
> Hi Andy,
> 
> On Fri, 2016-11-18@21:26 +0200, Andy Shevchenko wrote:
> > On Fri, 2016-11-18@22:12 +0300, Eugeniy Paltsev wrote:
> > > 
> > > It wasn't possible to enable some features like
> > > memory-to-memory transfers or multi block transfers via DT.
> > > It is fixed by these patches.
> > 
> > First of all, please, give time to reviewers to comment the patches.
> > Usually it should be at least 24h (for the series that has been sent
> > first time 1 week approximately).
> 
> I'm not really sure a lot of people get disturbed by this series
> and given this all has been discussed for months now I'd really like
> to see changes required for our HW to work to land in upstream ASAP.

I understand your concern, I'm often in the same position in many areas,
including this driver (I'm not a maintainer of slave DMA subsystem).

Though let's face the issues we have with the series:
- stuff regarding to style and alike (would be fixed in a day)
- DTS naming and conventions, this is apparently a big area, where I
might share opinion, but can't decide for
- last word by the subsystem maintainer

> Too bad we're late for 4.9 (which is supposed to be the next LTS) but
> > we need to make sure this series hits 4.10 for sure.

Vinod, is it possible to get in for this series (if we get Ack from DT
people)?

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
