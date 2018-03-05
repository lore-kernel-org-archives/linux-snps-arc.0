From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 5 Mar 2018 15:26:07 +0000
Subject: [PATCH v2 1/2] dmaengine: Introduce DW AXI DMAC driver
In-Reply-To: <CAHp75Vc6KtppecYJBtuXTGCzXySOUZiYqxBfb6w69f1j3J0jDQ@mail.gmail.com>
References: <20180226145628.11892-1-Eugeniy.Paltsev@synopsys.com>
 <20180226145628.11892-2-Eugeniy.Paltsev@synopsys.com>
 <CAHp75Vc6KtppecYJBtuXTGCzXySOUZiYqxBfb6w69f1j3J0jDQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1520263566.3152.17.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2018-02-26@18:42 +0200, Andy Shevchenko wrote:
> On Mon, Feb 26, 2018 at 4:56 PM, Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> > +static int parse_device_properties(struct axi_dma_chip *chip)
> > +{
> > +       ret = device_property_read_u32(dev, "snps,dma-masters", &tmp);
> 
> Why it has prefix?
> 
> > +       ret = device_property_read_u32(dev, "snps,data-width", &tmp);
> 
> Ditto.
> 
> > +       ret = device_property_read_u32_array(dev, "snps,block-size", carr,
> > +                                            chip->dw->hdata->nr_channels);
> 
> (perhaps this one can be moved outside of local namespace)
> 
> > +       ret = device_property_read_u32_array(dev, "snps,priority", carr,
> > +                                            chip->dw->hdata->nr_channels);
> 
> Can you use just "priority"?
> 
> 

Rob Herring asked me to add vendor prefix to this properties.
See http://patchwork.ozlabs.org/patch/719708/

-------------------->8--------------------------
> > +Required properties:
> > +- compatible: "snps,axi-dma"
> 
> Too generic. This needs an IP version at least.
> 
> > +- reg: Address range of the DMAC registers. This should include
> > +  all of the per-channel registers.
> > +- interrupt: Should contain the DMAC interrupt number.
> > +- interrupt-parent: Should be the phandle for the interrupt controller
> > +  that services interrupts for this device.
> > +- dma-channels: Number of channels supported by hardware.
> > +- dma-masters: Number of AXI masters supported by the hardware.
> > +- data-width: Maximum AXI data width supported by hardware.
> > +  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)
> 
> > +- priority: Priority of channel. Array property. Priority value must be
> > +  programmed within [0:dma-channels-1] range. (0 - minimum priority)
> > +- block-size: Maximum block size supported by the controller channel. Array
> > +  property.
> 
> Other than dma-channels, all these either need vendor prefix.
> 
-------------------->8--------------------------



On Fri, 2018-03-02@13:44 +0530, Vinod Koul wrote:
> On Mon, Feb 26, 2018@05:56:28PM +0300, Eugeniy Paltsev wrote:
> > +dmac: dma-controller at 80000 {
> > +	compatible = "snps,axi-dma-1.01a";
> 
> do we need "snps here..?
> 

Ditto.

-- 
 Eugeniy Paltsev
