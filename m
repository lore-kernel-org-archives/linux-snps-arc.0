From: shawnguo@kernel.org (Shawn Guo)
Date: Thu, 22 Feb 2018 17:09:33 +0800
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <20180217211955.GE9640@amd>
References: <20180217211955.GE9640@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180222090932.GJ3217@dragon>
To: linux-snps-arc@lists.infradead.org

Hi Pavel,

On Sat, Feb 17, 2018@10:19:55PM +0100, Pavel Machek wrote:
...
> diff --git a/drivers/soc/imx/gpc.c b/drivers/soc/imx/gpc.c
> index 53f7275..cfb42f5 100644
> --- a/drivers/soc/imx/gpc.c
> +++ b/drivers/soc/imx/gpc.c
> @@ -348,7 +348,7 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
>  		if (i == 1) {
>  			domain->supply = devm_regulator_get(dev, "pu");
>  			if (IS_ERR(domain->supply))
> -				return PTR_ERR(domain->supply);;
> +				return PTR_ERR(domain->supply);
>  
>  			ret = imx_pgc_get_clocks(dev, domain);
>  			if (ret)
> 

Considering the controversy how the changes should be merged, I'm going
to send a separate patch just for IMX GPC driver with a reported-by-you
tag.  Thanks for catching this.

Shawn
