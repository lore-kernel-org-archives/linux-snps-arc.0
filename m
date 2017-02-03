From: andrew@lunn.ch (Andrew Lunn)
Date: Fri, 3 Feb 2017 18:10:31 +0100
Subject: [PATCH] net: phy: dp83867: Fix for automatically detected PHYs
In-Reply-To: <20170203165237.22452-1-abrodkin@synopsys.com>
References: <20170203165237.22452-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170203171031.GC15900@lunn.ch>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 03, 2017@07:52:37PM +0300, Alexey Brodkin wrote:
> Current implemntation returns ENODEV if device tree node for
> phy is absent. But in reality there're many boards with the one
> and only PHY on board and MACs that may find a PHY by querying
> MDIO bus. One good example is STMMAC.

Humm, not so sure about that. That check for an OF node has always
been there, since day one for this driver.

What has changed recently is where it looks for these device tree
properties. It used to wrongly look in the MAC node. It was changed to
look in the PHY node. So this is probably the reason you are having
problems.

Having said that, your patch looks O.K.

Reviewed-by: Andrew Lunn <andrew at lunn.ch>

    Andrew
