From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 5 Jul 2017 10:14:58 +0000
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <5d73fd6c-0ca3-aced-fa2a-cbf9ee119cb9@samsung.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <CGME20170705090517epcas3p4887844d6e0e08a0f6a69697a17032975@epcas3p4.samsung.com>
 <1499245508.4224.13.camel@synopsys.com>
 <60e74059-85ab-3cb9-1008-57bb1ba496a6@samsung.com>
 <1499246600.4224.19.camel@synopsys.com>
 <5d73fd6c-0ca3-aced-fa2a-cbf9ee119cb9@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499249697.4224.31.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jaehoon,

On Wed, 2017-07-05@18:58 +0900, Jaehoon Chung wrote:
> Hi Alexey,
> 
> On 07/05/2017 06:23 PM, Alexey Brodkin wrote:
> > 
> > Hi Jaehoon,
> > 
> > On Wed, 2017-07-05@18:13 +0900, Jaehoon Chung wrote:
> > > 
> > > Hi Alexey,
> > > 
> > > On 07/05/2017 06:05 PM, Alexey Brodkin wrote:
> > > > 
> > > > 
> > > > Hi Shawn,
> > > > 
> > > > On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
> > > > > 
> > > > > 
> > > > > dwmmc driver deprecated num-slots and plan to get rid
> > > > > of it finally. Just move a step to cleanup it from DT.
> > > > 
> > > > Hm, that's interesting.
> > > > In our upcoming devboard (HSDK, see
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_pipermail_linux-2Dsnps-2Darc_2017-2DJuly_002667.html&d=DwICaQ&c=DPL6_X
> > > > _6Jk
> > > > XFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=b7bMsqUn3obLZnR09LeBC0q6AouAgBH_cIlb0VcM43U&s=yMZ4dGcco3uL5H1m51kiI8d2sF6MCA_IdFw
> > > > T326
> > > > IOGk&e= )
> > > > we do use 2 slots of DW MobileStorage controller (even though it's not yet
> > > > mentioned in its .dts).
> > > 
> > > I didn't see about multiple slot for dwmmc controller.
> > 
> > I was about to add a second SD-card slot to hsdk.dts
> > once we have a peripheral attached to it working.
> 
> Sorry, Have we discuss about this?

I think it was never discussed unfortunately.

> > > > So the question is if multi-slot support gets removed from dwmmc driver or
> > > > it's just a .dts option gets obsoleted. In latter case I'm wondering how to
> > > > enable a second slot in dwmmc driver (will it just auto-probe it etc)?
> > > 
> > > In dwmmc controller, already removed the multiple slot concept.
> > 
> > Too bad for us as the second slot is attached to SDIO peripheral we really need.
> > What was a reason to get rid of multi-slot support on DW MMC?
> 
> After merged dwmmc in mainline, we were keeping the slot concept.
> During 6 years, we didn't see the use-case about multi-slots..
> In all dts files, num-slots were used to "1" like "by-default".
> It was meaningless value.
> 
> when we kept the multiple slot concept, it's complex to handle the driver.
> e,g) if upstream some patch, it has to check "cur_slot" and "slot" ..because dwmmc controller was doing context switch for slot.
> 	Sometime slot was not assigned..occurred the panic or NULL pointer dereference error.
> 
> If there is no advantage for maintaining it, then i felt that the removing multiple slot is better than keeping.
> Then we can focus on one slot..and maintenance is more easier...
> And as i know, MMC subsystem doesn't consider the multiple slot.
> 
> That's why i have removed it.

Ok that's a good reason to do it.

I was really surprised to see people prefer to add a few more
instances of DW MMC controolers in their systems (I did see about 5 of them
on some boards) instead of using extra slots of the same one controller.
I guess that's because all slots reuse the same data lines and so performance
degradation is inevitable.

Anyways we still don't have that SDIO peripheral working as expected
and for now only 1 slot is fine. Though it might become a nightmare for me
if the need for the second slot really arises. But let's see how it goes.

BTW do you know if that multi-slot functionality was ever tested at all?
Now I have a feeling that our SDIO peripheral attached to the second slot of DW MMC
is not working because:
?a) Linux driver support for multi-slot is not functional
?b) Hardware itself is not working as expected as nobody ever tried that functionality.

-Alexey
