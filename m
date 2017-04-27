From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 27 Apr 2017 15:34:33 +0000
Subject: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1493143941.24567.196.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
 <1492784977.16657.6.camel@synopsys.com>
 <1492787583.24567.120.camel@linux.intel.com>
 <1493049305.25985.4.camel@synopsys.com>
 <1493052970.24567.168.camel@linux.intel.com>
 <1493133369.25985.10.camel@synopsys.com>
 <1493143941.24567.196.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1493307272.25985.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2017-04-25@21:12 +0300, Andy Shevchenko wrote:
> On Tue, 2017-04-25@15:16 +0000, Eugeniy Paltsev wrote:
> > On Mon, 2017-04-24@19:56 +0300, Andy Shevchenko wrote:
> > > On Mon, 2017-04-24@15:55 +0000, Eugeniy Paltsev wrote:
> > > > Hi,
> > > > On Fri, 2017-04-21@18:13 +0300, Andy Shevchenko wrote:
> > > > > On Fri, 2017-04-21@14:29 +0000, Eugeniy Paltsev wrote:
> > > > > > On Tue, 2017-04-18@15:31 +0300, Andy Shevchenko wrote:
> > > > > > > On Fri, 2017-04-07@17:04 +0300, Eugeniy Paltsev wrote:
> > > > This IP can be (ans is) configured with small block size.
> > > > (note, that I am not saying about runtime HW configuration)
> > > >
> > > > And there is opportunity what we can't use sg_list directly and
> > > > need
> > > > to
> > > > split sg_list to a smaller chunks.
> > >
> > > That's what I have referred quite ago. The driver should provide
> > > an
> > > interface to tell potential caller what maximum block (number of
> > > items
> > > with given bus width) it supports.
> > >
> > > We have struct dma_parms in struct device, but what we actually
> > > need
> > > is
> > > to support similar on per channel basis in DMAengine framework.
> > >
> > > So, instead of working around this I recommend either to
> > > implement
> > > it
> > > properly or rely on the fact that in the future someone
> > > eventually
> > > does that for you.
> > >
> > > Each driver which has this re-splitting mechanism should be
> > > cleaned
> > > up and refactored.
> >
> > I still can't see any pros of this implementation.
> > There is no performance profit: we anyway need to re-splitt sg_list
> > (but now in dma-user driver instead of dma driver)
--->---
> > If we want to use same descriptors several times we just can use
> > DMA_CTRL_REUSE option - the descriptors will be created one time
> > and re-splitting will be ?ompleted only one time.
>
> There are two type of descriptors: SW and HW. That flag about SW
> descriptor, so, it in most cases has nothing to do with the actual
> entry size.

Hmm, I checked all virt-dma code attentively and I don't see this
limitation.
The only existing limitation I can see is that we can use
DMA_CTRL_REUSE only for channels supporting slave transfers. (But it is
irrelevant to our discussion)

So, we can use DMA_CTRL_REUSE for both HW/SW descriptor types.

--
?Eugeniy Paltsev
