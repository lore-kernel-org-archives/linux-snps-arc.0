From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 11:07:31 +0000
Subject: [PATCH 05/10] ARC: [plat-eznps] typo fix at Kconfig
In-Reply-To: <1495679660-9598-6-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-6-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495710451.5393.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
> ?arch/arc/plat-eznps/Kconfig |????4 ++--
> ?1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
> index 1595a38..feaa471 100644
> --- a/arch/arc/plat-eznps/Kconfig
> +++ b/arch/arc/plat-eznps/Kconfig
> @@ -12,8 +12,8 @@ menuconfig ARC_PLAT_EZNPS
> ?	help
> ?	??Support for EZchip development platforms,
> ?	??based on ARC700 cores.
> -	??We handle few flavours:
> -	????- Hardware Emulator AKA HE which is FPGA based chasis
> +	??We handle few flavors:

Not really sure that change worth a trouble.
The point is both options could be used: either "flavour" (Brit-ish) or "flavor" (American-ish).

Otherwise...

Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
