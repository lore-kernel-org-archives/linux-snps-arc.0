From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 25 Feb 2019 14:07:21 +0000
Subject: [PATCH resend] arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM
In-Reply-To: <1551087938-28594-1-git-send-email-clabbe@baylibre.com>
References: <1551087938-28594-1-git-send-email-clabbe@baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646820111F@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Corentin,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> On Behalf Of Corentin Labbe
> Sent: Monday, February 25, 2019 12:46 PM
> To: vineet.gupta1 at synopsys.com
> Cc: khilman at baylibre.com; linux-snps-arc at lists.infradead.org; linux-kernel at vger.kernel.org; Corentin
> Labbe <clabbe at baylibre.com>
> Subject: [PATCH resend] arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM
> 
> We have now a HSDK device in our kernelci lab, but kernel builded via
> the hsdk_defconfig lacks ramfs supports, so it cannot boot kernelci jobs
> yet.
> 
> So this patch enable CONFIG_BLK_DEV_RAM in hsdk_defconfig.
> 
> Signed-off-by: Corentin Labbe <clabbe at baylibre.com>

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
