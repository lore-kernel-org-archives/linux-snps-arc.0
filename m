From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 7 Jul 2017 22:28:30 +0000
Subject: [PATCH] ARC: AXS: prepare dts files for enabling PAE40 on axs103
In-Reply-To: <b6f3e4d2-0569-6f06-f690-eed3de402723@synopsys.com>
References: <20170626114725.9678-1-Eugeniy.Paltsev@synopsys.com>
 <b6f3e4d2-0569-6f06-f690-eed3de402723@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499466509.3101.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2017-07-07@12:57 -0700, Vineet Gupta wrote:
> On 06/26/2017 04:47 AM, Eugeniy Paltsev wrote:
> > 
> > Enable 64bit adressing, where it needed, to make possible
> > enabling PAE40 on axs103.
> > 
> > This patch doesn't affect on any functionality.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> > ? arch/arc/boot/dts/axc001.dtsi?????| 20 +++++++++-----------
> > ? arch/arc/boot/dts/axc003.dtsi?????| 21 ++++++++++-----------
> > ? arch/arc/boot/dts/axc003_idu.dtsi | 21 ++++++++++-----------
> > ? arch/arc/boot/dts/axs10x_mb.dtsi??|??2 +-
> > ? 4 files changed, 30 insertions(+), 34 deletions(-)
> > 
> > diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
> > index 53ce226..a380ffa 100644
> > --- a/arch/arc/boot/dts/axc001.dtsi
> > +++ b/arch/arc/boot/dts/axc001.dtsi
> > @@ -15,15 +15,15 @@
> > ??
> > ? / {
> > ??	compatible = "snps,arc";
> > -	#address-cells = <1>;
> > -	#size-cells = <1>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > ??
> > ??	cpu_card {
> > ??		compatible = "simple-bus";
> > ??		#address-cells = <1>;
> > ??		#size-cells = <1>;
> > ??
> > -		ranges = <0x00000000 0xf0000000 0x10000000>;
> > +		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
> 
> AXS101 can't support PAE etc - but I guess you still need to make the change here?
> because the DT bits for MB are shared ?

Correct that's the case. So it looks misleading but as long as we want to share MB's .dtsi
for both axs101 and axs103 we need to keep that change.

-Alexey
