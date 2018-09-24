From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 24 Sep 2018 11:08:14 +0000
Subject: [PATCH] ARC: HSDK: improve reset driver
In-Reply-To: <1536921493.4112.6.camel@pengutronix.de>
References: <20180827143803.28178-1-Eugeniy.Paltsev@synopsys.com>
 <1536921493.4112.6.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1537787293.4902.22.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Philip,

On Fri, 2018-09-14@12:38 +0200, Philipp Zabel wrote:
> Hi Eugeniy,
> 
> On Mon, 2018-08-27@17:38 +0300, Eugeniy Paltsev wrote:
> > As for today HSDK reset driver implements only
> > .reset() callback.
> > 
> > In case of driver which implements one of standard
> > reset controller usage pattern
> > (call *_deassert() in probe(), call *_assert() in remove())
> > that leads to inoperability of this reset driver.
> > 
> > Improve HSDK reset driver by calling .reset() callback inside of
> > .assert()/.deassert() callbacks to avoid each reset controller
> > user adaptation for work with both reset methods
> > (reset() and .assert()/.deassert() pair)
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  drivers/reset/reset-hsdk.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/reset/reset-hsdk.c b/drivers/reset/reset-hsdk.c
> > index 8bce391c6943..1fd91df91343 100644
> > --- a/drivers/reset/reset-hsdk.c
> > +++ b/drivers/reset/reset-hsdk.c
> > @@ -86,6 +86,8 @@ static int hsdk_reset_reset(struct reset_controller_dev *rcdev,
> >  
> >  static const struct reset_control_ops hsdk_reset_ops = {
> >  	.reset	= hsdk_reset_reset,
> > +	 = hsdk_reset_reset,
> 
> This is incorrect for exclusive reset controls.
> It will cause reset_control_assert() to return success for exclusive
> reset controls, even though the .assert op failed to leave the reset
> line asserted after the function returns.
> 
> While calling hsdk_reset_reset from .assert for shared reset controls
> would be fine, I don't see how this is necessary of useful.
> If a consumer driver requires the reset to be asserted upon remove(), it
> must not request a shared reset control anyway, because with shared
> reset controls other drivers may keep the reset line deasserted
> indefinitely.

Ok, I agree that doing reset from .assert isn't necessary/useful here.
The reason I added hsdk_reset_reset into .assert is to prevent -ENOTSUPP
returning by reset_control_assert().

Lots of drivers implement following pattern to reset HW:
------------------------->8------------------------------
reset_control_assert(resets);
usleep_range(10, 1000);
reset_control_deassert(resets);
------------------------->8------------------------------

And some of them check reset_control_assert() and reset_control_deassert()
return status.

So these driver will fail if I implement only .reset and .deassert callback in my
reset driver.

I can implement something like that:
------------------------->8------------------------------
static int hsdk_dummy_assert(struct reset_controller_dev *rd, unsigned long id)
{
	return 0;
}

static const struct reset_control_ops hsdk_reset_ops = {
	.reset    = hsdk_reset_reset,
	.assert   = hsdk_dummy_assert,
	.deassert = hsdk_reset_reset,
};
------------------------->8------------------------------



> > +	.deassert = hsdk_reset_reset,
> 
> This should be fine. 

> I wonder from time to time whether this should be
> implemented in the core, in reset_control_deassert().

Sounds OK for me. At least I don't see any issues it may cause.

> regards
> Philipp
-- 
 Eugeniy Paltsev
