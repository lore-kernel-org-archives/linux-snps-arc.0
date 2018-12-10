From: robh+dt@kernel.org (Rob Herring)
Date: Mon, 10 Dec 2018 07:30:23 -0600
Subject: [PATCH] ARC: Remove 0x prefix from unit-address of node names
In-Reply-To: <20181208070101.6117-1-abrodkin@synopsys.com>
References: <20181208070101.6117-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_JsqK+gRtkNe4eeu_jzzMVTO5u=a30SZZFNShxn3o6rjTQYQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sat, Dec 8, 2018 at 1:01 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Done automatically with help of:
> ----------------------->8------------------------
> sed -i 's/@0x/@/g' arch/arc/boot/dts/*.dts*
> ----------------------->8------------------------
>
> Inspired by [1] and the like.
>
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/13612017/
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Rob Herring <robh+dt at kernel.org>
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/boot/dts/abilis_tb10x.dtsi   |  4 ++--
>  arch/arc/boot/dts/axc001.dtsi         |  6 +++---
>  arch/arc/boot/dts/axc003.dtsi         | 14 +++++++-------
>  arch/arc/boot/dts/axc003_idu.dtsi     | 14 +++++++-------
>  arch/arc/boot/dts/axs10x_mb.dtsi      | 22 +++++++++++-----------
>  arch/arc/boot/dts/vdk_axc003.dtsi     |  4 ++--
>  arch/arc/boot/dts/vdk_axc003_idu.dtsi |  4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi  | 14 +++++++-------
>  8 files changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
> index 3121536b25a3..77ac1368a65b 100644
> --- a/arch/arc/boot/dts/abilis_tb10x.dtsi
> +++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
> @@ -178,7 +178,7 @@
>                         clocks = <&ahb_clk>;
>                 };
>
> -               spi0: spi at 0xFE010000 {
> +               spi0: spi at FE010000 {

This should be lowercase too.

>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         cell-index = <0>;

[...]

> @@ -119,7 +119,7 @@
>          * This node is intentionally put outside of MB above becase
>          * it maps areas outside of MB's 0xEz-0xFz.
>          */
> -       uio_ev: uio at 0xD0000000 {
> +       uio_ev: uio at D0000000 {

lowercase

>                 compatible = "generic-uio";
>                 reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
>                 reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
> --
> 2.16.2
>
