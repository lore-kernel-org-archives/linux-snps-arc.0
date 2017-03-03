From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Fri,  3 Mar 2017 14:29:59 +0300
Subject: [PATCH 0/3] ARC: get frequency via clock driver instead of reading
 device tree
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This patch series replaces reading device tree with getting CPU
clock frequency via clock driver in show_cpuinfo function.

In order to achieve this we also add cpu nodes to device tree which
describes SMP system and add "clocks" properties to all ARC cpu nodes. 

Vlad Zakharov (3):
  ARC: [dts] add input clocks for cpu nodes
  ARC: [dts] add cpu nodes to ARCHS SMP device tree
  arc: get rate from clk driver instead of reading device tree

 arch/arc/boot/dts/skeleton.dtsi        |  1 +
 arch/arc/boot/dts/skeleton_hs.dtsi     |  1 +
 arch/arc/boot/dts/skeleton_hs_idu.dtsi | 21 ++++++++++++++++++++-
 arch/arc/kernel/setup.c                | 17 +++++++++++++----
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.7.4
