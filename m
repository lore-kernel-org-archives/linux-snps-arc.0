From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 29 Sep 2017 18:54:31 +0000
Subject: [PATCH] ARC: [plat-hsdk]: Temporary fix to set CPU frequency to
 1GHz
In-Reply-To: <2a6c6616-3620-f028-9cca-ad8e8047db90@synopsys.com>
References: <20170928143329.10875-1-Eugeniy.Paltsev@synopsys.com>
 <2a6c6616-3620-f028-9cca-ad8e8047db90@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1506711271.3461.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2017-09-29@11:34 -0700, Vineet Gupta wrote:
> On 09/28/2017 07:33 AM, Eugeniy Paltsev wrote:
> > Add temporary fix to HSDK platform code to setup CPU frequency
> > to 1GHz on early boot.
> > We can remove this fix when smart hsdk pll driver will be
> > introduced, see discussion:
> > https://www.mail-archive.com/linux-snps-arc at lists.infradead.org/msg02689.html
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > ? arch/arc/plat-hsdk/platform.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> > ? 1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
> > index a2e7fd1..744e62e 100644
> > --- a/arch/arc/plat-hsdk/platform.c
> > +++ b/arch/arc/plat-hsdk/platform.c
> > @@ -38,6 +38,42 @@ static void __init hsdk_init_per_cpu(unsigned int cpu)
> > ? #define CREG_PAE		(CREG_BASE + 0x180)
> > ? #define CREG_PAE_UPDATE		(CREG_BASE + 0x194)
> > ??
> > +#define CREG_CORE_IF_CLK_DIV	(CREG_BASE + 0x4B8)
> > +#define CREG_CORE_IF_CLK_DIV_2	0x1
> > +#define CGU_BASE		ARC_PERIPHERAL_BASE
> > +#define CGU_PLL_STATUS		(ARC_PERIPHERAL_BASE + 0x4)
> > +#define CGU_PLL_CTRL		(ARC_PERIPHERAL_BASE + 0x0)
> > +#define CGU_PLL_STATUS_LOCK	BIT(0)
> > +#define CGU_PLL_STATUS_ERR	BIT(1)
> > +#define CGU_PLL_CTRL_1GHZ	0x3A10
> > +#define HSDK_PLL_LOCK_TIMEOUT	500
> > +
> > +#define HSDK_PLL_LOCKED() \
> > +	!!(ioread32((void __iomem *) CGU_PLL_STATUS) & CGU_PLL_STATUS_LOCK)
> > +
> > +#define HSDK_PLL_ERR() \
> > +	!!(ioread32((void __iomem *) CGU_PLL_STATUS) & CGU_PLL_STATUS_ERR)
> > +
> > +static void __init hsdk_set_cpu_freq_1ghz(void)
> > +{
> > +	u32 timeout = HSDK_PLL_LOCK_TIMEOUT;
> > +
> > +	/*
> > +	?* As we set cpu clock which exceeds 500MHz, the divider for the interface
> > +	?* clock must be programmed to div-by-2.
> > +	?*/
> > +	iowrite32(CREG_CORE_IF_CLK_DIV_2, (void __iomem *) CREG_CORE_IF_CLK_DIV);
> > +
> > +	/* Set cpu clock to 1GHz */
> > +	iowrite32(CGU_PLL_CTRL_1GHZ, (void __iomem *) CGU_PLL_CTRL);
> > +
> > +	while (!HSDK_PLL_LOCKED() && timeout--)
> > +		cpu_relax();
> > +
> > +	if (!HSDK_PLL_LOCKED() || HSDK_PLL_ERR())
> > +		pr_err("Failed to setup CPU frequency to 1GHz!");
> > +}
> > +
> > ? static void __init hsdk_init_early(void)
> > ? {
> > ??	/*
> > @@ -52,6 +88,12 @@ static void __init hsdk_init_early(void)
> > ??
> > ??	/* Really apply settings made above */
> > ??	writel(1, (void __iomem *) CREG_PAE_UPDATE);
> > +
> > +	/*
> > +	?* Setup CPU frequency to 1GHz.
> > +	?* TODO: remove it after smart hsdk pll driver will be introduced.
> > +	?*/
> > +	hsdk_set_cpu_freq_1ghz();
> > ? }
> 
> While this suffices our needs in the interim, is there a way to invoke the?
> existing clk driver to achieve the same results ?

There is only one place where we can add call of existing clk driver to set
cpu frequency.
It is in time_init function between early clock initialising and clocksource timer
probing:

------------------arch/arc/kernel/setup.c--------------------------
/*
?* Called from start_kernel() - boot CPU only
?*/
void __init time_init(void)
{
	of_clk_init(NULL);
	                      /*  <--- We can add it here. */
	timer_probe();
}
--------------------------->8--------------------------------------

It will be look like that:
https://www.mail-archive.com/linux-snps-arc at lists.infradead.org/msg02587.html


> > ??
> > ? static const char *hsdk_compat[] __initconst = {
> > 
> 
> 
-- 
?Eugeniy Paltsev
