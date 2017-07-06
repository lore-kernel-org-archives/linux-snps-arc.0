From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 6 Jul 2017 11:33:03 +0000
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <75074620-69e2-176f-fe26-1a4d99beac70@samsung.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <CGME20170705090517epcas3p4887844d6e0e08a0f6a69697a17032975@epcas3p4.samsung.com>
 <1499245508.4224.13.camel@synopsys.com>
 <60e74059-85ab-3cb9-1008-57bb1ba496a6@samsung.com>
 <1499246600.4224.19.camel@synopsys.com>
 <5d73fd6c-0ca3-aced-fa2a-cbf9ee119cb9@samsung.com>
 <1499249697.4224.31.camel@synopsys.com>
 <75074620-69e2-176f-fe26-1a4d99beac70@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499340783.3762.17.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jaehoon,

On Thu, 2017-07-06@13:17 +0900, Jaehoon Chung wrote:
> On 07/05/
> Right, that's why doesn't use the multiple slot.
> Company hopes to make the product that costumer is satisfied.
> Performance is one of important things...
> For saving about the cost that using more IP ...use the multiple slots via one IP?
> It doesn't make sense..but i don't know why your board is using the multiple slot..
> Maybe there are some reasons..?

Indeed there is. As it was quite late decision so we thought why not to use
this nice feature and serve yet another SDIO device for free with just addition of
a couple of wires (compare it with another controller integration in a SoC).

> > Anyways we still don't have that SDIO peripheral working as expected
> > and for now only 1 slot is fine. Though it might become a nightmare for me
> > if the need for the second slot really arises. But let's see how it goes.
> > 
> > BTW do you know if that multi-slot functionality was ever tested at all?
> 
> I know...i didn't never test the multi-slot..did you check the slot->sdio_id?

Well I think to some extent it worked for me but for some reason attached peripheral
was not answering to any command so there could be another problem not related to DW MMC
controller. Again as I understood slot is selected simply by supplying a clock.
I.e. data is put on the same lines for all attached SD-devices and who gets a clock from
the controller becomes active.

We'll see if I get this peripheral working then probably I'll need to revisit that
slot-related topic.

> Rockchip is using the slot 8 as sdio peripheral.

Still slot support is getting dropped? :)
Like Rockchip people don't care?

> As you already know, dwmmc needs to shift the bit according to slot.

Yeah, I saw that.

-Alexey
