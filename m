From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Fri, 11 Nov 2016 13:05:57 +0200
Subject: [PATCH v3 0/3] dmaengine: DW DMAC: split pdata to hardware
 properties
In-Reply-To: <1478795309.2603.55.camel@synopsys.com>
References: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1478087707.2603.7.camel@synopsys.com>
 <1478526908.5295.67.camel@linux.intel.com>
 <1478607771.2603.31.camel@synopsys.com>
 <1478612190.5295.92.camel@linux.intel.com>
 <1478795309.2603.55.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHp75VdUPDXk-TMHGkoHAYmtJnR+0hdG8S7Rkkd=ftUp_AAcWg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 10, 2016 at 6:28 PM, Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
> On Tue, 2016-11-08@15:36 +0200, Andy Shevchenko wrote:
>> On Tue, 2016-11-08@12:22 +0000, Eugeniy Paltsev wrote:
>> > On Mon, 2016-11-07@15:55 +0200, Andy Shevchenko wrote:

>> > > > @@ -52,6 +55,7 @@ struct dw_dma_platform_data {
>> > > >         unsigned int    nr_channels;
>> > > >         bool            is_private;
>> > > >         bool            is_memcpy;
>> > > >
>> > > > +       bool            only_quirks_used;

>> > > Perhaps add if at the end of quirk list and name just

>> > > >         bool            is_nollp;
>> > > ...here
>> > >
>> > > bool use_quirks;
>> What do think about shorten name?
>>
> I don't know better short and understandable name for "use_quirks"
> variable. You can suggest your ideas if you want.

This is my suggestion. In your patch I saw longer one.

>
>> >
>> > I don't treat "is_nollp" as quirks like "is_private" or
>> > "is_memcpy".
>> > It is like general pdata field: we can easily read it from
>> > autoconfig
>> > registers (and we don't have any problem with that) in case of
>> > pdata/device-tree absence (as opposed to quirks like "is_private"
>> > or
>> > "is_memcpy")
>> >
>> > So, in PATCH v3 series "is_nollp" used as regular pdata field.
>> I still would consider is_nollp as a quirk since nothing prevents to
>> override the hardware value (see Intel Quark case).
>>
> Do you mean this issue:
> http://www.spinics.net/lists/linux-serial/msg22948.html
> ?
>
> As I remember, we had problems with next code:
> ---------------------------->8--------------------------
> channel_writel(dwc, LLP, DWC_LLP_LOC(0xffffffff));
> dwc->nollp = DWC_LLP_LOC(channel_readl(dwc, LLP)) == 0;
> channel_writel(dwc, LLP, 0);
> ---------------------------->8--------------------------
> which was executed if we didn't use autoconfig registers.
> This code doesn't used anymore.
>
> And we don't have any problems with autoconfig registers!

Yeah, but we have a quirk.

> So in case of Intel Quark we will read "nollp" parameter from pdata or
> from autoconfig registers (in case of pdata absence). It should work
> fine in both cases.
> Please correct me if I'm wrong.
>
> So, in my opinion, "is_nollp" should be used as regular pdata field.

Let's discuss it a bit later.

-- 
With Best Regards,
Andy Shevchenko
