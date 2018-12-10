From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon, 10 Dec 2018 10:52:02 +0100
Subject: [PATCH] ARC: [zebu] Remove CONFIG_INITRAMFS_SOURCE from defconfigs
In-Reply-To: <20181210083349.35728-1-abrodkin@synopsys.com>
References: <20181210083349.35728-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181210095202.GC27385@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Dec 10, 2018@11:33:49AM +0300, Alexey Brodkin wrote:
> Zebu boards were added in v4.9 and then renamed to "haps" in v4.10.
> 
> Thus backporting
> commit 64234961c145 (ARC: configs: Remove CONFIG_INITRAMFS_SOURCE from defconfigs)
> we missed "zebu" defconfigs in v4.9.
> 
> Note this is only applicable to "linux-4.9.y"!
> 
> Spotted by KerneCI, see [1].
> 
> [1] https://storage.kernelci.org/stable/linux-4.9.y/v4.9.144/arc/zebu_hs_smp_defconfig/build.log
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Cc: Kevin Hilman <khilman at baylibre.com>
> ---
>  arch/arc/configs/zebu_hs_defconfig     | 1 -
>  arch/arc/configs/zebu_hs_smp_defconfig | 1 -
>  2 files changed, 2 deletions(-)

Now queued up, thanks.

greg k-h
