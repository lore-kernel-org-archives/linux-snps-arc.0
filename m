From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 2 Feb 2016 14:26:24 +0000
Subject: [PATCH 7/9] ARC: use fixed frequencies in
 arc_set_early_base_baud()
In-Reply-To: <OFC064FA19.A440461D-ONC1257F4D.004B05DC-C1257F4D.004B3D60@alitech.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-8-git-send-email-vgupta@synopsys.com>
 <1454417606.25997.7.camel@synopsys.com>
 <OFC064FA19.A440461D-ONC1257F4D.004B05DC-C1257F4D.004B3D60@alitech.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1454423183.25997.21.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Christian,

On Tue, 2016-02-02@14:43 +0100, christian.ruppert@alitech.com wrote:
> Alexey Brodkin <Alexey.Brodkin at synopsys.com> wrote on 02.02.2016 13:53:26:
> > 
> > Adding Christian for Abilis TB10x clocks review.
> > 
> > On Tue, 2016-02-02@16:28 +0530, Vineet Gupta wrote:
> > > From: Alexey Brodkin <abrodkin at synopsys.com>
> > > 
> > > UARTs usually have fixed clock so we're switching to use of
> > > constant values instead of something derived from core clock
> > > frequency.
> > > 
> > > Among other things this will allow us to get rid of
> > > arc_{get|set}_core_freq() and switch to generic clock
> > > framework later on.
> > > 
> > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > > Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> > > ---
> > >  arch/arc/kernel/devtree.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> > > index 7e844fd8213f..e155126c79b1 100644
> > > --- a/arch/arc/kernel/devtree.c
> > > +++ b/arch/arc/kernel/devtree.c
> > > @@ -28,14 +28,12 @@ unsigned int __init arc_early_base_baud(void)
> > > 
> > >  static void __init arc_set_early_base_baud(unsigned long dt_root)
> > >  {
> > > -   unsigned int core_clk = arc_get_core_freq();
> > > -
> > >     if (of_flat_dt_is_compatible(dt_root, "abilis,arc-tb10x"))
> > > -      arc_base_baud = core_clk/3;
> > > +      arc_base_baud = 166666667;   /* Fixed 166.7MHz clk (TB10x) */
> 
> Actually, (int)core_clk/(int)3 is 166666666 not 166666667.
> I seem to remember that this rounding detail did make a difference at some 
> point. Unluckily, the details are long forgotten in the mist of time...

Interesting :)

I did that rounding intentionally hoping for the best.
But so good we've got your valuable input before it's too late.

-Alexey
