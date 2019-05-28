From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 28 May 2019 10:10:22 -0700
Subject: [PATCH] ARC: [plat-hsdk] Get rid of inappropriate PHY settings
In-Reply-To: <20190515153340.40074-1-abrodkin@synopsys.com>
References: <20190515153340.40074-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <968eb5f2-1a9b-f9bb-8a49-ad5221c4d274@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 5/15/19 8:33 AM, Alexey Brodkin wrote:
> Initial bring-up of the platform was done on FPGA prototype
> where TI's DP83867 PHY was used. And so some specific PHY
> options were added.
> 
> Just to confirm this is what we get on FPGA prototype in the bootlog:
> | TI DP83867 stmmac-0:00: attached PHY driver [TI DP83867] ...
> 
> On real board though we have Micrel KZS9031 PHY and we even have
> CONFIG_MICREL_PHY=y set in hsdk_defconfig. That's what we see in the bootlog:
> | Micrel KSZ9031 Gigabit PHY stmmac-0:00: ...
> 
> So essentially all TI-related bits have to go away.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Trent Piepho <tpiepho at impinj.com>
> Cc: Rob Herring <robh+dt at kernel.org>

Added to for-curr.

Thx,
-Vineet
