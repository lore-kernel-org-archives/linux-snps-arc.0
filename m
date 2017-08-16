From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Wed, 16 Aug 2017 15:15:14 -0700
Subject: [PATCH v3 0/2] Add platform support for Adaptrum Anarion SOC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170816221516.13609-1-alex.g@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

Changes since v2:
 * Changed compatible binding of uart[1-3] to "ns16550" (they are not DW UARTs)
 * Add support under plat-nsim instead of creating a new stub platform
 * Changed board model to "adaptrum,endor-fpga" to allow LEDE scripts to ID the board
 * Prefix compatible binding with 'arc-'

Changes since v1:
 * Updated CPU core clock to 24 MHz to match HW changes.

Alexandru Gagniuc (2):
  ARC: [plat-sim] Add .compatible property for Adaptrum Anarion SOC
  ARC: DTS: Add device-tree for Anarion-based development board

 arch/arc/boot/dts/adaptrum_anarion.dtsi     | 110 ++++++++++++++++++++++++++++
 arch/arc/boot/dts/adaptrum_anarion_fpga.dts |  51 +++++++++++++
 arch/arc/plat-sim/platform.c                |   1 +
 3 files changed, 162 insertions(+)
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts

-- 
2.9.3
