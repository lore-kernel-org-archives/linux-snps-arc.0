From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 31 Oct 2016 16:58:07 -0700
Subject: [PATCH v2] ARC: Enable PERF_EVENTS in nSIM driven platforms
In-Reply-To: <1477918751-28058-1-git-send-email-abrodkin@synopsys.com>
References: <1477918751-28058-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b6ab5d25-964c-5e03-4439-9b3cdf663eb1@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/31/2016 06:00 AM, Alexey Brodkin wrote:
> Now when we have properly working performance counters in nSIM
> even with interrupt support (fix should be a part of upcoming
> nSIM engineering build 2016.12-005) we may enable perf support
> by default for all platforms that use nSIM for ARC cores simulation.
>
> Note 1: PCT node was missing for some reason in nsimosci.dts
>         while all other nSIM-related .dts files already had
>         PCT node for quite some time, so adding it now.
>
> Note 2: All defconfigs were regenerated with "make savedefconfig"
>         which led to some clean-ups in nsimosci_hs_smp_defconfig:
>         CONFIG_FRAMEBUFFER_CONSOLE=y was removed because it is
>         automatically selected now by DRM.
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>
> changes v1 -> v2:
>  * Added missing PCT Device Tree node in nsimosci.dts
>
>  arch/arc/boot/dts/nsimosci.dts             | 4 ++++
>  arch/arc/configs/nsim_700_defconfig        | 1 +
>  arch/arc/configs/nsim_hs_defconfig         | 1 +
>  arch/arc/configs/nsim_hs_smp_defconfig     | 1 +
>  arch/arc/configs/nsimosci_defconfig        | 1 +
>  arch/arc/configs/nsimosci_hs_defconfig     | 1 +
>  arch/arc/configs/nsimosci_hs_smp_defconfig | 3 +--
>  7 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
> index bcf603142a33..7fe184435956 100644
> --- a/arch/arc/boot/dts/nsimosci.dts
> +++ b/arch/arc/boot/dts/nsimosci.dts
> @@ -83,5 +83,9 @@
>  			reg = <0xf0003000 0x44>;
>  			interrupts = <7>;
>  		};
> +
> +		arcpct0: pct {
> +			compatible = "snps,archs-pct";
> +		};
>  	};

This is not the right binding for 700 pct - I've fixed it and pushed to for-next !

-Vineet
