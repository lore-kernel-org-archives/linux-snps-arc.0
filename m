From: robh@kernel.org (Rob Herring)
Date: Fri, 25 Mar 2016 09:39:50 -0500
Subject: [PATCH 2/5 v4] drm: Add DT bindings documentation for ARC PGU
 display controller
In-Reply-To: <1458838116-24954-3-git-send-email-abrodkin@synopsys.com>
References: <1458838116-24954-1-git-send-email-abrodkin@synopsys.com>
 <1458838116-24954-3-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160325143950.GA25362@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 24, 2016@07:48:33PM +0300, Alexey Brodkin wrote:
> This add DT bindings documentation for ARC PGU display controller.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Rob Herring <robh+dt at kernel.org>
> Cc: Pawel Moll <pawel.moll at arm.com>
> Cc: Mark Rutland <mark.rutland at arm.com>
> Cc: Ian Campbell <ijc+devicetree at hellion.org.uk>
> Cc: Kumar Gala <galak at codeaurora.org>
> Cc: devicetree at vger.kernel.org
> Cc: linux-snps-arc at lists.infradead.org
> ---
> 
> Changes v3 -> v4: (addressing Rob's comments)
>  * Removed "encoder-slave" from required properties
>  * Removed "0x" from node names
> 
> Changes v2 -> v3:
>  * Reverted back to initial larger version of example
>    with minor fixes (thanks Rob for spotting those).
> 
> Changes v1 -> v2:
>  * Removed everything except PGU node itself.
> 
>  .../devicetree/bindings/display/snps,arcpgu.txt    | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> new file mode 100644
> index 0000000..b126577
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> @@ -0,0 +1,71 @@
> +ARC PGU
> +
> +This is a display controller found on several development boards produced
> +by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
> +framebuffer and sends it to a single digital encoder (usually HDMI).
> +
> +Required properties:
> +  - compatible: "snps,arcpgu"
> +  - reg: Physical base address and length of the controller's registers.
> +  - clocks: A list of phandle + clock-specifier pairs, one for each
> +    entry in 'clock-names'.
> +  - clock-names: A list of clock names. For ARC PGU it should contain:
> +      - "pxlclk" for the clock feeding the output PLL of the controller.
> +
> +Required sub-nodes:
> +  - port: The PGU connection to an encoder chip.
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	pgu at XXXXXXXX {
> +		compatible = "snps,arcpgu";
> +		reg = <0xXXXXXXXX 0x400>;
> +		clocks = <&clock_node>;
> +		clock-names = "pxlclk";
> +		encoder-slave = <&encoder_node>;

Still in the example...

Otherwise,

Acked-by: Rob Herring <robh at kernel.org>
