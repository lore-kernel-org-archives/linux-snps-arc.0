From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 21 Nov 2016 10:02:14 +0000
Subject: [PATCH v3 0/2] DW DMAC: update device tree
In-Reply-To: <1479497189.22212.41.camel@linux.intel.com>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479497189.22212.41.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479722477.2487.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,

On Fri, 2016-11-18@21:26 +0200, Andy Shevchenko wrote:
> On Fri, 2016-11-18@22:12 +0300, Eugeniy Paltsev wrote:
> > 
> > It wasn't possible to enable some features like
> > memory-to-memory transfers or multi block transfers via DT.
> > It is fixed by these patches.
> 
> First of all, please, give time to reviewers to comment the patches.
> Usually it should be at least 24h (for the series that has been sent
> first time 1 week approximately).

I'm not really sure a lot of people get disturbed by this series
and given this all has been discussed for months now I'd really like
to see changes required for our HW to work to land in upstream ASAP.

Too bad we're late for 4.9 (which is supposed to be the next LTS) but
we need to make sure this series hits 4.10 for sure.

Hope this race doesn't affect you that much.

-Alexey
