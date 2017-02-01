From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  1 Feb 2017 19:42:50 +0300
Subject: [PATCH 0/3] Updates for ARC VDK platform
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This series improves ARC VDK support in upstream Linux kernel by:
 1) Removal of UP configuration which is no longer supported by ARC VDK.
    Instead SMP platform with all but master cores halted is used to mimic
    UP system.

 2) Adding off-the-tree patches that enable MMC card and UIO

Alexey Brodkin (3):
  arc: vdk: Disable halt on reset
  arc: vdk: Add support of MMC controller
  arc: vdk: Add support of UIO

 arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 26 ++++++++++++++++++++++++++
 arch/arc/configs/vdk_hs38_smp_defconfig | 10 +++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

-- 
2.7.4
