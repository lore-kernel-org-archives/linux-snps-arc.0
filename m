From: pavel@ucw.cz (Pavel Machek)
Date: Sat, 24 Feb 2018 09:52:27 +0100
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <20180222090932.GJ3217@dragon>
References: <20180217211955.GE9640@amd>
 <20180222090932.GJ3217@dragon>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180224085227.GA12996@amd>
To: linux-snps-arc@lists.infradead.org

Hi!

> > diff --git a/drivers/soc/imx/gpc.c b/drivers/soc/imx/gpc.c
> > index 53f7275..cfb42f5 100644
> > --- a/drivers/soc/imx/gpc.c
> > +++ b/drivers/soc/imx/gpc.c
> > @@ -348,7 +348,7 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
> >  		if (i == 1) {
> >  			domain->supply = devm_regulator_get(dev, "pu");
> >  			if (IS_ERR(domain->supply))
> > -				return PTR_ERR(domain->supply);;
> > +				return PTR_ERR(domain->supply);
> >  
> >  			ret = imx_pgc_get_clocks(dev, domain);
> >  			if (ret)
> > 
> 
> Considering the controversy how the changes should be merged, I'm going
> to send a separate patch just for IMX GPC driver with a reported-by-you
> tag.  Thanks for catching this.

That works for me.

Alternatively... Andrew Morton merged the patch to his -mm tree
(thanks!), so you don't need to take any action, and it will be
eventually fixed.

If you merge your own version of the patch, that's ok, too, since
Andrew will just drop his version.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 181 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180224/e64c8323/attachment.sig>
