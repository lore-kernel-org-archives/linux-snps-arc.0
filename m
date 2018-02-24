From: shawnguo@kernel.org (Shawn Guo)
Date: Sat, 24 Feb 2018 16:56:27 +0800
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <20180224085227.GA12996@amd>
References: <20180217211955.GE9640@amd> <20180222090932.GJ3217@dragon>
 <20180224085227.GA12996@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180224085626.GN3217@dragon>
To: linux-snps-arc@lists.infradead.org

On Sat, Feb 24, 2018@09:52:27AM +0100, Pavel Machek wrote:
> Hi!
> 
> > > diff --git a/drivers/soc/imx/gpc.c b/drivers/soc/imx/gpc.c
> > > index 53f7275..cfb42f5 100644
> > > --- a/drivers/soc/imx/gpc.c
> > > +++ b/drivers/soc/imx/gpc.c
> > > @@ -348,7 +348,7 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
> > >  		if (i == 1) {
> > >  			domain->supply = devm_regulator_get(dev, "pu");
> > >  			if (IS_ERR(domain->supply))
> > > -				return PTR_ERR(domain->supply);;
> > > +				return PTR_ERR(domain->supply);
> > >  
> > >  			ret = imx_pgc_get_clocks(dev, domain);
> > >  			if (ret)
> > > 
> > 
> > Considering the controversy how the changes should be merged, I'm going
> > to send a separate patch just for IMX GPC driver with a reported-by-you
> > tag.  Thanks for catching this.
> 
> That works for me.
> 
> Alternatively... Andrew Morton merged the patch to his -mm tree
> (thanks!), so you don't need to take any action, and it will be
> eventually fixed.

Okay, I'm dropping my patch from IMX tree.

Shawn
