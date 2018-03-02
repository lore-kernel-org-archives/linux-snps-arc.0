From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 2 Mar 2018 08:32:20 +0000
Subject: [PATCH v2 2/2] dt-bindings: Document the Synopsys DW AXI DMA
 bindings
In-Reply-To: <20180302081408.GK15443@localhost>
References: <20180226145628.11892-1-Eugeniy.Paltsev@synopsys.com>
 <20180226145628.11892-3-Eugeniy.Paltsev@synopsys.com>
 <20180302081408.GK15443@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1519979538.4430.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vinod,

On Fri, 2018-03-02@13:44 +0530, Vinod Koul wrote:
> On Mon, Feb 26, 2018@05:56:28PM +0300, Eugeniy Paltsev wrote:
> > This patch adds documentation of device tree bindings for the Synopsys
> > DesignWare AXI DMA controller.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  .../devicetree/bindings/dma/snps,dw-axi-dmac.txt   | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
> > new file mode 100644
> > index 0000000..f237b79
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
> > @@ -0,0 +1,41 @@
> > +Synopsys DesignWare AXI DMA Controller
> > +
> > +Required properties:
> > +- compatible: "snps,axi-dma-1.01a"
> > +- reg: Address range of the DMAC registers. This should include
> > +  all of the per-channel registers.
> > +- interrupt: Should contain the DMAC interrupt number.
> > +- interrupt-parent: Should be the phandle for the interrupt controller
> > +  that services interrupts for this device.
> > +- dma-channels: Number of channels supported by hardware.
> > +- snps,dma-masters: Number of AXI masters supported by the hardware.
> > +- snps,data-width: Maximum AXI data width supported by hardware.
> > +  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)
> > +- snps,priority: Priority of channel. Array size is equal to the number of
> > +  dma-channels. Priority value must be programmed within [0:dma-channels-1]
> > +  range. (0 - minimum priority)
> > +- snps,block-size: Maximum block size supported by the controller channel.
> > +  Array size is equal to the number of dma-channels.
> > +
> > +Optional properties:
> > +- snps,axi-max-burst-len: Restrict master AXI burst length by value specified
> > +  in this property. If this property is missing the maximum AXI burst length
> > +  supported by DMAC is used. [1:256]
> > +
> > +Example:
> > +
> > +dmac: dma-controller at 80000 {
> > +	compatible = "snps,axi-dma-1.01a";
> 
> do we need "snps here..?

Synopsys is this IP-block vendor so shouldn't we put it that way?

-Alexey
