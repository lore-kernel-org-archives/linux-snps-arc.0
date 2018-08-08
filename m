From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 8 Aug 2018 13:35:02 +0000
Subject: [PATCH] ARC: [plat-axs10x] Enable SWAP
In-Reply-To: <14efb038-3fa4-9f92-740f-46ec982f2c8c@synopsys.com>
References: <20180802085016.16000-1-abrodkin@synopsys.com>
 <14efb038-3fa4-9f92-740f-46ec982f2c8c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <895ec9ce12151312c093a6676c68cd00a06df5aa.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Mon, 2018-08-06@10:56 -0700, Vineet Gupta wrote:
> On 08/02/2018 01:50 AM, Alexey Brodkin wrote:
> > SWAP support on ARC was fixed earlier by
> > commit 6e3761145a9b ("ARC: Fix CONFIG_SWAP")
> > so now we may safely enable it on platforms that
> > have external media like USB and SD-card.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: stable at vger.kernel.org # 6e3761145a9b: ARC: Fix CONFIG_SWAP
> 
> Does this really qualify as a fix for backport ?
>
> > ---
> >  arch/arc/configs/axs101_defconfig     | 1 -
> >  arch/arc/configs/axs103_defconfig     | 1 -
> >  arch/arc/configs/axs103_smp_defconfig | 1 -
> 
> Also hsdk ?

Exactly - in HSDK we happened to have SWAP from the very beginning
so my intention was to align other boards so we get exactly the same
behavior on all boards once SWAP was fixed by
commit 6e3761145a9b ("ARC: Fix CONFIG_SWAP").

Otherwise since this is just a matter of toggling a config option
we may leave it up to user to decide if he/she wants to have
SWAP enabled.

That said it should be fine in either way.

-Alexey
