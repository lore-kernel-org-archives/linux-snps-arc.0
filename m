From: tpiepho@impinj.com (Trent Piepho)
Date: Wed, 15 May 2019 17:20:43 +0000
Subject: [PATCH] ARC: [plat-hsdk] Get rid of inappropriate PHY settings
In-Reply-To: <20190515153340.40074-1-abrodkin@synopsys.com>
References: <20190515153340.40074-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557940843.4229.120.camel@impinj.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2019-05-15@18:33 +0300, Alexey Brodkin wrote:
> Initial bring-up of the platform was done on FPGA prototype
> where TI's DP83867 PHY was used. And so some specific PHY
> options were added.
> 
> Just to confirm this is what we get on FPGA prototype in the bootlog:
> > TI DP83867 stmmac-0:00: attached PHY driver [TI DP83867] ...
> 
> On real board though we have Micrel KZS9031 PHY and we even have
> CONFIG_MICREL_PHY=y set in hsdk_defconfig. That's what we see in the bootlog:
> > Micrel KSZ9031 Gigabit PHY stmmac-0:00: ...
> 
> So essentially all TI-related bits have to go away.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Trent Piepho <tpiepho at impinj.com>
> Cc: Rob Herring <robh+dt at kernel.org>

Acked-by: <tpiepho at impinj.com>

> ---
>  arch/arc/boot/dts/hsdk.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> @@ -201,9 +200,6 @@

I think it would be pedantically correct to change the phy-mode to
"rgmii-id", though I see nothing in the micrel phy driver that uses
this, and so doubt it will do anything at all at this point.

The Micrel phy appears to default to putting a clock skew on the RGMII
lines and the driver will use the default if no properties are present.
So I believe what your board is effectively using now is "rgmii-id"
with default skews, unless the phy and your board design has some
resistor pin strapping that has changed this.
