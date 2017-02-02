From: yuriy.kolerov@synopsys.com (Yuriy Kolerov)
Date: Thu,  2 Feb 2017 03:13:31 +0300
Subject: [PATCH 0/2] Delete deprecated parameters in Device Trees
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485994413-14487-1-git-send-email-yuriy.kolerov@synopsys.com>
To: linux-snps-arc@lists.infradead.org

  * Remove support of the second argument in IDU interrupts (it is
    deprecated and not used anymore).
  * Remove useless declaration of interrupts list in IDU intc because
    it is not used anymore and the kernel can obtain information about
    supported interrupts from build registers.
  * Some small clean ups. 

Yuriy Kolerov (2):
  ARCv2: IDU-intc: Delete deprecated parameters in Device Trees
  ARCv2: intc: Delete useless comments in Device Trees

 .../interrupt-controller/snps,archs-idu-intc.txt   | 24 ++++++----------------
 arch/arc/boot/dts/axc003_idu.dtsi                  | 23 +++------------------
 arch/arc/boot/dts/haps_hs_idu.dts                  | 11 ++--------
 arch/arc/boot/dts/nsim_hs_idu.dts                  | 15 ++------------
 arch/arc/boot/dts/nsimosci_hs_idu.dts              | 21 ++++---------------
 arch/arc/boot/dts/vdk_axc003_idu.dtsi              | 13 +++---------
 arch/arc/kernel/mcip.c                             | 17 +--------------
 7 files changed, 21 insertions(+), 103 deletions(-)

-- 
2.7.4
