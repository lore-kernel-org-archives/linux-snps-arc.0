From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 03 Feb 2016 00:27:46 +0100
Subject: [PATCH v7 2/2] add new platform driver for PCI RC
In-Reply-To: <20160202231449.GA18009@localhost>
References: <cover.1454349430.git.jpinto@synopsys.com>
 <8223655.W63T0XOVm1@wuerfel> <20160202231449.GA18009@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <727234287.1RWoeYxhOH@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Tuesday 02 February 2016 17:14:49 Bjorn Helgaas wrote:
> On Tue, Feb 02, 2016@09:25:25PM +0100, Arnd Bergmann wrote:
> > On Monday 01 February 2016 18:07:45 Joao Pinto wrote:
> > > +static void synopsys_pcie_establish_link(struct pcie_port *pp)
> > > +{
> > > +   int retries = 0;
> > > +
> > > +   /* check if the link is up or not */
> > > +   for (retries = 0; retries < 10; retries++) {
> > > +           if (dw_pcie_link_up(pp)) {
> > > +                   dev_info(pp->dev, "Link up\n");
> > > +                   return;
> > > +           }
> > > +           mdelay(100);
> > > +   }
> > > +}
> > 
> > That mdelay() needs to be an msleep(). You should never waste
> > a whole second worth of CPU time in a driver.
> 
> There are six other copies of this code, and two of them (exynos and
> spear) have the same problem.

Good point. Maybe move one (correct) copy into the main driver file and
have it called by the other drivers?

IIRC there were some problems in drivers that did a similar
function from the config space accessors where you cannot call
msleep(), but this driver is not one of them.

	Arnd
