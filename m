From: clabbe@baylibre.com (Corentin Labbe)
Date: Tue,  5 Feb 2019 08:32:13 +0000
Subject: [PATCH 0/2] arc: hsdk_defconfig: permit kernelci jobs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1549355535-22052-1-git-send-email-clabbe@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Hello

In our kernelci lab, we have one hsdk device and since it is the only
ARC device at our disposal, it is important to made it availlable for
kernelci boot jobs.

Since kernelci build only defconfig without hacking it, it is important
that defconfig are bootable by default.
And so for hsdk_defconfig, it miss two CONFIGs for let hsdk boot.

Thanks
Regards

Corentin Labbe (2):
  arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM
  arc: hsdk_defconfig: enable CONFIG_ARC_UBOOT_SUPPORT

 arch/arc/configs/hsdk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.19.2
