From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 5 Jul 2017 09:23:20 +0000
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <60e74059-85ab-3cb9-1008-57bb1ba496a6@samsung.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <CGME20170705090517epcas3p4887844d6e0e08a0f6a69697a17032975@epcas3p4.samsung.com>
 <1499245508.4224.13.camel@synopsys.com>
 <60e74059-85ab-3cb9-1008-57bb1ba496a6@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499246600.4224.19.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi?Jaehoon,

On Wed, 2017-07-05@18:13 +0900, Jaehoon Chung wrote:
> Hi Alexey,
> 
> On 07/05/2017 06:05 PM, Alexey Brodkin wrote:
> > 
> > Hi Shawn,
> > 
> > On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
> > > 
> > > dwmmc driver deprecated num-slots and plan to get rid
> > > of it finally. Just move a step to cleanup it from DT.
> > 
> > Hm, that's interesting.
> > In our upcoming devboard (HSDK, see
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_pipermail_linux-2Dsnps-2Darc_2017-2DJuly_002667.html&d=DwICaQ&c=DPL6_X_6Jk
> > XFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=b7bMsqUn3obLZnR09LeBC0q6AouAgBH_cIlb0VcM43U&s=yMZ4dGcco3uL5H1m51kiI8d2sF6MCA_IdFwT326
> > IOGk&e= )
> > we do use 2 slots of DW MobileStorage controller (even though it's not yet
> > mentioned in its .dts).
> 
> I didn't see about multiple slot for dwmmc controller.

I was about to add a second SD-card slot to hsdk.dts
once we have a peripheral attached to it working.

> > So the question is if multi-slot support gets removed from dwmmc driver or
> > it's just a .dts option gets obsoleted. In latter case I'm wondering how to
> > enable a second slot in dwmmc driver (will it just auto-probe it etc)?
> 
> In dwmmc controller, already removed the multiple slot concept.

Too bad for us as the second slot is attached to SDIO peripheral we really need.
What was a reason to get rid of multi-slot support on DW MMC?

-Alexey
