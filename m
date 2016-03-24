From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 24 Mar 2016 14:57:52 +0000
Subject: [PATCH 2/4 v3] drm: Add DT bindings documentation for ARC PGU
 display controller
In-Reply-To: <20160321130419.GA23913@rob-hp-laptop>
References: <1457710959-9562-1-git-send-email-abrodkin@synopsys.com>
 <1457710959-9562-3-git-send-email-abrodkin@synopsys.com>
 <20160321130419.GA23913@rob-hp-laptop>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458831472.12765.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On Mon, 2016-03-21@08:04 -0500, Rob Herring wrote:
> On Fri, Mar 11, 2016@06:42:37PM +0300, Alexey Brodkin wrote:
> > 
> > This add DT bindings documentation for ARC PGU display controller.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Rob Herring <robh+dt at kernel.org>
> > Cc: Pawel Moll <pawel.moll at arm.com>
> > Cc: Mark Rutland <mark.rutland at arm.com>
> > Cc: Ian Campbell <ijc+devicetree at hellion.org.uk>
> > Cc: Kumar Gala <galak at codeaurora.org>
> > Cc: David Airlie <airlied at linux.ie>
> > Cc: dri-devel at lists.freedesktop.org
> > Cc: devicetree at vger.kernel.org
> > Cc: linux-snps-arc at lists.infradead.org
> > ---
> > 
> > Changes v2 -> v3:
> > ?* Reverted back to initial larger version of example
> > ???with minor fixes (thanks Rob for spotting those).
> > 
> > Changes v1 -> v2:
> > ?* Removed everything except PGU node itself.
> > 
> > ?.../devicetree/bindings/display/snps,arcpgu.txt????| 72 ++++++++++++++++++++++
> > ?1 file changed, 72 insertions(+)
> > ?create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> > b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> > new file mode 100644
> > index 0000000..b130924
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
> > @@ -0,0 +1,72 @@
> > +ARC PGU
> > +
> > +This is a display controller found on several development boards produced
> > +by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
> > +framebuffer and sends it to a single digital encoder (usually HDMI).
> > +
> > +Required properties:
> > +??- compatible: "snps,arcpgu"
> > +??- reg: Physical base address and length of the controller's registers.
> > +??- clocks: A list of phandle + clock-specifier pairs, one for each
> > +????entry in 'clock-names'.
> > +??- clock-names: A list of clock names. For ARC PGU it should contain:
> > +??????- "pxlclk" for the clock feeding the output PLL of the controller.
> > +??- encoder-slave: Phandle of encoder chip.
> Drop this as discussed.

Ok I'll do that.
But what about my example below?
Do I need to remove encoder node from it as well?

> > 
> > +
> > +Required sub-nodes:
> > +??- port: The PGU connection to an encoder chip.
> > +
> > +Example:
> > +
> > +/ {
> > +	...
> > +
> > +	pgu at XXXXXXXX {
> > +		compatible = "snps,arcpgu";
> > +		reg = <0xXXXXXXXX 0x400>;
> > +		clocks = <&clock_node>;
> > +		clock-names = "pxlclk";
> > +		encoder-slave = <&encoder_node>;
> > +
> > +		port {
> > +			pgu_output: endpoint {
> > +				remote-endpoint = <&hdmi_enc_input>;
> > +			};
> > +		};
> > +	};
> > +
> > +	/* HDMI encoder on I2C bus */
> > +	i2c at XXXXXXXX {
> > +		compatible = "...";
> > +
> > +		encoder_node:encoder_node at 0xXX{
> Don't use underscores in node names. Just "hdmi at xx"

Ok still I may keep label "encoder_node" here, right?

-Alexey
