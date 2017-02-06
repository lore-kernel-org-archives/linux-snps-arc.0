From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 6 Feb 2017 19:16:48 +0000
Subject: [PATCH] net: phy: dp83867: Fix for automatically detected PHYs
In-Reply-To: <9d81d661-de8d-5854-e352-d570bbb3aa43@gmail.com>
References: <20170203165237.22452-1-abrodkin@synopsys.com>
 <20170203171031.GC15900@lunn.ch> <1486143058.2853.27.camel@synopsys.com>
 <9d81d661-de8d-5854-e352-d570bbb3aa43@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486408607.2857.9.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Florian, all,

On Fri, 2017-02-03@10:34 -0800, Florian Fainelli wrote:
> On 02/03/2017 09:30 AM, Alexey Brodkin wrote:
> > 
> > Hi Andrew,
> > 
> > On Fri, 2017-02-03@18:10 +0100, Andrew Lunn wrote:
> > > 
> > > On Fri, Feb 03, 2017@07:52:37PM +0300, Alexey Brodkin wrote:
> > > > 
> > > > 
> > > > Current implemntation returns ENODEV if device tree node for
> > > > phy is absent. But in reality there're many boards with the one
> > > > and only PHY on board and MACs that may find a PHY by querying
> > > > MDIO bus. One good example is STMMAC.
> > > 
> > > Humm, not so sure about that. That check for an OF node has always
> > > been there, since day one for this driver.
> > > 
> > > What has changed recently is where it looks for these device tree
> > > properties. It used to wrongly look in the MAC node. It was changed to
> > > look in the PHY node. So this is probably the reason you are having
> > > problems.
> > 
> > Well we don't mention PHY node in our device trees because with
> > 1 PHY connected via MDIO bus there's no point in spending electrons
> > on adding extra stuff.?
> 
> That's a terrible justification, you are running Linux on devices, if
> you care about electrons run a tiny RTOS ;)

Agree :)

> > 
> > Well in case if default settings work fine -
> > which up until now was the case for us.
> 
> You should really consider listing your Ethernet PHY as a child node of
> dwmac MDIO bus because that will be a correct and accurate
> representation of the hardware, and if the PHY driver needs specific
> properties to be given (e.g: random TX/RX delays, etc.) that is the only
> way you could communicate those properly to the PHY driver.

Agree here as well, indeed I'm going to update my .dts because
that is supposed to reflect real HW and it will be that way.

But still I'm wondering if that's a must?
In that case we need to update drivers for other PHYs and probably start
from the genphy to align requirements.

Otherwise poor guys like me who switched from one PHY to another will
end up frustrating why stuff that used to work no longer works :)

-Alexey
