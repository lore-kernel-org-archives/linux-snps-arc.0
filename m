From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 8 Sep 2017 17:14:52 +0000
Subject: [PATCH] ARC: AXS10x: Add temporary quirk to reset ethernet IP
In-Reply-To: <948bc9d9-7cef-4574-2ec9-0e9b0e5e0772@synopsys.com>
References: <20170906182108.16765-1-Eugeniy.Paltsev@synopsys.com>
 <948bc9d9-7cef-4574-2ec9-0e9b0e5e0772@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504890890.30546.15.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2017-09-06@12:54 -0700, Vineet Gupta wrote:
> On 09/06/2017 11:21 AM, Eugeniy Paltsev wrote:
> > DW ethernet controller on AXS10x hangs sometimes after SW reset, so
> > add temporary quirk to reset DW ethernet controller IP core.
> > This quirk can be removed after axs10x reset driver
> > (see http://patchwork.ozlabs.org/patch/800273/)
> > or simple reset driver
> > (see https://patchwork.kernel.org/patch/9903375/)
> > will be available in upstream.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> Added to for-next !
> 
> Thx,

Hi Vineet,

Please specify if you have plans to add this patch to 4.14?

I'm asking because we mostly need this quirk in 4.14 - I hope generic simple
reset driver will be available in 4.15.

Thanks.

> 
> > ---
> > ? arch/arc/plat-axs10x/axs10x.c | 7 +++++++
> > ? 1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
> > index f1ac679..cf14ebc 100644
> > --- a/arch/arc/plat-axs10x/axs10x.c
> > +++ b/arch/arc/plat-axs10x/axs10x.c
> > @@ -111,6 +111,13 @@ static void __init axs10x_early_init(void)
> > ??
> > ??	axs10x_enable_gpio_intc_wire();
> > ??
> > +	/*
> > +	?* Reset ethernet IP core.
> > +	?* TODO: get rid of this quirk after axs10x reset driver (or simple
> > +	?* reset driver) will be available in upstream.
> > +	?*/
> > +	iowrite32((1 << 5), (void __iomem *) CREG_MB_SW_RESET);
> > +
> > ??	scnprintf(mb, 32, "MainBoard v%d", mb_rev);
> > ??	axs10x_print_board_ver(CREG_MB_VER, mb);
> > ? }
> > 
> 
> 
-- 
?Eugeniy Paltsev
