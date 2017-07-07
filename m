From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 7 Jul 2017 22:41:43 +0000
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <52fb6208-713a-bbd6-3a19-d05df63b8fb6@synopsys.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
 <1499415208.11821.12.camel@synopsys.com>
 <52fb6208-713a-bbd6-3a19-d05df63b8fb6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499467302.3101.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2017-07-07@15:35 -0700, Vineet Gupta wrote:
> On 07/07/2017 01:13 AM, Alexey Brodkin wrote:
> > 
> > Hi Shawn,
> > 
> > On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
> > > 
> > > dwmmc driver deprecated num-slots and plan to get rid
> > > of it finally. Just move a step to cleanup it from DT.
> > > 
> > > Cc: Jaehoon Chung <jh80.chung at samsung.com>
> > > Signed-off-by: Shawn Lin <shawn.lin at rock-chips.com>
> > > ---
> > Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
> > 
> > Probably it worth for Vineet to pull this patch to his ARC tree.
> > 
> > -Alexey
> 
> I'd prefer it goes via the tree which changed the driver in first place !

That's OK.

> BTW we do need this multi-slot support in driver for HSDK - NO ?

We do need this but:
1) We still cannot get that Wi-Fi module to work in SDIO mode on HSDK.
2) It is unclear if multi-slot support was ever tested at all as it turned
? ?out nobody ever used that for real.

So I'd better return to this topic once we have SDIO on the second slot working
at least in bare-metal test app.

-Alexey
