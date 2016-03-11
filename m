From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 11 Mar 2016 14:57:19 +0530
Subject: [PATCH 0/2] Big Endian build cleanups
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Vineet Gupta (2):
  ARC: [BE] Select correct CROSS_COMPILE prefix
  ARC: [*defconfig] No need to specify CONFIG_CROSS_COMPILE

 arch/arc/Makefile                          | 4 ++++
 arch/arc/configs/axs101_defconfig          | 1 -
 arch/arc/configs/axs103_defconfig          | 1 -
 arch/arc/configs/axs103_smp_defconfig      | 1 -
 arch/arc/configs/nsim_700_defconfig        | 1 -
 arch/arc/configs/nsim_hs_defconfig         | 1 -
 arch/arc/configs/nsim_hs_smp_defconfig     | 1 -
 arch/arc/configs/nsimosci_defconfig        | 1 -
 arch/arc/configs/nsimosci_hs_defconfig     | 1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig | 1 -
 arch/arc/configs/tb10x_defconfig           | 1 -
 arch/arc/configs/vdk_hs38_defconfig        | 1 -
 arch/arc/configs/vdk_hs38_smp_defconfig    | 1 -
 13 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.5.0
