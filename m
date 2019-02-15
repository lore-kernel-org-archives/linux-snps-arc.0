From: clabbe@baylibre.com (LABBE Corentin)
Date: Fri, 15 Feb 2019 12:12:27 +0100
Subject: [PATCH v2 0/2] ARC: rework U-boot arguments handling
In-Reply-To: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190215111227.GA24034@Red>
To: linux-snps-arc@lists.infradead.org

On Thu, Feb 14, 2019@06:07:43PM +0300, Eugeniy Paltsev wrote:
> Reworking U-boot args handling and enable uboot support
> unconditionally.
> 
> Changes v1->v2:
>  * Drop magic number check [in this patch series]
>  * Keep comment about cndline appending
> 
> Changes RFC->v1:
>  * Don't add new ABI contract between kernel and uboot
>  * Eliminate CONFIG_ARC_UBOOT_SUPPORT Kconfig option and
>    enable uboot support unconditionally
>  * Skip invalid U-boot args instead of panic
>  * Check existing U-boot magic value
>  * Improve uboot_arg validating
>  * Minor code changes
> 
> Eugeniy Paltsev (2):
>   ARC: U-boot: check arguments paranoidly
>   ARC: enable uboot support unconditionally
> 
>  arch/arc/Kconfig                        | 12 -----
>  arch/arc/configs/nps_defconfig          |  1 -
>  arch/arc/configs/vdk_hs38_defconfig     |  1 -
>  arch/arc/configs/vdk_hs38_smp_defconfig |  2 -
>  arch/arc/kernel/head.S                  |  7 ++-
>  arch/arc/kernel/setup.c                 | 96 +++++++++++++++++++++++----------
>  6 files changed, 70 insertions(+), 49 deletions(-)
> 
> -- 
> 2.14.5
> 

Hello

Tested-by: Corentin LABBE <clabbe at baylibre.com>

It worked on our LAVA lab  along with my "arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM" patch.

Regards
