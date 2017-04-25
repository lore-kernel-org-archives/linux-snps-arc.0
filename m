From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 25 Apr 2017 15:16:10 +0000
Subject: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1493052970.24567.168.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1492518695.24567.56.camel@linux.intel.com>
 <1492784977.16657.6.camel@synopsys.com>
 <1492787583.24567.120.camel@linux.intel.com>
 <1493049305.25985.4.camel@synopsys.com>
 <1493052970.24567.168.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1493133369.25985.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2017-04-24@19:56 +0300, Andy Shevchenko wrote:
> On Mon, 2017-04-24@15:55 +0000, Eugeniy Paltsev wrote:
> > Hi,
> > On Fri, 2017-04-21@18:13 +0300, Andy Shevchenko wrote:
> > > On Fri, 2017-04-21@14:29 +0000, Eugeniy Paltsev wrote:
> > > > On Tue, 2017-04-18@15:31 +0300, Andy Shevchenko wrote:
> > > > > On Fri, 2017-04-07@17:04 +0300, Eugeniy Paltsev wrote:
> > > > > > This patch adds support for the DW AXI DMAC controller.
> > > > > > +static inline void
> > > > > > +axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32
> > > > > > val)
> > > > > > +{
> > > > > > +	iowrite32(val, chip->regs + reg);
> > > > >
> > > > > Are you going to use IO ports for this IP? I don't think so.
> > > > > Wouldn't be better to call readl()/writel() instead?
> > > >
> > > > As I understand, it's better to use ioread/iowrite as more
> > > > universal
> > > > IO
> > > > access way. Am I wrong?
> > >
> > > As I said above the ioreadX/iowriteX makes only sense when your
> > > IP
> > > would be accessed via IO region or MMIO. I'm pretty sure IO is
> > > not
> > > the case at all for this IP.
> >
> > MMIO? This IP works exactly via memory-mapped I/O.
>
> Yes, and why do you need to check this on each IO read/write?
> Please, switch to plain readX()/writeX() instead.
Ok, I'll switch to readX()/writeX().

> > > > > > +		val = axi_chan_ioread32(chan,
> > > > > > CH_INTSTATUS_ENA);
> > > > > > +		val &= ~irq_mask;
> > > > > > +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA,
> > > > > > val);
> > > > > > +	}
> > > > > > +
> > > > > > +	return min_t(size_t, __ffs(sdl), max_width);
> > > > > > +}
> > > > > > +static void axi_desc_put(struct axi_dma_desc *desc)
> > > > > > +{
> > > > > > +	struct axi_dma_chan *chan = desc->chan;
> > > > > > +	struct dw_axi_dma *dw = chan->chip->dw;
> > > > > > +	struct axi_dma_desc *child, *_next;
> > > > > > +	unsigned int descs_put = 0;
> > > > > > +	list_for_each_entry_safe(child, _next, &desc-
> > > > > > > xfer_list,
> > > > > >
> > > > > > xfer_list) {
> > > > >
> > > > > xfer_list looks redundant.
> > > > > Can you elaborate why virtual channel management is not
> > > > > working
> > > > > for
> > > > > you?
> > > >
> > > > Each virtual descriptor encapsulates several hardware
> > > > descriptors,
> > > > which belong to same transfer.
> > > > This list (xfer_list) is used only for allocating/freeing these
> > > > descriptors and it doesn't affect on virtual dma work logic.
> > > > I can see this approach in several drivers with VirtDMA (but
> > > > they
> > > > mostly use array instead of list)
> > >
> > > You described how most of the DMA drivers are implemented, though
> > > they
> > > are using just sg_list directly. I would recommend to do the same
> > > and
> > > get rid of this list.
> >
> > This IP can be (ans is) configured with small block size.
> > (note, that I am not saying about runtime HW configuration)
> >
> > And there is opportunity what we can't use sg_list directly and
> > need
> > to
> > split sg_list to a smaller chunks.
>
> That's what I have referred quite ago. The driver should provide an
> interface to tell potential caller what maximum block (number of
> items
> with given bus width) it supports.
>
> We have struct dma_parms in struct device, but what we actually need
> is
> to support similar on per channel basis in DMAengine framework.
>
> So, instead of working around this I recommend either to implement it
> properly or rely on the fact that in the future someone eventually
> does that for you.
>
> Each driver which has this re-splitting mechanism should be cleaned
> up and refactored.
I still can't see any pros of this implementation.
There is no performance profit: we anyway need to re-splitt sg_list
(but now in dma-user driver instead of dma driver)

If we want to use same descriptors several times we just can use
DMA_CTRL_REUSE option - the descriptors will be created one time and
re-splitting will be ?ompleted only one time.

But there are cons of this implementation:
we need to implement re-splitting mechanism in each place we use dma
instead of one dma driver. So there are more places for bugs and etc...

> > > > > Btw, are you planning to use priority at all? For now on I
> > > > > didn't
> > > > > see
> > > > > a single driver (from the set I have checked, like 4-5 of
> > > > > them)
> > > > > that
> > > > > uses priority anyhow. It makes driver more complex for
> > > > > nothing.
> > > >
> > > > Only for dma slave operations.
> > >
> > > So, in other words you *have* an actual two or more users that
> > > *need*
> > > prioritization?
> >
> > As I remember there was an idea to give higher priority to audio
> > dma
> > chanels.
>
> I don't see cyclic transfers support in the driver. So, I would
> suggest
> just drop entire prioritization for now. When it would be actual user
> one may start thinking of it.
> Just a rule of common sense: do not implement something which will
> have no user or solve non-existing problem.

Ok, I'll drop prioritization untill I implement cyclic transfers.

> > > > > As I said earlier dw_dmac is *bad* example of the (virtual
> > > > > channel
> > > > > based) DMA driver.
> > > > >
> > > > > I guess you may just fail the descriptor and don't pretend it
> > > > > has
> > > > > been processed successfully.
> > > >
> > > > What do you mean by saying "fail the descriptor"?
> > > > After I get error I cancel current transfer and free all
> > > > descriptors
> > > > from it (by calling vchan_cookie_complete).
> > > > I can't store error status in descriptor structure because it
> > > > will
> > > > be
> > > > freed by vchan_cookie_complete.
> > > > I can't store error status in channel structure because it will
> > > > be
> > > > overwritten by next transfer.
> > >
> > > Better not to pretend that it has been processed successfully.
> > > Don't
> > > call callback on it and set its status to DMA_ERROR (that's why
> > > descriptors in many drivers have dma_status field). When user
> > > asks for
> > > status (using cookie) the saved value would be returned until
> > > descriptor
> > > is active.
> > >
> > > Do you have some other workflow in mind?
> >
> > Hmm...
> > Do you mean I should left error descriptors in desc_issued list
> > or I should create another list (like desc_error) in my driver and
> > move
> > error descriptors to desc_error list?
> >
> > And when exactly should I free error descriptors?
> See below.
>
> > I checked hsu/hsu.c dma driver implementation:
> >???vdma descriptor is deleted from desc_issued list when transfer
> >???starts. When descriptor marked as error descriptor
> >???vchan_cookie_complete isn't called for this descriptor. And this
> >???descriptor isn't placed in any list. So error descriptors *never*
> >???will be freed.
> >???I don't actually like this approach.
>
> Descriptor is active until terminate_all() is called or new
> descriptor
> is supplied. So, the caller has a quite time to check on it.
>
> So, what's wrong on it by your opinion?

Hmm, this looks OK. (In my example (hsu/hsu.c driver) error descriptors
are not freed even after terminate_all is called)

> Of course, if you want to keep by some reason (should be stated what
> the reason in comment) erred descriptors, you can do that.

So, I'll create desc_error list and store failed descriptors in this
list until terminate_all() is called.
Is it OK implementation?

> > > > > > +static const struct dev_pm_ops dw_axi_dma_pm_ops = {
> > > > > > +	SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend,
> > > > > > axi_dma_runtime_resume, NULL)
> > > > > > +};
> > > > >
> > > > > Have you tried to build with CONFIG_PM disabled?
> > > >
> > > > Yes.
> > > >
> > > > > I'm pretty sure you need __maybe_unused applied to your PM
> > > > > ops.
> > > >
> > > > I call axi_dma_runtime_suspend / axi_dma_runtime_resume even I
> > > > dont't
> > > > use PM.
> > > > (I call them in probe / remove function.)
> > >
> > > Hmm... I didn't check your ->probe() and ->remove(). Do you mean
> > > you
> > > call them explicitly by those names?
> > >
> > > If so, please don't do that. Use pm_runtime_*() instead. And...
> > >
> > > > So I don't need to declare them with __maybe_unused.
> > >
> > > ...in that case it's possible you have them defined but not used.
> > >
> >
> > From my ->probe() function:
> >
> > pm_runtime_get_noresume(chip->dev);
> > ret = axi_dma_runtime_resume(chip->dev);
> >
> > Firstly I only incrememt counter.
> > Secondly explicitly call my resume function.
> >
> > I call them explicitly because I need driver to work also without
> > Runtime PM. So I can't just call pm_runtime_get here instead of
> > pm_runtime_get_noresume + axi_dma_runtime_resume.
> >
> > Of course I can copy *all* code from axi_dma_runtime_resume
> > to ->probe() function, but I don't really like this idea.
>
> It looks like you need more time to investigate how runtime PM works
> from driver point of view, but you shouldn't call your PM callbacks
> directly without a really good reason (weird silicon bugs,
> architectural impediments). I don't think that is the case here.
>
There is a simple reason:
I had to do same actions in probe/remove as in
runtime_resume/runtime_suspend.
(like enabling clock, enabling dma)

If my driver is build with RUNTIME_PM this actions will be
automatically handled by runtime pm (clock and dma will be enabled
before using and disabled after using).
Otherwise, if my driver is build without RUNTIME_PM clock and dma will
be enabled only one time - when ->probe() is called.
So I use runtime_resume callback directly for this purpose (because if
my driver is build without RUNTIME_PM this callback wiil not be called
at all)

> > > > > > +	bool		is_paused;
> > > > >
> > > > > I still didn't get (already forgot) why you can't use
> > > > > dma_status
> > > > > instead for the active descriptor?
> > > >
> > > > As I said before, I checked several driver, which have status
> > > > variable
> > > > in their channel structure - it is used *only* for
> > > > determinating
> > > > is
> > > > channel paused or not. So there is no much sense in replacing
> > > > "is_paused" to "status" and I left "is_paused" variable
> > > > untouched.
> > >
> > > Not only (see above), the errored descriptor keeps that status.
> > >
> > > > (I described above why we can't use status in channel structure
> > > > for
> > > > error handling)
> > >
> > > Ah, I'm talking about descriptor.
> >
> > Again - PAUSED is per-channel flag. So, even if we have status
> > field
> > in
> > each descriptor, it is simpler to use one per-channel flag instead
> > of
> > plenty per-descriptor flags.
> > When we pausing/resuming dma channel it is simpler to set only one
> > flag
> > instead of writing DMA_PAUSED to *each* descriptor status field.
>
> What do you mean by "each"? I don't recall the driver which can
> handle
> more than one *active* descriptor per channel. Do you?
>
> In that case status of active descriptor == status of channel. That
> trick (I also already referred to earlier) is used in some drivers.

Ok, I'll recheck others implementation.

> > > I mean, who are the users of them? If it's only one module, there
> > > is
> > > no need to put them in header.
> >
> > Yes, only one module.
> > Should I move all this definitions to axi_dma_platform.c file and
> > rid
> > of both axi_dma_platform_reg.h and axi_dma_platform.h headers?
> Depends on your design.
>
> If it would be just one C module it might make sense to use driver.c
> and driver.h or just driver.c.
> I see several drivers in current linux-next that are using latter and
> some that are using former, and number of plain driver.c variant is
> bigger.

Ok.

--
?Eugeniy Paltsev
