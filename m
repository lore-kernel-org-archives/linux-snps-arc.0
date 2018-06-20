From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 20 Jun 2018 19:09:59 +0000
Subject: [PATCH v2] ARC: Add PCIe support for ARC HSDK platform
In-Reply-To: <9f41b2f9d6da018563fa35aee462ddb60afd922f.1529505192.git.gustavo.pimentel@synopsys.com>
References: <9f41b2f9d6da018563fa35aee462ddb60afd922f.1529505192.git.gustavo.pimentel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ba16de7195ab84cc6f29f1a7ec2844dbc202392d.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Gustavo,

On Wed, 2018-06-20@17:36 +0100, Gustavo Pimentel wrote:
> Add PCI support to the ARC HSDK platform allowing to use the generic PCI
> setup functions.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>
> ---
> Change v1->v2:
>  - Split initial patch, following Alexey Brodkin suggestion.
> 
>  arch/arc/plat-hsdk/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
> index 19ab3cf..556bc5e 100644
> --- a/arch/arc/plat-hsdk/Kconfig
> +++ b/arch/arc/plat-hsdk/Kconfig
> @@ -9,3 +9,4 @@ menuconfig ARC_SOC_HSDK
>  	bool "ARC HS Development Kit SOC"
>  	select CLK_HSDK
>  	select RESET_HSDK
> +	select MIGHT_HAVE_PCI

Adding Bjorn and linux-pci mailing lists, otherwise...

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
