From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 2 Sep 2019 12:24:42 +0000
Subject: [PATCH] mmc: dw_mmc: fix timeout calculate method
In-Reply-To: <bbfdedf8-318a-271d-fc64-472a0017583a@rock-chips.com>
References: <20190814083819.5784-1-kever.yang@rock-chips.com>
 <AM0PR04MB44819DF46C4A0C68844F13C688A00@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44819FF9900E879AA261324B88A00@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <3a4fc838-0cc9-64c8-3993-628cce6484c5@rock-chips.com>
 <CY4PR1201MB01207C7EEBA298FDD2B57711A1A20@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <c322fb38-bbc4-545e-c418-0f3eed2bf1e3@rock-chips.com>
 <CY4PR1201MB01204C5C461D25197D3B11D5A1BD0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <bbfdedf8-318a-271d-fc64-472a0017583a@rock-chips.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB01202FCF2BF2C1F75F5DE354A1BE0@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Kever,

> -----Original Message-----
> From: Kever Yang <kever.yang at rock-chips.com>
> Sent: Monday, September 2, 2019 11:05 AM
> To: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: trini at konsulko.com; Eugeniy.Paltsev at synopsys.com; Simon Glass <sjg at chromium.org>; Peng Fan
> <peng.fan at nxp.com>; u-boot at lists.denx.de
> Subject: Re: [PATCH] mmc: dw_mmc: fix timeout calculate method
> 
> Hi Alexey,
> 
> On 2019/8/30 ??9:28, Alexey Brodkin wrote:
> > Hi Kever,
> >
> > [snip]
> >
> >> I think this tree does not including this patch, Peng drop it because of
> >> this issue,
> >> so you need to apply this patch in your branch to reproduce the problem.
> >> I have send out V2 patch for this fix with only using 32bit variable
> > Could you please refer me to the problematic patch so I may try it?
> 
> This is the patch with problem, and here is the link on patchwork:
> https://patchwork.ozlabs.org/patch/1146845/

Please find my fixes here:
https://patchwork.ozlabs.org/patch/1156541/
https://patchwork.ozlabs.org/patch/1156617/

Tom do we want https://patchwork.ozlabs.org/patch/1146845/ and fixes for it
(see 2 items above) to become a part of upcoming v2019.10 release or
it will be slated for the next one?

-Alexey
