From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 23 Aug 2017 12:18:40 +0000
Subject: [PATCH 3/5] ARC: AXS103: DTS: Add core pll node to manage cpu
 frequency
In-Reply-To: <9624a76d-a31f-10fc-aec5-5ffa1d437c3d@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
 <20170814161213.17522-4-Eugeniy.Paltsev@synopsys.com>
 <9624a76d-a31f-10fc-aec5-5ffa1d437c3d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503490719.15555.1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2017-08-22@13:45 -0700, Vineet Gupta wrote:
> On 08/14/2017 09:12 AM, Eugeniy Paltsev wrote:
> > Add core pll node (core_clk) to manage cpu frequency.
> > core_clk represents pll itself.
> > input_clk represents clock signal source (basically xtal) which
> > comes to pll input.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > ? arch/arc/boot/dts/axc003.dtsi?????| 11 +++++++++--
> > ? arch/arc/boot/dts/axc003_idu.dtsi | 11 +++++++++--
> > ? 2 files changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arc/boot/dts/axc003.dtsi
> > b/arch/arc/boot/dts/axc003.dtsi
> > index cc9239e..dca7e39 100644
> > --- a/arch/arc/boot/dts/axc003.dtsi
> > +++ b/arch/arc/boot/dts/axc003.dtsi
> > @@ -24,10 +24,17 @@
> > ??
> > ??		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
> > ??
> > -		core_clk: core_clk {
> > +		input_clk: input-clk {
> > ??			#clock-cells = <0>;
> > ??			compatible = "fixed-clock";
> > -			clock-frequency = <90000000>;
> > +			clock-frequency = <33333333>;
> > +		};
> > +
> > +		core_clk: core-clk at 80 {
> > +			compatible = "snps,axs10x-arc-pll-clock";
> > +			reg = <0x80 0x10>, <0x100 0x10>;
> > +			#clock-cells = <0>;
> > +			clocks = <&input_clk>;
> > ??		};
> > ??
> > ??		core_intc: archs-intc at cpu {
> > diff --git a/arch/arc/boot/dts/axc003_idu.dtsi
> > b/arch/arc/boot/dts/axc003_idu.dtsi
> > index 4ebb2170..5b56bef 100644
> > --- a/arch/arc/boot/dts/axc003_idu.dtsi
> > +++ b/arch/arc/boot/dts/axc003_idu.dtsi
> > @@ -24,10 +24,17 @@
> > ??
> > ??		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
> > ??
> > -		core_clk: core_clk {
> > +		input_clk: input-clk {
> > ??			#clock-cells = <0>;
> > ??			compatible = "fixed-clock";
> > -			clock-frequency = <100000000>;
> > +			clock-frequency = <33333333>;
> > +		};
> > +
> > +		core_clk: core-clk at 80 {
> > +			compatible = "snps,axs10x-arc-pll-clock";
> > +			reg = <0x80 0x10>, <0x100 0x10>;
> > +			#clock-cells = <0>;
> > +			clocks = <&input_clk>;
> > ??		};
> > ??
> > ??		core_intc: archs-intc at cpu {
> 
> 
> Do we have a bisectability issue here - isn't system broken
> temporarily at 2/5 -?
> and only 3/5 makes it work again - if so we need to squash them
> together !

Could you please be more specific about this bisectability issue as I
can't see it here.

If we apply 2/5 and don't apply 3/5 we simply won't change frequency
after linux boot. We won't increase frequency so I can't see any
problem here here.



---
The only problem I can see is in 4/5:
I should use
cpu-freq = <90000000>;
instead of
cpu-freq = <100000000>;
in arch/arc/boot/dts/axc003.dtsi
So diff should be like
--------------->8-----------
+???????cpus {
+???????????????#address-cells = <1>;
+???????????????#size-cells = <0>;
+
+???????????????cpu at 0 {
+???????????????????????device_type = "cpu";
+???????????????????????compatible = "snps,archs38";
+???????????????????????reg = <0>;
+???????????????????????cpu-freq = <90000000>;
+???????????????????????clocks = <&core_clk>;
+???????????????};
+???????};
+
--------------->8-----------

Should I send you v2 respin or you'll fix that up locally?
 
> -Vineet
-- 
?Eugeniy Paltsev
