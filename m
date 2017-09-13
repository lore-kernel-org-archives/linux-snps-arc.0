From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 13 Sep 2017 15:14:45 +0000
Subject: [PATCH] ARC: [plat-axs10x]: DTS: fix sdio ciu frequency
In-Reply-To: <4df1bb54-5fa1-5089-7d96-799ccfc78fce@synopsys.com>
References: <20170912182045.20941-1-Eugeniy.Paltsev@synopsys.com>
 <4df1bb54-5fa1-5089-7d96-799ccfc78fce@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1505315684.30546.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2017-09-12@11:38 -0700, Vineet Gupta wrote:
> On 09/12/2017 11:20 AM, Eugeniy Paltsev wrote:
> > DW sdio controller has external ciu clock divider controlled
> > via register in SDIO IP. It divides sdio_ref_clk
> > (which comes from CGU) by 16 for default. So default mmcclk
> > clock (which comes to sdk_in) is 25000000 Hz.
> > 
> > So fix wrong current value (50000000 Hz) to actual 25000000 Hz.
> 
> Is this a preventive fix or there are known issues with what we have today.

Yes, it's kinda a preventive fix.
We check axs10x?ciu frequency when we found what hsdk?ciu frequency was wrong
and found that it is wring too.

I tried to run SD stress test with wrong ciu?frequency (50000000 Hz) and it passed
successfully, but we must take into account the fact that it depends on SD
card itself. For example: this SD card mostly works fine on HSDK with ciu?
frequency 8x times?higher than expected!

Alexey says that he faced with unstable SD card work on axs103 earlier but
he didn't save any artifacts about it.

> Is this triggered after addition of AXS clk driver ?
No.

> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > ? arch/arc/boot/dts/axs10x_mb.dtsi | 9 ++++++++-
> > ? 1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> > index 0ff7e07..7bdf581 100644
> > --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> > +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> > @@ -44,7 +44,14 @@
> > ??
> > ??			mmcclk: mmcclk {
> > ??				compatible = "fixed-clock";
> > -				clock-frequency = <50000000>;
> > +				/*
> > +				?* DW sdio controller has external ciu clock divider
> > +				?* controlled via register in SDIO IP. It divides
> > +				?* sdio_ref_clk (which comes from CGU) by 16 for
> > +				?* default. So default mmcclk clock (which comes
> > +				?* to sdk_in) is 25000000 Hz.
> > +				?*/
> > +				clock-frequency = <25000000>;
> > ??				#clock-cells = <0>;
> > ??			};
> > ??
> 
> 
-- 
?Eugeniy Paltsev
