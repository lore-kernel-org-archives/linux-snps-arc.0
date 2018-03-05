From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 5 Mar 2018 21:49:23 +0000
Subject: [PATCH v2 2/2] dt-bindings: Document the Synopsys DW AXI DMA
 bindings
In-Reply-To: <20180305210751.7wzo2lqvyldijkot@rob-hp-laptop>
References: <20180226145628.11892-1-Eugeniy.Paltsev@synopsys.com>
 <20180226145628.11892-3-Eugeniy.Paltsev@synopsys.com>
 <20180302081408.GK15443@localhost> <1519979538.4430.7.camel@synopsys.com>
 <20180305053256.GN15443@localhost>
 <20180305210751.7wzo2lqvyldijkot@rob-hp-laptop>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1520286562.4366.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On Mon, 2018-03-05@15:07 -0600, Rob Herring wrote:
> On Mon, Mar 05, 2018@11:02:56AM +0530, Vinod Koul wrote:
> > On Fri, Mar 02, 2018@08:32:20AM +0000, Alexey Brodkin wrote:
> > > Hi Vinod,
> > > 
> > > On Fri, 2018-03-02@13:44 +0530, Vinod Koul wrote:
> > > > On Mon, Feb 26, 2018@05:56:28PM +0300, Eugeniy Paltsev wrote:
> > > > > This patch adds documentation of device tree bindings for the Synopsys
> > > > > DesignWare AXI DMA controller.
> > > > > 
> > > > > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > > > > ---
> > > > >  .../devicetree/bindings/dma/snps,dw-axi-dmac.txt   | 41 ++++++++++++++++++++++
> > > > >  1 file changed, 41 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
> > > > > new file mode 100644
> > > > > index 0000000..f237b79
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt
> > > > > @@ -0,0 +1,41 @@
> > > > > +Synopsys DesignWare AXI DMA Controller
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible: "snps,axi-dma-1.01a"
> > > > > +- reg: Address range of the DMAC registers. This should include
> > > > > +  all of the per-channel registers.
> > > > > +- interrupt: Should contain the DMAC interrupt number.
> > > > > +- interrupt-parent: Should be the phandle for the interrupt controller
> > > > > +  that services interrupts for this device.
> > > > > +- dma-channels: Number of channels supported by hardware.
> > > > > +- snps,dma-masters: Number of AXI masters supported by the hardware.
> > > > > +- snps,data-width: Maximum AXI data width supported by hardware.
> > > > > +  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)
> > > > > +- snps,priority: Priority of channel. Array size is equal to the number of
> > > > > +  dma-channels. Priority value must be programmed within [0:dma-channels-1]
> > > > > +  range. (0 - minimum priority)
> > > > > +- snps,block-size: Maximum block size supported by the controller channel.
> > > > > +  Array size is equal to the number of dma-channels.
> > > > > +
> > > > > +Optional properties:
> > > > > +- snps,axi-max-burst-len: Restrict master AXI burst length by value specified
> > > > > +  in this property. If this property is missing the maximum AXI burst length
> > > > > +  supported by DMAC is used. [1:256]
> > > > > +
> > > > > +Example:
> > > > > +
> > > > > +dmac: dma-controller at 80000 {
> > > > > +	compatible = "snps,axi-dma-1.01a";
> > > > 
> > > > do we need "snps here..?
> > > 
> > > Synopsys is this IP-block vendor so shouldn't we put it that way?
> > 
> > Not a DT expert but why should vendor name come here, you can read the
> > properties from device node, vendor name seems redundant to me
> 
> I don't follow...
> 
> In any case, yes, it must have a vendor prefix. It should also have a 
> compatible for the vendor(s) that integrate the block because they all 
> break it in different ways. Speaking of which, we already have 
> snps-dma.txt and at least Analog Devices binding using a Synopsys DMA. 
> What's the difference?
> 

There's indeed some confusion.

1. As a part of a _new_driver_ submission we're preparing DT bindings docs where we
   need to require some compatible string... well at least many other binding docs
   do so if I'm not mistaken. And so we propose to require "snps,axi-dma-1.01a"
   where version matches implementation in an SoC we currently have.

2. In that string we mention Synopsys as a vendor but for driver alone (without any particular SoC)
   it is relaeted to IP-block which might end-up being used in many different SoCs.

3. Synopsys has 2 completely different DMAC IP-blocks. Well-known AHB DMAC, see [1], [2]
   and AXI DMAC, see [3] which is not yet used anywhere and that's the one we're discussing
   currently.

4. This DW AXI DMAC seems to have nothing to do with mentioned "dma-axi-dmac.c" which
   BTW has compatible = "adi,axi-dmac-1.00.a".
   
As an underline I don't see any other option for "default" compatible for that
brand new DMAC driver, though once we start adding SoC that really use that IP-block
we may get more compatible strings if implementations differ from what we have now.

[1] https://www.synopsys.com/dw/ipdir.php?c=DW_ahb_dmac
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/dw
[3] https://www.synopsys.com/dw/ipdir.php?c=DW_axi_dmac

Regards,
Alexey
