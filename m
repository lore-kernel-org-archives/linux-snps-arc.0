From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 04 Feb 2016 14:12:40 +0100
Subject: [PATCH v7 2/2] add new platform driver for PCI RC
In-Reply-To: <56B331BF.2000406@synopsys.com>
References: <cover.1454349430.git.jpinto@synopsys.com>
 <2915520.tvWP9ESSNu@wuerfel> <56B331BF.2000406@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5558330.K4tT8JUImA@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Thursday 04 February 2016 11:10:55 Joao Pinto wrote:
> > The "synopsys" can go away, it's already in the vendor field of the
> > string. "ipk" is still a bit unspecific, I was hoping to see a specific
> > chip and/or version of the PCIe part. Something like
> > 
> >       compatible = "snps,ipk2040-pcie", "snps,ipk-pcie", "snps,dw-pcie-1.23", "snps,dw-pcie";
> > 
> > which would indicate that there is a chip called "ipk2040" in a family called "ipk",
> > and this includes the designware pcie implementation in version 1.23.
> > 
> 
> "snps,dw-pcie" seems a good idea!
> 

Just to clarify: I really meant you should put all four of the strings
into the compatible property.

	Arnd
