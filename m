From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Wed, 17 Oct 2018 16:25:21 +0200
Subject: [PATCH v3] ARC: HSDK: improve reset driver
In-Reply-To: <20181017140552.7331-1-Eugeniy.Paltsev@synopsys.com>
References: <20181017140552.7331-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1539786321.4729.8.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

On Wed, 2018-10-17@17:05 +0300, Eugeniy Paltsev wrote:
> As for today HSDK reset driver implements only .reset() callback.
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
> Changes v2->v3:
>  * Drop dummy .assert callback.
> 
>  drivers/reset/reset-hsdk.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-hsdk.c b/drivers/reset/reset-hsdk.c
> index 8bce391c6943..4c7b8647b49c 100644
> --- a/drivers/reset/reset-hsdk.c
> +++ b/drivers/reset/reset-hsdk.c
> @@ -86,6 +86,7 @@ static int hsdk_reset_reset(struct reset_controller_dev *rcdev,
>  
>  static const struct reset_control_ops hsdk_reset_ops = {
>  	.reset	= hsdk_reset_reset,
> +	.deassert = hsdk_reset_reset,
>  };
>  
>  static int hsdk_reset_probe(struct platform_device *pdev)

Thank you, applied to reset/next

regards
Philipp
