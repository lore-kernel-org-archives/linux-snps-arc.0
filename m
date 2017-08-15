From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 15 Aug 2017 17:59:21 +0000
Subject: [PATCH] hsdk: Enable INPUT_EVDEV
In-Reply-To: <20170815171233.40165-1-abrodkin@synopsys.com>
References: <20170815171233.40165-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1502819960.2586.28.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

I'll add this to?
[PATCH 3/3 v9] ARC: hsdk: initial port for HSDK board

On Tue, 2017-08-15@20:12 +0300, Alexey Brodkin wrote:
> This is required for user-space apps to work with keyboard/mice.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Eugeniy Paltsev <paltsev at synopsys.com>
> ---
> ?arch/arc/configs/hsdk_defconfig | 1 +
> ?1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arc/configs/hsdk_defconfig
> b/arch/arc/configs/hsdk_defconfig
> index f4190bcde594..b3d21277608c 100644
> --- a/arch/arc/configs/hsdk_defconfig
> +++ b/arch/arc/configs/hsdk_defconfig
> @@ -37,6 +37,7 @@ CONFIG_BLK_DEV_SD=y
> ?CONFIG_NETDEVICES=y
> ?CONFIG_STMMAC_ETH=y
> ?CONFIG_MICREL_PHY=y
> +CONFIG_INPUT_EVDEV=y
> ?# CONFIG_INPUT_KEYBOARD is not set
> ?# CONFIG_INPUT_MOUSE is not set
> ?# CONFIG_SERIO is not set
-- 
?Eugeniy Paltsev
