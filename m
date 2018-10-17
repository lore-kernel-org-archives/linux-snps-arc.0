From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Wed, 17 Oct 2018 16:20:31 +0200
Subject: [PATCH v2] ARC: HSDK: improve reset driver
In-Reply-To: <1539784482.4199.35.camel@synopsys.com>
References: <20180928162856.4726-1-Eugeniy.Paltsev@synopsys.com>
 <1539346114.6204.5.camel@pengutronix.de>
 <1539784482.4199.35.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1539786031.4729.7.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

On Wed, 2018-10-17@13:54 +0000, Eugeniy Paltsev wrote:
[...]
> > The documentation states that calling reset_control_assert "on an
> > exclusive reset controller guarantees that the reset will be asserted."
> > Since this is clearly not the case with this driver, it is appropriate
> > to keep returning an error in this case.
> > 
> > If there is a driver that requests an exclusive reset control, calls
> > reset_control_assert, and then checks the error value to see whether
> > asserting the reset succeeded, it should be made aware that
> > we couldn't actually assert the reset line as requested. If the driver
> > can continue operation even though the reset line was not asserted,
> > it should ignore the error.
> > 
> > So if you need to hide this error, I'd like to know the actual case that
> > is fixed by this, to see if we can't fix it in a better way.
> 
> Ok, I can drop it in my case as it will work fine with certain drivers:
> (several drivers use shared reset control, other drivers use exclusive reset
> control but don't check reset_control_assert() return value)
>
> I simply want to say that this wouldn't work in all cases (without changes
> in driver which use reset control).

Ok, if there is ever such a case, please let me know.

regards
Philipp
