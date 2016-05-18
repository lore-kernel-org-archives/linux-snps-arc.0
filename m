From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 18 May 2016 10:50:59 +0530
Subject: [PATCH] arc: axs103_smp: Fix CPU frequency to 100MHz for dual-core
In-Reply-To: <1463392663-12952-1-git-send-email-abrodkin@synopsys.com>
References: <1463392663-12952-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <573BFBBB.5020000@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 16 May 2016 03:27 PM, Alexey Brodkin wrote:
> The most recent release of AXS103 [v1.1] is proven to work
> at 100 MHz in dual-core mode so this change uses mentioned feature.
> For that we:
>  * Update axc003_idu.dtsi with mention of really-used CPU clock freq
>  * Remove clock override in AXS platform code for dual-core HW
> 
> Note we're still leaving a hack for clock "downgrade" on early boot
> for quad-core hardware.
> 
> Also note this change will break functionality of AXS103 v1.0 hardware.
> That means all users of AXS103 __must__ upgrade their boards with the
> most recent firmware.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

Applied for 4.7

Thx,
-Vineet
