From: andrew@lunn.ch (Andrew Lunn)
Date: Fri, 3 Feb 2017 18:54:51 +0100
Subject: [PATCH] net: phy: dp83867: Fix for automatically detected PHYs
In-Reply-To: <1486143058.2853.27.camel@synopsys.com>
References: <20170203165237.22452-1-abrodkin@synopsys.com>
 <20170203171031.GC15900@lunn.ch>
 <1486143058.2853.27.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170203175451.GG15900@lunn.ch>
To: linux-snps-arc@lists.infradead.org

> This is especially nice because we may change the base-board and use
> there another PHY and as long we have drivers for all possible PHY built
> in the kernel (or available via modules) proper driver will be instantiated
> based on PHY ID read from MDIO. I.e. having no PHY node in DT adds flexibility.

The device tree node does not prevent this. It will still load the
driver based on the PHY ID in the PHY. You might run into problems if
the address on the MDIO bus changes, but it is also possible to not
have a reg property, and it will match the node to whatever PHY it
finds during the scan of the bus.

      Andrew
