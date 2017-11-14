From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 14 Nov 2017 17:32:12 +0300
Subject: [PATCH 0/2] ARC: [plat-axs10x]: enable reset controller driver usage
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171114143214.2513-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Use reset controller driver instead of platform quirk for AXS10x boards
to reset DW ethernet controller HW.

Eugeniy Paltsev (2):
  ARC: [plat-axs10x]: DTS: Add reset controller node to manage ethernet
    reset
  ARC: [plat-axs10x]: Remove platform quirk to reset ethernet IP

 arch/arc/boot/dts/axs10x_mb.dtsi | 8 ++++++++
 arch/arc/plat-axs10x/axs10x.c    | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.9.3
