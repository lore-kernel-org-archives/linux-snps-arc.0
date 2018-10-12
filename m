From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Fri, 12 Oct 2018 14:08:34 +0200
Subject: [PATCH v2] ARC: HSDK: improve reset driver
In-Reply-To: <20180928162856.4726-1-Eugeniy.Paltsev@synopsys.com>
References: <20180928162856.4726-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1539346114.6204.5.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

thank you for the update.

On Fri, 2018-09-28@19:28 +0300, Eugeniy Paltsev wrote:
> As for today HSDK reset driver implements only
> .reset() callback.
> 
> In case of driver which implements one of standard
> reset controller usage pattern
> (call *_deassert() in probe(), call *_assert() in remove())
> that leads to inoperability of this reset driver.
> 
> Improve HSDK reset driver by calling .reset() callback inside of
> .deassert() callback to avoid each reset controller
> user adaptation for work with both reset methods
> (reset() and {.assert() & .deassert()} pair)
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v1->v2:
>  * Don't call hsdk_reset_reset in .assert callback.
> 
>  drivers/reset/reset-hsdk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/reset/reset-hsdk.c b/drivers/reset/reset-hsdk.c
> index 8bce391c6943..399440f197c5 100644
> --- a/drivers/reset/reset-hsdk.c
> +++ b/drivers/reset/reset-hsdk.c
> @@ -84,8 +84,21 @@ static int hsdk_reset_reset(struct reset_controller_dev *rcdev,
>  	return ret;
>  }
>  
> +static int hsdk_reset_dummy(struct reset_controller_dev *rcd, unsigned long id)
> +{
> +	return 0;
> +}
> +
> +/*
> + * Doing real reset from .assert isn't necessary/useful here. So we pass
> + * 'hsdk_reset_dummy' to .assert callback to prevent -ENOTSUPP returning by
> + * reset_control_assert() to make happy drivers which check
> + * reset_control_{assert | deassert} return status.
> + */
>  static const struct reset_control_ops hsdk_reset_ops = {
>  	.reset	= hsdk_reset_reset,
> +	.assert = hsdk_reset_dummy,

Is this part really necessary though? reset_control_assert already
returns 0 in shared mode, so the only thing this does is make
reset_control_assert return 0 instead of -ENOTSUPP in exclusive mode.

The documentation states that calling reset_control_assert "on an
exclusive reset controller guarantees that the reset will be asserted."
Since this is clearly not the case with this driver, it is appropriate
to keep returning an error in this case.

If there is a driver that requests an exclusive reset control, calls
reset_control_assert, and then checks the error value to see whether
asserting the reset succeeded, it should be made aware that
we couldn't actually assert the reset line as requested. If the driver
can continue operation even though the reset line was not asserted,
it should ignore the error.

So if you need to hide this error, I'd like to know the actual case that
is fixed by this, to see if we can't fix it in a better way.

> +	.deassert = hsdk_reset_reset,

This part is fine.

>  };
>  
>  static int hsdk_reset_probe(struct platform_device *pdev)

regards
Philipp
