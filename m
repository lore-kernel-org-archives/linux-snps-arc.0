From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 03 Feb 2016 22:01:54 +0100
Subject: [PATCH v7 2/2] add new platform driver for PCI RC
In-Reply-To: <20160203183844.GC10879@localhost>
References: <cover.1454349430.git.jpinto@synopsys.com>
 <56B242F0.6040704@synopsys.com> <20160203183844.GC10879@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2915520.tvWP9ESSNu@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Wednesday 03 February 2016 12:38:44 Bjorn Helgaas wrote:
> On Wed, Feb 03, 2016@06:12:00PM +0000, Joao Pinto wrote:
> 
> > - replace "snps,pcie-synopsys" for "snps,pcie-synopsys-ipk"?
> 
> This is a question for Arnd.
> 
> > - rename the driver to pcie-synopsys-ipk?
> 
> It doesn't seem necessary to me to include both "synopsys" and "ipk" in the
> filename and the driver name.  Take a look at what the existing drivers do,
> and do something similar.

The "synopsys" can go away, it's already in the vendor field of the
string. "ipk" is still a bit unspecific, I was hoping to see a specific
chip and/or version of the PCIe part. Something like

	compatible = "snps,ipk2040-pcie", "snps,ipk-pcie", "snps,dw-pcie-1.23", "snps,dw-pcie";

which would indicate that there is a chip called "ipk2040" in a family called "ipk",
and this includes the designware pcie implementation in version 1.23.

> > - update the devicetree documentation referring that the ranges also include the
> > config space
> 
> Another one for Arnd.

This one is wrong, the ranges should *not* include the config space, and if they
currently do, you must change the driver. The generic dw-pcie driver still
accepts the config space in the ranges for backwards compatibility with some
of the earlier front-ends that mistakenly did this, but new driver should not
do the same, and we should probably add some code in the common driver to
prevent it for front-ends other than the ones we have to keep compatibility with.

	Arnd
