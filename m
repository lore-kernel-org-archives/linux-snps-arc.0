From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 20 May 2019 15:43:11 +0200
Subject: [PATCH 0/2] ARC: [plat-hsdk]: GMAC DT Bindings Improvements
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cover.1558359611.git.joabreu@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Add two missing bindings.

Cc: Joao Pinto <jpinto at synopsys.com>
Cc: Rob Herring <robh+dt at kernel.org>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>

Jose Abreu (2):
  ARC: [plat-hsdk]: Add missing multicast filter bins number to GMAC
    node
  ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC node

 arch/arc/boot/dts/hsdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.7.4
