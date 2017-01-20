From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Fri, 20 Jan 2017 22:48:09 +0200
Subject: [RFC] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1484936477.17477.97.camel@synopsys.com>
References: <1484909414-21078-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1484919509.2133.270.camel@linux.intel.com>
 <1484936477.17477.97.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHp75VfrRt5NHhh4f9EdsxzCEg1wT__ue5tiCBD1wMvp8NKkHw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Jan 20, 2017 at 8:21 PM, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
> Hi Andy,
> thanks for respond.
>
> I'm agree with most of the comments.
> My comments below.

So my answers!

> On Fri, 2017-01-20@15:38 +0200, Andy Shevchenko wrote:
>> On Fri, 2017-01-20@13:50 +0300, Eugeniy Paltsev wrote:
>> >
>> > This patch adds support for the DW AXI DMAC controller.
>> >
>> > DW AXI DMAC is a part of upcoming development board from Synopsys.
>> >
>> > In this driver implementation only DMA_MEMCPY and DMA_SG transfers
>> > are supported.
>> >
>> > Note: there is no DT documentation in this patch yet, but it will
>> > be added in the nearest future.
>> First of all, please use virt-dma API.
> Is it necessary?
> I couldn't find any notes about virt-dma in documentation.

I can't speak for Vinod or others, but I'm pretty sure their opinion
would be similar.
Rationale is:
- your code will be as less as twice of now
- since it's commonly used (sub)framework it allows you to create less
error prone drivers


>
>> Second, don't look to dw_dmac for examples, it's not a good one to be
>> learned from.
> Any suggestions about DMA driver to look for examples?

...that's why the reasons I would not recommend to look into dw_dmac.
Any recent driver would work. There is I see something with "*-axi-*"
in the name, which looks pretty good and simple.

>> > +   u32 val = axi_dma_ioread32(chip, DMAC_CFG);
>> > +   val &= ~DMAC_EN_MASK;
>> > +   axi_dma_iowrite32(chip, DMAC_CFG, val);
>> Better to use
>>
>> u32 val;
>>
>> val = read();
>> val &= y;
>> write(val);
>>
>> pattern.
>>
>> Same for similar places.
> Are you sure?
> I saw opposite advise to use construction like
> ------------->8---------------
> u32 val = read();
> val &= y;
> write(val);
> ------------->8---------------
> to
> reduce space.

While less lines of code is good, readability is preferred over amount of LOC.

Like I said it's matter of style. Here is my opinion and the rationale
behind it.

>> > +   if (likely(irq_mask == DWAXIDMAC_IRQ_ALL)) {
>> I doubt likely() is useful here anyhow. Have you looked into
>> assembly?
>> Does it indeed do what it's supposed to?
> Yes, i looked into assembly.
> I used "likely()" because irq_mask will be equal DWAXIDMAC_IRQ_ALL in
> 99.9% of this function call.
> It is useful here, am I wrong?

I hear that there are really rare cases when you need to use
[un]likely(). Can you show the difference in the assembly you get
between two?

>> > +static inline bool axi_dma_is_sw_enable(struct axi_dma_chip *chip)
>> > +{
>> > +   struct dw_axi_dma *dw = chip->dw;
>> > +   u32 i;
>> > +
>> > +   for (i = 0; i < dw->hdata->nr_channels; i++) {
>> > +           if (dw->chan[i].in_use)
>> Hmm... I know why we have such flag in dw_dmac, but I doubt it's
>> needed
>> in this driver. Just double check the need of it.
> I use this flag to check state of channel (used now/unused) to disable
> dmac if all channels are unused for now.

Okay, but wouldn't be easier to use runtime PM for that? You will not
need any special counter and runtime PM will take case of
enabling/disabling the device.

At LPC2016 Vinod upped topic about generic runtime PM implementation
for DMAEngine subsystem. I don't know where we are in that right now.
Perhaps he could tell us more.

>> > +
>> > +   width = sdl ? __ffs(sdl) : DWAXIDMAC_TRANS_WIDTH_MAX;

Missed comment, I'm not sure that you ever will have sdl == 0.

>> > +   ret = dma_coerce_mask_and_coherent(chip->dev,
>> > DMA_BIT_MASK(32));
>> It will not work for 64 bits, it will not work for other users of
>> this
>> driver if any (when you have different DMA mask to be set).
> Looks like I misunderstood dma_coerce_mask_and_coherent purposes of
> using.

Yeah, Russell did it as I think a kinda temporary solution for some
cases. Basically the DMA mask is set by generic platform code for
Device Tree cases. I, unfortunately don't know / forgot the details.
Please, invest a bit more time to make it clear. If you go this way,
add a comment why.

I would suggest to wait for Vinod's and perhaps others to comment
before sending a new version (it's apparently material for v4.12+).

-- 
With Best Regards,
Andy Shevchenko
