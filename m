From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 6 Aug 2018 10:56:39 -0700
Subject: [PATCH] ARC: [plat-axs10x] Enable SWAP
In-Reply-To: <20180802085016.16000-1-abrodkin@synopsys.com>
References: <20180802085016.16000-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <14efb038-3fa4-9f92-740f-46ec982f2c8c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/02/2018 01:50 AM, Alexey Brodkin wrote:
> SWAP support on ARC was fixed earlier by
> commit 6e3761145a9b ("ARC: Fix CONFIG_SWAP")
> so now we may safely enable it on platforms that
> have external media like USB and SD-card.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: stable at vger.kernel.org # 6e3761145a9b: ARC: Fix CONFIG_SWAP

Does this really qualify as a fix for backport ?

> ---
>  arch/arc/configs/axs101_defconfig     | 1 -
>  arch/arc/configs/axs103_defconfig     | 1 -
>  arch/arc/configs/axs103_smp_defconfig | 1 -

Also hsdk ?
