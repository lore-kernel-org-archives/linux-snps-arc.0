From: robh@kernel.org (Rob Herring)
Date: Tue, 23 Feb 2016 14:38:41 -0600
Subject: [PATCH 2/4] drm: Add DT bindings documentation for ARC PGU
 display controller
In-Reply-To: <1455887034-7739-3-git-send-email-abrodkin@synopsys.com>
References: <1455887034-7739-1-git-send-email-abrodkin@synopsys.com>
 <1455887034-7739-3-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160223203841.GA15744@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 19, 2016@04:03:52PM +0300, Alexey Brodkin wrote:
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
>  .../devicetree/bindings/display/snps,arcpgu.txt    | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> new file mode 100644
> index 0000000..c8382fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> @@ -0,0 +1,74 @@
> +ARC PGU
> +
> +This is a display controller found on several development boards produced
> +by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
> +framebuffer and sends it to a single digital encoder (usually HDMI).
> +
> +Required properties:
> +  - compatible: "snps,arcpgu"

Seems like this should be more specific. Is there some sort or 
versioning with ARC blocks?

> +  - reg: Physical base address and length of the controller's registers.
> +  - clocks: A list of phandle + clock-specifier pairs, one for each
> +    entry in 'clock-names'.
> +  - clock-names: A list of clock names. For ARC PGU it should contain:
> +      - "pxlclk" for the clock feeding the output PLL of the controller.
> +  - encoder-slave: Phandle of encoder chip.

This is unnecessary with the OF graph.

> +
> +Required sub-nodes:
> +  - port: The PGU connection to an encoder chip. The connection is modelled
> +    using the OF graph bindings specified in
> +    Documentation/devicetree/bindings/graph.txt.
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	pgu at 0xXXXXXXXX {

Unit address should not have '0x'

> +		compatible = "snps,arcpgu";
> +		reg = <0xXXXXXXXX 0x400>;
> +		clocks = <&clock_node>;
> +		clock-names = "pxlclk";
> +		encoder-slave = <&encoder_node>;
> +
> +		port {
> +			pgu_output: endpoint {
> +				remote-endpoint = <&hdmi_enc_input>;
> +			};
> +		};
> +	};
> +
> +	/* HDMI encoder on I2C bus */
> +	i2c at 0xXXXXXXXX {
> +		compatible = "...";
> +
> +		encoder_node:encoder_node at 0xXXXXXXXX{

I2C addresses would be 8-bit only.

> +			compatible="...";
> +
> +			ports {
> +				port at 0 {
> +					reg = <0>;
> +					hdmi_enc_input:endpoint {
> +						remote-endpoint = <&pgu_output>;
> +					};
> +				};
> +
> +				port at 1 {
> +					reg = <1>;
> +					hdmi_enc_output:endpoint {
> +						remote-endpoint = <&hdmi_connector_in>;
> +					};
> +				};
> +			};
> +		};
> +	}
> +
> +	hdmi0: connector {
> +		compatible = "hdmi-connector";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_enc_output>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.5.0
> 
