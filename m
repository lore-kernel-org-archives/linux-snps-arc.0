From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 2 Mar 2017 17:35:52 +0000
Subject: [PATCH 2/2] arc: axs10x: Fix ARC PGU default clock frequency
In-Reply-To: <16273b3a26ec770f8d169f04f7cb9eb2fac55909.1487787376.git.joabreu@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
 <16273b3a26ec770f8d169f04f7cb9eb2fac55909.1487787376.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488476152.2684.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Wed, 2017-02-22@18:19 +0000, Jose Abreu wrote:
> Default clock frequency for ARC PGU does not match any
> existing HDMI mode, instead the default value matches a
> DVI mode. Change the clock frequency to 74.25MHz so that
> it matches HDMI mode 1280x720 at 60Hz
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> Cc: Carlos Palminha <palminha at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Rob Herring <robh+dt at kernel.org>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: devicetree at vger.kernel.org
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org
> ---
> ?arch/arc/boot/dts/axs10x_mb.dtsi | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index 9d882b1..41cfb29 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -51,7 +51,7 @@
> ?			pguclk: pguclk {
> ?				#clock-cells = <0>;
> ?				compatible = "fixed-clock";
> -				clock-frequency = <74440000>;
> +				clock-frequency = <74250000>;
> ?			};
> ?		};

Looks good to me but I have to note that with this change in place
monitors that don't report [correct] EDID won't work just because
if EDID is missing Linux kernel calculates pixel clock on its
own and for 1280x720 at 60?it gets 74.40 MHz which obviously differs from
yours 74.25 MHz and so?arc_pgu_crtc_atomic_check() returns?-EINVAL.

But with the fix I just sent, see
http://lists.infradead.org/pipermail/linux-snps-arc/2017-March/002173.html
everything will work again.

And once Vlad's patch for AXS PLLs gets accepted we'll finally get
support of multiple modes on AXS10x boards.

That said...

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
