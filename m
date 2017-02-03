From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 3 Feb 2017 17:30:59 +0000
Subject: [PATCH] net: phy: dp83867: Fix for automatically detected PHYs
In-Reply-To: <20170203171031.GC15900@lunn.ch>
References: <20170203165237.22452-1-abrodkin@synopsys.com>
 <20170203171031.GC15900@lunn.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486143058.2853.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andrew,

On Fri, 2017-02-03@18:10 +0100, Andrew Lunn wrote:
> On Fri, Feb 03, 2017@07:52:37PM +0300, Alexey Brodkin wrote:
> > 
> > Current implemntation returns ENODEV if device tree node for
> > phy is absent. But in reality there're many boards with the one
> > and only PHY on board and MACs that may find a PHY by querying
> > MDIO bus. One good example is STMMAC.
> 
> Humm, not so sure about that. That check for an OF node has always
> been there, since day one for this driver.
> 
> What has changed recently is where it looks for these device tree
> properties. It used to wrongly look in the MAC node. It was changed to
> look in the PHY node. So this is probably the reason you are having
> problems.

Well we don't mention PHY node in our device trees because with
1 PHY connected via MDIO bus there's no point in spending electrons
on adding extra stuff. Well in case if default settings work fine -
which up until now was the case for us.

Just in case that's a typical example:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arc/boot/dts/axs10x_mb.dtsi#n58

----------------------->8-----------------------
	ethernet at 0x18000 {
		#interrupt-cells = <1>;
		compatible = "snps,dwmac";
		reg = < 0x18000 0x2000 >;
		interrupts = < 4 >;
		interrupt-names = "macirq";
		phy-mode = "rgmii";
		snps,pbl = < 32 >;
		clocks = <&apbclk>;
		clock-names = "stmmaceth";
		max-speed = <100>;
	};
----------------------->8-----------------------

This is especially nice because we may change the base-board and use
there another PHY and as long we have drivers for all possible PHY built
in the kernel (or available via modules) proper driver will be instantiated
based on PHY ID read from MDIO. I.e. having no PHY node in DT adds flexibility.

-Alexey
