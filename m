From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 10 Dec 2018 13:32:24 +0000
Subject: [PATCH] ARC: Remove 0x prefix from unit-address of node names
In-Reply-To: <CAL_JsqK+gRtkNe4eeu_jzzMVTO5u=a30SZZFNShxn3o6rjTQYQ@mail.gmail.com>
References: <20181208070101.6117-1-abrodkin@synopsys.com>
 <CAL_JsqK+gRtkNe4eeu_jzzMVTO5u=a30SZZFNShxn3o6rjTQYQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4a4b91fe634bd4352604743b3dfba245ee92a92c.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On Mon, 2018-12-10@07:30 -0600, Rob Herring wrote:
> On Sat, Dec 8, 2018 at 1:01 AM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> > Done automatically with help of:
> > ----------------------->8------------------------
> > sed -i 's/@0x/@/g' arch/arc/boot/dts/*.dts*
> > ----------------------->8------------------------
> > 
> > Inspired by [1] and the like.
> > 
> > [1] 
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__kisskb.ellerman.id.au_kisskb_buildresult_13612017_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=zx_mJ5GzAMI32-iqcXZiL8Qzrg79Dz4cxNF72VYhQl0&s=JwbFcFmnJRECl_z7jQGl0687UpORq9395mgRbo1OwFE&e=
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Rob Herring <robh+dt at kernel.org>
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > ---
> >  arch/arc/boot/dts/abilis_tb10x.dtsi   |  4 ++--
> >  arch/arc/boot/dts/axc001.dtsi         |  6 +++---
> >  arch/arc/boot/dts/axc003.dtsi         | 14 +++++++-------
> >  arch/arc/boot/dts/axc003_idu.dtsi     | 14 +++++++-------
> >  arch/arc/boot/dts/axs10x_mb.dtsi      | 22 +++++++++++-----------
> >  arch/arc/boot/dts/vdk_axc003.dtsi     |  4 ++--
> >  arch/arc/boot/dts/vdk_axc003_idu.dtsi |  4 ++--
> >  arch/arc/boot/dts/vdk_axs10x_mb.dtsi  | 14 +++++++-------
> >  8 files changed, 41 insertions(+), 41 deletions(-)
> > 
> > diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
> > index 3121536b25a3..77ac1368a65b 100644
> > --- a/arch/arc/boot/dts/abilis_tb10x.dtsi
> > +++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
> > @@ -178,7 +178,7 @@
> >                         clocks = <&ahb_clk>;
> >                 };
> > 
> > -               spi0: spi at 0xFE010000 {
> > +               spi0: spi at FE010000 {
> 
> This should be lowercase too.
> 
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >                         cell-index = <0>;
> 
> [...]
> 
> > @@ -119,7 +119,7 @@
> >          * This node is intentionally put outside of MB above becase
> >          * it maps areas outside of MB's 0xEz-0xFz.
> >          */
> > -       uio_ev: uio at 0xD0000000 {
> > +       uio_ev: uio at D0000000 {
> 
> lowercase
> 
> >                 compatible = "generic-uio";
> >                 reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;

I guess real addresses should be lower-case too, right?

-Alexey
