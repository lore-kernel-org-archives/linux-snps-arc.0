From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Aug 2017 19:12:08 +0300
Subject: [PATCH 0/5] Updates to arc clock tree managment
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

* Set and print cpu frequency at boot time generic way.
* Get rid of platform specific cpu clock configuration for AXS103 in
arch/arc/plat-axs10x/axs10x.c
* Add core pll node to AXS103 device tree to manage cpu frequency
* Refactor clock managment in arch/arc/plat-axs10x/axs10x.c

Eugeniy Paltsev (5):
  ARC: set and print cpu frequency at boot time
  ARC: AXS103: Get rid of platform specific cpu clock configuration
  ARC: AXS103: DTS: Add core pll node to manage cpu frequency
  ARC: AXS103: DTS: Set cpu frequency explicitly via dts
  ARC: AXS103: use cpu-freq param instead of /cpu_card/core_clk

 arch/arc/boot/dts/axc003.dtsi     | 24 +++++++++-
 arch/arc/boot/dts/axc003_idu.dtsi | 42 +++++++++++++++++-
 arch/arc/kernel/setup.c           | 49 +++++++++++++++++++++
 arch/arc/plat-axs10x/axs10x.c     | 92 ++-------------------------------------
 4 files changed, 115 insertions(+), 92 deletions(-)

-- 
2.9.3
