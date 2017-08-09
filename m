From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 9 Aug 2017 16:43:49 +0000
Subject: [PATCH] ARC: clk: introduce HSDKv1 pll driver
In-Reply-To: <20170804015351.GW2146@codeaurora.org>
References: <20170714153128.8945-1-Eugeniy.Paltsev@synopsys.com>
 <20170804015351.GW2146@codeaurora.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1502297028.2586.4.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Stephen,?
thanks for respond, my comments are inlined below.

On Thu, 2017-08-03@18:53 -0700, Stephen Boyd wrote:
> On 07/14, Eugeniy Paltsev wrote:

> [...]
> > +	dev_dbg(clk->dev, "write configurarion: 0x%x", val);
>?
> Or just use %#x to add the 0x part.

Thanks, I don't know about this option.
>?
> [...]
>
> > +	/* input divider = reg.idiv + 1 */
> > +	idiv = 1 + ((val & CGU_PLL_CTRL_IDIV_MASK) >>
> > CGU_PLL_CTRL_IDIV_SHIFT);
> > +	/* fb divider = 2*(reg.fbdiv + 1) */
> > +	fbdiv = 2 * (1 + ((val & CGU_PLL_CTRL_FBDIV_MASK) >>
> > CGU_PLL_CTRL_FBDIV_SHIFT));
> > +	/* output divider = 2^(reg.odiv) */
> > +	odiv = 1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >>
> > CGU_PLL_CTRL_ODIV_SHIFT);
>
> Maybe just drop these comments. They're just repeating the code.

Actually I would prefer to keep them, as "2^(reg.odiv)" is more?
human-readable then
"1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >> CGU_PLL_CTRL_ODIV_SHIFT)"

> > +
> > +	rate = (u64)parent_rate * fbdiv;
> > +	do_div(rate, idiv * odiv);
> > +
> > +	return rate;
> > +}
> > +
> > +static long hsdk_pll_round_rate(struct clk_hw *hw, unsigned long
> > rate,
> > +				unsigned long *prate)
> > +{
> > +	int i;
> > +	long best_rate;
> > +	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
> > +	const struct hsdk_pll_cfg *pll_cfg = clk->pll_cfg;
> > +
> > +	if (pll_cfg[0].rate == 0)
> > +		return -EINVAL;
>?
> This happens?

Only if we add bad hsdk_pll_cfg table. But it is quite cold code - we
change pll configuration quite rare, so maybe it's better to keep this
assert?

> > +
> > +	best_rate = pll_cfg[0].rate;
> > +
> > +	for (i = 1; pll_cfg[i].rate != 0; i++) {
> > +		if (abs(rate - pll_cfg[i].rate) < abs(rate -
> > best_rate))
>?
> Alright, rate is unsigned long, and best_rate is long. abs() does
> the right thing here, but it makes me have to think twice if
> best_rate can be negative and then this is a larger number, not a
> smaller one. Can we make best_rate unsigned long in this
> function?

Yes, we can.
Anyway it's a bit strange what rate is unsigned long and round_rate
return value is long.
--?
?Eugeniy Paltsev
