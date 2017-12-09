From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Sat,  9 Dec 2017 16:59:14 +0300
Subject: [PATCH 0/4] ARC: Set initial core pll output frequency via DTS
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171209135918.16720-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Set initial core pll output frequency on HSDK and AXS103 via
"assigned-clock-rates" property in device tree.  
It will be applied at the core pll driver probing.

Eugeniy Paltsev (4):
  ARC: [plat-hsdk]: Set initial core pll output frequency
  ARC: [plat-hsdk]: Get rid of core pll frequency set in platform code
  ARC: [plat-axs103]: Set initial core pll output frequency
  ARC: [plat-axs103] refactor the quad core DT quirk code

 arch/arc/boot/dts/axc003.dtsi     |  3 +++
 arch/arc/boot/dts/axc003_idu.dtsi |  3 +++
 arch/arc/boot/dts/hsdk.dts        |  3 +++
 arch/arc/plat-axs10x/axs10x.c     | 18 ++++++++---------
 arch/arc/plat-hsdk/platform.c     | 42 ---------------------------------------
 5 files changed, 17 insertions(+), 52 deletions(-)

-- 
2.9.3
