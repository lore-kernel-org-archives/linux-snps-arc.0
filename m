From: christian.ruppert@alitech.com (christian.ruppert@alitech.com)
Date: Tue, 2 Feb 2016 14:43:02 +0100
Subject: [PATCH 7/9] ARC: use fixed frequencies in
 arc_set_early_base_baud()
In-Reply-To: <1454417606.25997.7.camel@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>	
 <1454410739-24444-8-git-send-email-vgupta@synopsys.com>
 <1454417606.25997.7.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <OFC064FA19.A440461D-ONC1257F4D.004B05DC-C1257F4D.004B3D60@alitech.com>
To: linux-snps-arc@lists.infradead.org

Alexey Brodkin <Alexey.Brodkin at synopsys.com> wrote on 02.02.2016 13:53:26:
> 
> Adding Christian for Abilis TB10x clocks review.
> 
> On Tue, 2016-02-02@16:28 +0530, Vineet Gupta wrote:
> > From: Alexey Brodkin <abrodkin at synopsys.com>
> > 
> > UARTs usually have fixed clock so we're switching to use of
> > constant values instead of something derived from core clock
> > frequency.
> > 
> > Among other things this will allow us to get rid of
> > arc_{get|set}_core_freq() and switch to generic clock
> > framework later on.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> > ---
> >  arch/arc/kernel/devtree.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> > index 7e844fd8213f..e155126c79b1 100644
> > --- a/arch/arc/kernel/devtree.c
> > +++ b/arch/arc/kernel/devtree.c
> > @@ -28,14 +28,12 @@ unsigned int __init arc_early_base_baud(void)
> > 
> >  static void __init arc_set_early_base_baud(unsigned long dt_root)
> >  {
> > -   unsigned int core_clk = arc_get_core_freq();
> > -
> >     if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
> > -      arc_base_baud = core_clk/3;
> > +      arc_base_baud = 166666667;   /* Fixed 166.7MHz clk (TB10x) */

Actually, (int)core_clk/(int)3 is 166666666 not 166666667.
I seem to remember that this rounding detail did make a difference at some 
point. Unluckily, the details are long forgotten in the mist of time...

> >     else if (of_flat_dt_is_compatible(dt_root, "snps,arc-sdp"))
> >        arc_base_baud = 33333333;   /* Fixed 33MHz clk (AXS10x) */
> >     else
> > -      arc_base_baud = core_clk;
> > +      arc_base_baud = 50000000;   /* Fixed default 50MHz */
> >  }
> >  #else
> >  #define arc_set_early_base_baud(dt_root)
> 
> -Alexey
